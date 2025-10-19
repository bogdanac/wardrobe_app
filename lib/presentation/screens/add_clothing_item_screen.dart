import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/image_service.dart';
import '../../core/services/color_palette_service.dart';
import '../../core/errors/error_handler.dart';
import '../../core/utils/loading_state.dart';
import '../providers/clothing_provider.dart';
import '../providers/custom_color_provider.dart';
import '../widgets/maximalist_clothing_item_filters.dart';
import '../widgets/adaptive_clothing_image.dart';
import 'archive_confirmation_screen.dart';
import 'delete_confirmation_screen.dart';

class AddClothingItemScreen extends ConsumerStatefulWidget {
  final ClothingItem? item;
  final File? initialImage;
  final List<Color>? initialColors;

  const AddClothingItemScreen({
    super.key, 
    this.item,
    this.initialImage,
    this.initialColors,
  });

  @override
  ConsumerState<AddClothingItemScreen> createState() => _AddClothingItemScreenState();
}

class _AddClothingItemScreenState extends ConsumerState<AddClothingItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imageService = ImageService();
  final _uuid = const Uuid();

  ClothingType _selectedType = ClothingType.top;
  List<Season> _selectedSeasons = [];
  List<WeatherRange> _selectedWeatherRanges = [];
  List<String> _selectedCategories = [];
  List<Color> _detectedColors = [];
  final List<Color?> _selectedColors = [null, null, null]; // [primary, secondary, accent]
  List<File> _selectedImages = [];
  File? _originalImage; // Keep original image for re-processing
  File? _beforeCropImage; // Keep image before cropping for undo
  final List<File> _additionalImages = []; // Additional images without background removal
  List<Map<String, dynamic>> _processedImages = []; // {file: File, colors: List<Color>}
  MetallicElements _selectedMetallicElements = MetallicElements.none;
  bool _isProcessing = false;
  final bool _isMultiMode = false;
  LoadingState _loadingState = LoadingState.hidden;
  final ErrorHandler _errorHandler = ErrorHandler();
  List<Map<String, String>> _paletteColors = [];


  @override
  void initState() {
    super.initState();
    _loadPaletteColors();

    // Handle initial image from bulk add
    if (widget.initialImage != null) {
      _selectedImages = [widget.initialImage!];
      _processedImages = [{
        'file': widget.initialImage!,
        'colors': widget.initialColors ?? [],
      }];
      _detectedColors = widget.initialColors ?? [];
    }

    if (widget.item != null) {
      _initializeWithExistingItem();
    }
  }

  Future<void> _loadPaletteColors() async {
    final customColorRepository = ref.read(customColorRepositoryProvider);
    final colorService = ColorPaletteService(customColorRepository);
    final colors = await colorService.getColors();
    setState(() {
      _paletteColors = colors;
    });
  }

  void _initializeWithExistingItem() {
    final item = widget.item!;
    _selectedType = item.type;
    _selectedSeasons = List.from(item.seasons);
    _selectedWeatherRanges = List.from(item.weatherRanges);
    _selectedCategories = List.from(item.categories);
    _selectedMetallicElements = item.metallicElements;

    // Initialize colors from existing item
    final itemColors = item.colors.map((hex) => _hexToColor(hex)).toList();
    _detectedColors = itemColors;
    for (int i = 0; i < itemColors.length && i < 3; i++) {
      _selectedColors[i] = itemColors[i];
    }

    // Initialize with existing image if available
    // Don't add to _selectedImages if it's a network URL - it will be displayed separately
    if (item.imagePath != null && !item.imagePath!.startsWith('http')) {
      _selectedImages = [File(item.imagePath!)];
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
      if (index < _processedImages.length) {
        _processedImages.removeAt(index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
        actions: [
          if (_selectedImages.isNotEmpty || widget.item?.imagePath != null)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              enabled: !_isProcessing,
              onSelected: (value) {
                switch (value) {
                  case 'remove_bg':
                    _reprocessBackgroundRemoval();
                    break;
                  case 'crop_transparent':
                    _cropTransparentSpace();
                    break;
                  case 'undo_crop':
                    _undoCrop();
                    break;
                  case 'replace_image':
                    _showImagePickerOptions();
                    break;
                  case 'add_images':
                    _pickAdditionalImages();
                    break;
                  case 'delete':
                    if (widget.item != null) _showDeleteDialog();
                    break;
                  case 'archive':
                    if (widget.item != null) _showArchiveDialog();
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'replace_image',
                  child: Row(
                    children: [
                      Icon(Icons.photo_camera, color: AppTheme.pastelPink),
                      SizedBox(width: 12),
                      Text('Replace Image'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'remove_bg',
                  child: Row(
                    children: [
                      Icon(Icons.auto_fix_high, color: AppTheme.info),
                      SizedBox(width: 12),
                      Text('Remove Background'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'crop_transparent',
                  child: Row(
                    children: [
                      Icon(Icons.crop, color: AppTheme.pastelPink),
                      SizedBox(width: 12),
                      Text('Crop Transparent Space'),
                    ],
                  ),
                ),
                if (_beforeCropImage != null)
                  const PopupMenuItem(
                    value: 'undo_crop',
                    child: Row(
                      children: [
                        Icon(Icons.undo, color: Colors.orange),
                        SizedBox(width: 12),
                        Text('Undo Crop'),
                      ],
                    ),
                  ),
                const PopupMenuItem(
                  value: 'add_images',
                  child: Row(
                    children: [
                      Icon(Icons.add_photo_alternate, color: AppTheme.info),
                      SizedBox(width: 12),
                      Text('Add More Images'),
                    ],
                  ),
                ),
                if (widget.item != null && !widget.item!.isArchived) ...[
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'archive',
                    child: Row(
                      children: [
                        Icon(Icons.archive_outlined, color: Colors.orange),
                        SizedBox(width: 12),
                        Text('Archive Item'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        SizedBox(width: 12),
                        Text('Delete Item'),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          TextButton(
            onPressed: _isProcessing ? null : _saveItem,
            child: Text(
              'Save',
              style: TextStyle(
                color: _isProcessing ? AppTheme.mediumGray : AppTheme.pastelPink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          children: [
            _buildImageSection(),
            const SizedBox(height: 24),
            _buildClothingTypeSection(),
            const SizedBox(height: 24),
            MaximalistClothingItemFilters(
              showCategories: false,
              showSeasons: true,
              showWeather: true,
              showColors: false,
              showClothingTypes: false,
              showFavorites: false,
              showMetallicElements: false,
              selectedCategories: _selectedCategories,
              selectedSeasons: _selectedSeasons,
              selectedWeatherRanges: _selectedWeatherRanges,
              selectedColors: const [],
              selectedTypes: [_selectedType],
              selectedFavorites: null,
              selectedMetallicElements: _selectedMetallicElements,
              onCategoriesChanged: (categories) {
                setState(() {
                  _selectedCategories = categories;
                });
              },
              onSeasonsChanged: (seasons) {
                setState(() {
                  _selectedSeasons = seasons;
                });
              },
              onWeatherChanged: (ranges) {
                setState(() {
                  _selectedWeatherRanges = ranges;
                });
              },
              onColorsChanged: (colors) {},
              onTypesChanged: (types) {
                if (types.isNotEmpty) {
                  setState(() {
                    _selectedType = types.first;
                  });
                }
              },
              onFavoritesChanged: (favorites) {},
              onMetallicElementsChanged: (elements) {
                setState(() {
                  _selectedMetallicElements = elements ?? MetallicElements.none;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildColorSection(),
            const SizedBox(height: 24),
            _buildMetallicElementsSection(),
            const SizedBox(height: 24),
            MaximalistClothingItemFilters(
              showCategories: true,
              showSeasons: false,
              showWeather: false,
              showColors: false,
              showClothingTypes: false,
              showFavorites: false,
              showMetallicElements: false,
              selectedCategories: _selectedCategories,
              selectedSeasons: _selectedSeasons,
              selectedWeatherRanges: _selectedWeatherRanges,
              selectedColors: const [],
              selectedTypes: [_selectedType],
              selectedFavorites: null,
              selectedMetallicElements: _selectedMetallicElements,
              onCategoriesChanged: (categories) {
                setState(() {
                  _selectedCategories = categories;
                });
              },
              onSeasonsChanged: (seasons) {},
              onWeatherChanged: (ranges) {},
              onColorsChanged: (colors) {},
              onTypesChanged: (types) {},
              onFavoritesChanged: (favorites) {},
              onMetallicElementsChanged: (elements) {},
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_isMultiMode) _buildMultiImageSection() else _buildSingleImageSection(),
        if (_loadingState.isVisible)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: AppLoadingWidget(
              state: _loadingState,
              size: 80,
            ),
          ),
      ],
    );
  }

  Widget _buildSingleImageSection() {

    return Column(
      children: [
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: _selectedImages.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        _selectedImages.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : widget.item?.imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AdaptiveClothingImage(
                            imagePath: widget.item!.imagePath,
                            type: widget.item!.type,
                          ),
                        ),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 48,
                            color: AppTheme.mediumGray,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tap to add photo',
                            style: TextStyle(
                              color: AppTheme.mediumGray,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultiImageSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 48,
                  color: AppTheme.mediumGray,
                ),
                SizedBox(height: 8),
                Text(
                  'Tap to select multiple photos',
                  style: TextStyle(
                    color: AppTheme.mediumGray,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_selectedImages.isNotEmpty) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _selectedImages[index],
                          fit: BoxFit.contain,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _removeImage(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }




  Widget _buildMetallicElementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 0,
          children: MetallicElements.values.map((element) {
            final isSelected = _selectedMetallicElements == element;
            return ChoiceChip(
              label: Text(_getMetallicElementsLabel(element)),
              selected: isSelected,
              selectedColor: _getMetallicElementsColor(element),
              backgroundColor: _getMetallicElementsColor(element).withValues(alpha: 0.2),
              onSelected: (selected) {
                setState(() {
                  _selectedMetallicElements = element;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }



  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (int i = 0; i < 3; i++) ...[
              GestureDetector(
                onTap: () => _showColorPicker(i),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _selectedColors[i] ?? Colors.grey.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: _selectedColors[i] == null
                          ? Icon(
                              i == 0 ? Icons.palette : Icons.add,
                              color: Colors.grey.shade400,
                              size: 24,
                            )
                          : null,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      i == 0 ? 'Primary' : i == 1 ? 'Secondary' : 'Accent',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppTheme.mediumGray,
                        fontWeight: i == 0 ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                    if (_selectedColors[i] != null && i > 0)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColors[i] = null;
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
              if (i < 2) const SizedBox(width: 20),
            ],
          ],
        ),
        if (_selectedColors[0] == null)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Primary color will be detected automatically when you add a photo, or tap to choose manually',
              style: TextStyle(
                color: AppTheme.mediumGray,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }


  void _showImagePickerOptions() {
    final hasImages = _selectedImages.isNotEmpty || widget.item?.imagePath != null;
    
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_isMultiMode) ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromCamera();
              },
            ),
            ListTile(
              leading: Icon(_isMultiMode ? Icons.photo_library : Icons.photo_library),
              title: Text(_isMultiMode ? 'Choose Multiple from Gallery' : 'Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                if (_isMultiMode) {
                  _pickMultipleImagesFromGallery();
                } else {
                  _pickImageFromGallery();
                }
              },
            ),
            if (hasImages)
              ListTile(
                leading: const Icon(Icons.delete),
                title: Text(_isMultiMode ? 'Remove All Photos' : 'Remove Photo'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedImages.clear();
                    _processedImages.clear();
                    _detectedColors.clear();
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    setState(() {
      _isProcessing = true;
      _loadingState = const LoadingState(
        type: LoadingType.loading,
        message: 'Taking photo...',
      );
    });

    try {
      final image = await _imageService.pickImageFromCamera();
      if (image != null) {
        _originalImage = image; // Save original
        _selectedImages = [image];
        await _processImages();
      }
    } catch (e) {
      _handleError(e, 'taking photo');
    } finally {
      setState(() {
        _isProcessing = false;
        _loadingState = LoadingState.hidden;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isProcessing = true;
      _loadingState = const LoadingState(
        type: LoadingType.loading,
        message: 'Selecting image...',
      );
    });

    try {
      final image = await _imageService.pickImageFromGallery();
      if (image != null) {
        _originalImage = image; // Save original
        _selectedImages = [image];
        await _processImages();
      }
    } catch (e) {
      _handleError(e, 'picking image from gallery');
    } finally {
      setState(() {
        _isProcessing = false;
        _loadingState = LoadingState.hidden;
      });
    }
  }

  Future<void> _pickMultipleImagesFromGallery() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final images = await _imageService.pickMultipleImagesFromGallery();
      if (images.isNotEmpty) {
        _selectedImages = images;
        await _processImages();
      }
    } catch (e) {
      _handleError(e, 'picking multiple images');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _processImages() async {
    _processedImages.clear();
    final allColors = <Color>[];
    final customColorRepository = ref.read(customColorRepositoryProvider);

    for (final image in _selectedImages) {
      try {
        final processedImage = await _imageService.removeBackground(image);
        final colors = await _imageService.extractColors(processedImage, customColorRepository: customColorRepository, maxColors: 1);

        _processedImages.add({
          'file': processedImage,
          'colors': colors,
        });
        allColors.addAll(colors);
      } catch (e) {
        try {
          final colors = await _imageService.extractColors(image, customColorRepository: customColorRepository, maxColors: 1);
          _processedImages.add({
            'file': image,
            'colors': colors,
          });
          allColors.addAll(colors);
        } catch (colorError) {
          _handleError(colorError, 'extracting colors');
          _processedImages.add({
            'file': image,
            'colors': <Color>[],
          });
        }
      }
    }

    setState(() {
      // Only keep the main detected color - user can add more manually
      if (_isMultiMode) {
        // For multi mode, use the most common color across all images
        if (allColors.isNotEmpty) {
          _detectedColors = [allColors.first];
          _selectedColors[0] = allColors.first; // Set as primary color
        } else {
          _detectedColors = [];
        }
      } else {
        // For single mode, use the main detected color only
        final detectedColor = _processedImages.isNotEmpty
            ? (_processedImages.first['colors'] as List<Color>).take(1).toList()
            : <Color>[];
        _detectedColors = detectedColor;
        if (detectedColor.isNotEmpty) {
          _selectedColors[0] = detectedColor.first; // Set as primary color
        }
      }
    });
  }

  Future<void> _reprocessBackgroundRemoval() async {
    if (_originalImage == null && _selectedImages.isEmpty && widget.item?.imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image to process')),
      );
      return;
    }

    setState(() {
      _isProcessing = true;
      _loadingState = const LoadingState(
        type: LoadingType.processing,
        message: 'Removing background...',
      );
    });

    try {
      File imageToProcess;

      // Use the original image if available, otherwise fall back to current image
      if (_originalImage != null) {
        imageToProcess = _originalImage!;
      } else if (_selectedImages.isNotEmpty) {
        imageToProcess = _selectedImages.first;
      } else if (widget.item?.imagePath != null) {
        imageToProcess = File(widget.item!.imagePath!);
      } else {
        throw Exception('No image available');
      }

      // Remove background again
      final processedImage = await _imageService.removeBackground(imageToProcess);

      // Extract colors from the new processed image
      final customColorRepository = ref.read(customColorRepositoryProvider);
      final colors = await _imageService.extractColors(processedImage, customColorRepository: customColorRepository, maxColors: 3);

      setState(() {
        _selectedImages = [processedImage];
        _processedImages = [{
          'file': processedImage,
          'colors': colors,
        }];

        // Update detected colors
        _detectedColors = colors.take(1).toList();
        if (colors.isNotEmpty) {
          _selectedColors[0] = colors.first;
        }

        _isProcessing = false;
        _loadingState = const LoadingState(
          type: LoadingType.processing,
          message: 'Background removed successfully!',
        );
      });

      // Hide success message after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _loadingState = LoadingState.hidden;
          });
        }
      });

    } catch (e) {
      setState(() {
        _isProcessing = false;
        _loadingState = LoadingState(
          type: LoadingType.processing,
          message: 'Failed to remove background: ${e.toString()}',
        );
      });

      // Hide error message after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _loadingState = LoadingState.hidden;
          });
        }
      });
    }
  }

  Future<void> _cropTransparentSpace() async {
    if (_selectedImages.isEmpty && widget.item?.imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image to crop')),
      );
      return;
    }

    setState(() {
      _isProcessing = true;
      _loadingState = const LoadingState(
        type: LoadingType.processing,
        message: 'Cropping transparent space...',
      );
    });

    try {
      File imageToProcess;
      List<int> imageBytes;

      if (_selectedImages.isNotEmpty) {
        imageToProcess = _selectedImages.first;
        imageBytes = await imageToProcess.readAsBytes();
      } else if (widget.item?.imagePath != null) {
        final imagePath = widget.item!.imagePath!;

        // Check if it's a network URL (Firebase)
        if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
          // Download the image from Firebase
          final response = await http.get(Uri.parse(imagePath));
          if (response.statusCode != 200) {
            throw Exception('Failed to download image from Firebase');
          }
          imageBytes = response.bodyBytes;

          // Save to temp file for undo
          final tempDir = await Directory.systemTemp.createTemp('original_');
          imageToProcess = File('${tempDir.path}/original_${DateTime.now().millisecondsSinceEpoch}.png');
          await imageToProcess.writeAsBytes(imageBytes);
        } else {
          // Local file
          imageToProcess = File(imagePath);
          imageBytes = await imageToProcess.readAsBytes();
        }
      } else {
        throw Exception('No image available');
      }

      // Save current image for undo
      _beforeCropImage = imageToProcess;

      // Decode the image
      final decodedImage = img.decodeImage(Uint8List.fromList(imageBytes));

      if (decodedImage == null) {
        throw Exception('Failed to decode image');
      }

      // Find bounding box of non-transparent pixels
      int minX = decodedImage.width;
      int minY = decodedImage.height;
      int maxX = 0;
      int maxY = 0;
      bool hasContent = false;

      for (int y = 0; y < decodedImage.height; y++) {
        for (int x = 0; x < decodedImage.width; x++) {
          final pixel = decodedImage.getPixel(x, y);
          final alpha = pixel.a;

          // If pixel is not fully transparent
          if (alpha > 10) { // Small threshold to ignore nearly transparent pixels
            hasContent = true;
            if (x < minX) minX = x;
            if (x > maxX) maxX = x;
            if (y < minY) minY = y;
            if (y > maxY) maxY = y;
          }
        }
      }

      if (!hasContent) {
        throw Exception('Image appears to be completely transparent');
      }

      // Add small padding (5% of dimensions)
      final paddingX = ((maxX - minX) * 0.05).round().clamp(5, 20);
      final paddingY = ((maxY - minY) * 0.05).round().clamp(5, 20);

      minX = (minX - paddingX).clamp(0, decodedImage.width - 1);
      minY = (minY - paddingY).clamp(0, decodedImage.height - 1);
      maxX = (maxX + paddingX).clamp(0, decodedImage.width - 1);
      maxY = (maxY + paddingY).clamp(0, decodedImage.height - 1);

      // Crop the image
      final croppedImage = img.copyCrop(
        decodedImage,
        x: minX,
        y: minY,
        width: maxX - minX + 1,
        height: maxY - minY + 1,
      );

      // Save the cropped image
      final tempDir = await Directory.systemTemp.createTemp('crop_');
      final croppedFile = File('${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png');
      await croppedFile.writeAsBytes(img.encodePng(croppedImage));

      setState(() {
        _selectedImages = [croppedFile];
        if (_processedImages.isNotEmpty) {
          _processedImages[0]['file'] = croppedFile;
        }
        _isProcessing = false;
        _loadingState = const LoadingState(
          type: LoadingType.processing,
          message: 'Transparent space cropped successfully!',
        );
      });

      // Hide success message after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _loadingState = LoadingState.hidden;
          });
        }
      });

    } catch (e) {
      setState(() {
        _isProcessing = false;
        _loadingState = LoadingState(
          type: LoadingType.processing,
          message: 'Failed to crop: ${e.toString()}',
        );
      });

      // Hide error message after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _loadingState = LoadingState.hidden;
          });
        }
      });
    }
  }

  void _undoCrop() {
    if (_beforeCropImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No crop to undo')),
      );
      return;
    }

    setState(() {
      _selectedImages = [_beforeCropImage!];
      if (_processedImages.isNotEmpty) {
        _processedImages[0]['file'] = _beforeCropImage!;
      }
      _beforeCropImage = null; // Clear undo history after using it
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Crop undone'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _pickAdditionalImages() async {
    try {
      final images = await _imageService.pickMultipleImagesFromGallery();
      if (images.isNotEmpty) {
        setState(() {
          _additionalImages.addAll(images);
        });
      }
    } catch (e) {
      _handleError(e, 'picking additional images');
    }
  }


  Future<void> _saveItem() async {

    setState(() {
      _isProcessing = true;
    });

    try {
      final repository = ref.read(clothingRepositoryProvider);

      if (_isMultiMode) {
        // Save multiple items
        final itemsToSave = <ClothingItem>[];
        
        for (int i = 0; i < _processedImages.length; i++) {
          final processedData = _processedImages[i];
          final processedFile = processedData['file'] as File;
          // Colors are handled via _selectedColors now
          
          final imagePath = await _imageService.saveImage(processedFile);
          
          final item = ClothingItem(
            id: _uuid.v4(),
            name: _generateItemName(_selectedType, i + 1),
            brand: null,
            type: _selectedType,
            imagePath: imagePath,
            colors: _selectedColors.where((c) => c != null).map((color) => _colorToHex(color!)).toList(),
            categories: _selectedCategories,
            seasons: _selectedSeasons,
            weatherRanges: _selectedWeatherRanges,
            wearCount: 0,
            lastWornDate: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            notes: null,
            tags: const [],
            metallicElements: _selectedMetallicElements,
            sizeFit: SizeFit.perfect,
            isArchived: false,
          );
          
          itemsToSave.add(item);
        }

        // Save all items
        for (final item in itemsToSave) {
          await repository.saveClothingItem(item);
        }

        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${itemsToSave.length} items added successfully!'),
              backgroundColor: AppTheme.pastelPink,
            ),
          );
        }
      } else {
        // Save single item (existing logic)
        String? imagePath;
        if (_processedImages.isNotEmpty) {
          final processedFile = _processedImages.first['file'] as File;

          // Check if we're updating an existing item with a Firebase image
          if (widget.item?.imagePath != null &&
              (widget.item!.imagePath!.startsWith('http://') ||
               widget.item!.imagePath!.startsWith('https://'))) {
            // Upload new cropped image to Firebase and delete old one
            final firebaseImageService = ref.read(firebaseImageServiceProvider);
            final oldImageUrl = widget.item!.imagePath!;

            // Upload the new cropped image
            imagePath = await firebaseImageService.uploadImage(processedFile);

            // Delete the old image from Firebase
            try {
              await firebaseImageService.deleteImage(oldImageUrl);
            } catch (e) {
              // Ignore deletion errors - the new image is already uploaded
            }
          } else {
            // Local storage
            imagePath = await _imageService.saveImage(processedFile);
          }
        } else if (widget.item?.imagePath != null) {
          imagePath = widget.item!.imagePath;
        }

        // Save additional images
        final additionalImagePaths = <String>[];
        for (final additionalImage in _additionalImages) {
          final additionalPath = await _imageService.saveImage(additionalImage);
          additionalImagePaths.add(additionalPath);
        }

        final item = ClothingItem(
          id: widget.item?.id ?? _uuid.v4(),
          name: widget.item?.name ?? _generateItemName(_selectedType, 1),
          brand: null,
          type: _selectedType,
          imagePath: imagePath,
          additionalImages: additionalImagePaths,
          colors: _selectedColors.where((c) => c != null).map((color) => _colorToHex(color!)).toList(),
          categories: _selectedCategories,
          seasons: _selectedSeasons,
          weatherRanges: _selectedWeatherRanges,
          wearCount: widget.item?.wearCount ?? 0,
          lastWornDate: widget.item?.lastWornDate,
          createdAt: widget.item?.createdAt ?? DateTime.now(),
          updatedAt: DateTime.now(),
          notes: null,
          tags: widget.item?.tags ?? const [],
          metallicElements: _selectedMetallicElements,
          sizeFit: widget.item?.sizeFit ?? SizeFit.perfect,
          isArchived: widget.item?.isArchived ?? false,
        );

        // Always use updateClothingItem since it handles both insert and update
        await repository.updateClothingItem(item);

        if (mounted) {
          Navigator.pop(context, true); // Return success for bulk add
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(widget.item == null ? 'Item added successfully!' : 'Item updated successfully!'),
              backgroundColor: AppTheme.pastelPink,
            ),
          );
        }
      }

      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);
    } catch (e) {
      _handleError(e, 'saving clothing item');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _handleError(dynamic error, String errorContext) {
    if (mounted) {
      final appException = _errorHandler.handleError(error, context: errorContext);
      _errorHandler.showErrorSnackBar(context, appException);
    }
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return AppTheme.mediumGray;
    }
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';
  }

  String _getMetallicElementsLabel(MetallicElements elements) {
    switch (elements) {
      case MetallicElements.none:
        return 'None';
      case MetallicElements.gold:
        return 'Gold';
      case MetallicElements.silver:
        return 'Silver';
    }
  }

  Color _getMetallicElementsColor(MetallicElements elements) {
    switch (elements) {
      case MetallicElements.none:
        return Colors.grey;
      case MetallicElements.gold:
        return const Color(0xFFFFD700);
      case MetallicElements.silver:
        return const Color(0xFFC0C0C0);
    }
  }

  void _showArchiveDialog() {
    if (widget.item == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArchiveConfirmationScreen(
          clothingItem: widget.item!,
        ),
      ),
    ).then((result) {
      if (result == true && mounted) {
        // Item was archived, go back to previous screen
        Navigator.pop(context);
      }
    });
  }

  void _showDeleteDialog() {
    if (widget.item == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteConfirmationScreen(
          clothingItem: widget.item!,
        ),
      ),
    ).then((result) {
      if (result == true && mounted) {
        // Item was deleted, go back to previous screen
        Navigator.pop(context);
      }
    });
  }

  Widget _buildClothingTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'What type of clothing is this?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 0,
          children: ClothingType.values.map((type) => _buildTypeChip(type)).toList(),
        ),
      ],
    );
  }

  Widget _buildTypeChip(ClothingType type) {
    final isSelected = _selectedType == type;
    return ChoiceChip(
      label: Text(_getTypeLabel(type)),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedType = type;
          });
        }
      },
      selectedColor: AppTheme.pastelPink,
      backgroundColor: AppTheme.pastelPink.withValues(alpha: 0.3),
      side: BorderSide.none,
    );
  }

  void _showColorPicker(int colorIndex) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        backgroundColor: AppTheme.primaryBlack,
        title: Text(
          'Choose ${colorIndex == 0 ? 'Primary' : colorIndex == 1 ? 'Secondary' : 'Accent'} Color',
          style: const TextStyle(color: AppTheme.primaryWhite),
        ),
        content: SizedBox(
          width: 300,
          height: 500,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: _paletteColors.length,
            itemBuilder: (context, index) {
              final colorData = _paletteColors[index];
              final color = _hexToColor(colorData['hex']!);
              final isSelected = _selectedColors[colorIndex] == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColors[colorIndex] = color;
                  });
                  Navigator.pop(dialogContext);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? AppTheme.pastelPink : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                              size: 20,
                            )
                          : null,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      colorData['name']!,
                      style: const TextStyle(fontSize: 10, color: AppTheme.primaryWhite),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          if (colorIndex > 0 && _selectedColors[colorIndex] != null)
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedColors[colorIndex] = null;
                });
                Navigator.pop(dialogContext);
              },
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
            ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  String _generateItemName(ClothingType type, int index) {
    final typeName = _getTypeLabel(type);
    return '$typeName #$index';
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Top';
      case ClothingType.bottom: return 'Bottom';
      case ClothingType.dress: return 'Dress';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.bag: return 'Bag';
      case ClothingType.accessory: return 'Accessory';
      case ClothingType.outerwear: return 'Coat';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.swimwear: return 'Swimwear';
    }
  }
}