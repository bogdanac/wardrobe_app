import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/image_service.dart';
import '../../core/errors/error_handler.dart';
import '../../core/utils/loading_state.dart';
import '../providers/clothing_provider.dart';
import '../widgets/unified_filters.dart';
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
  Season? _selectedSeason;
  List<WeatherRange> _selectedWeatherRanges = [];
  List<String> _selectedCategories = [];
  List<Color> _detectedColors = [];
  List<Color?> _selectedColors = [null, null, null]; // [primary, secondary, accent]
  List<File> _selectedImages = [];
  final List<File> _additionalImages = []; // Additional images without background removal
  List<Map<String, dynamic>> _processedImages = []; // {file: File, colors: List<Color>}
  MetallicElements _selectedMetallicElements = MetallicElements.none;
  bool _isProcessing = false;
  bool _isMultiMode = false;
  LoadingState _loadingState = LoadingState.hidden;
  final ErrorHandler _errorHandler = ErrorHandler();


  @override
  void initState() {
    super.initState();
    
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

  void _initializeWithExistingItem() {
    final item = widget.item!;
    _selectedType = item.type;
    _selectedSeason = item.season;
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
    if (item.imagePath != null) {
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
          if (widget.item != null && !widget.item!.isArchived) ...[
            IconButton(
              onPressed: _isProcessing ? null : _showDeleteDialog,
              icon: Icon(
                Icons.delete_outline,
                color: _isProcessing ? AppTheme.mediumGray : Colors.red,
              ),
              tooltip: 'Delete Item',
            ),
            IconButton(
              onPressed: _isProcessing ? null : _showArchiveDialog,
              icon: Icon(
                Icons.archive_outlined,
                color: _isProcessing ? AppTheme.mediumGray : Colors.orange,
              ),
              tooltip: 'Archive Item',
            ),
          ],
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
            _buildMultiModeToggle(),
            const SizedBox(height: 24),
            UnifiedFilters(
              showCategories: true,
              showSeasons: true,
              showWeather: true,
              showColors: false,
              showClothingTypes: false,
              showFavorites: false,
              showMetallicElements: false,
              selectedCategories: _selectedCategories,
              selectedSeason: _selectedSeason,
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
              onSeasonChanged: (season) {
                setState(() {
                  _selectedSeason = season;
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
            const SizedBox(height: 24),
            _buildMetallicElementsSection(),
            const SizedBox(height: 24),
            _buildColorSection(),
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
        Text(
          _isMultiMode ? 'Photos' : 'Photo',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        if (_isMultiMode) _buildMultiImageSection() else _buildSingleImageSection(),
        const SizedBox(height: 16),
        _buildAdditionalPhotosSection(),
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
    final hasImage = _selectedImages.isNotEmpty || widget.item?.imagePath != null;
    
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
                          child: Image.file(
                            File(widget.item!.imagePath!),
                            fit: BoxFit.contain,
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
        if (hasImage)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: OutlinedButton.icon(
              onPressed: _isProcessing ? null : _showImagePickerOptions,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Replace Image'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.pastelPink,
                side: const BorderSide(color: AppTheme.pastelPink),
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

  Widget _buildMultiModeToggle() {
    return Row(
      children: [
        const Text(
          'Add multiple items',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Switch(
          value: _isMultiMode,
          onChanged: (value) {
            setState(() {
              _isMultiMode = value;
              if (!value) {
                // Keep only the first image when switching to single mode
                if (_selectedImages.length > 1) {
                  _selectedImages = [_selectedImages.first];
                  _processedImages = _processedImages.take(1).toList();
                }
              }
            });
          },
          activeThumbColor: AppTheme.pastelPink,
        ),
      ],
    );
  }



  Widget _buildMetallicElementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Metallic Elements',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
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

  Widget _buildAdditionalPhotosSection() {
    final hasAdditionalImages = _additionalImages.isNotEmpty || (widget.item?.additionalImages.isNotEmpty ?? false);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Additional Photos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryWhite,
              ),
            ),
            SizedBox(width: 8),
            Text(
              '(optional - details, tags, styling)',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.mediumGray,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        if (hasAdditionalImages)
          _buildAdditionalImagesGrid()
        else
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.lightGray.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 20,
                  color: AppTheme.mediumGray,
                ),
                SizedBox(width: 8),
                Text(
                  'Add detail photos (no background removal)',
                  style: TextStyle(
                    color: AppTheme.mediumGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _isProcessing ? null : _pickAdditionalImages,
          icon: const Icon(Icons.add_photo_alternate),
          label: Text(_additionalImages.isEmpty ? 'Add Detail Photos' : 'Add More Photos'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.primaryWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalImagesGrid() {
    final allAdditionalImages = [
      ..._additionalImages,
      ...?widget.item?.additionalImages.map((path) => File(path)),
    ];
    
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allAdditionalImages.length,
        itemBuilder: (context, index) {
          final image = allAdditionalImages[index];
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => _removeAdditionalImage(index),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
            SizedBox(width: 8),
            Text(
              '(tap to change or add)',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.mediumGray,
                fontStyle: FontStyle.italic,
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
                          color: i == 0 && _selectedColors[i] == null
                              ? Colors.red.shade300
                              : Colors.grey.shade300,
                          width: i == 0 && _selectedColors[i] == null ? 2 : 1,
                        ),
                      ),
                      child: _selectedColors[i] == null
                          ? Icon(
                              i == 0 ? Icons.palette : Icons.add,
                              color: i == 0 ? Colors.red.shade300 : Colors.grey.shade400,
                              size: 24,
                            )
                          : null,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      i == 0 ? 'Primary*' : i == 1 ? 'Secondary' : 'Accent',
                      style: TextStyle(
                        fontSize: 10,
                        color: i == 0 && _selectedColors[i] == null
                            ? Colors.red.shade300
                            : AppTheme.mediumGray,
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

    for (final image in _selectedImages) {
      try {
        final processedImage = await _imageService.removeBackground(image);
        final colors = await _imageService.extractColors(processedImage, maxColors: 1);
        
        _processedImages.add({
          'file': processedImage,
          'colors': colors,
        });
        allColors.addAll(colors);
      } catch (e) {
        try {
          final colors = await _imageService.extractColors(image, maxColors: 1);
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

  void _removeAdditionalImage(int index) {
    setState(() {
      if (index < _additionalImages.length) {
        _additionalImages.removeAt(index);
      }
    });
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
            season: _selectedSeason,
            weatherRanges: _selectedWeatherRanges,
            wearCount: 0,
            lastWornDate: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            notes: null,
            tags: [],
            metallicElements: _selectedMetallicElements,
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
          imagePath = await _imageService.saveImage(processedFile);
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
          season: _selectedSeason,
          weatherRanges: _selectedWeatherRanges,
          wearCount: widget.item?.wearCount ?? 0,
          lastWornDate: widget.item?.lastWornDate,
          createdAt: widget.item?.createdAt ?? DateTime.now(),
          updatedAt: DateTime.now(),
          notes: null,
          tags: [],
          metallicElements: _selectedMetallicElements,
        );

        if (widget.item == null) {
          await repository.saveClothingItem(item);
        } else {
          await repository.updateClothingItem(item);
        }

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
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
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
      if (result == true) {
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
      if (result == true) {
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
        const Text(
          'Select the type that best describes this clothing item.',
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.mediumGray,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.lightGray.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppTheme.pastelPink.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              // Main clothing types (most common)
              const Text(
                'Main Types',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ClothingType.top,
                  ClothingType.bottom,
                  ClothingType.dress,
                  ClothingType.shoes,
                  ClothingType.outerwear,
                ].map((type) => _buildTypeChip(type, isMain: true)).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Specific Types',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ClothingType.jumpsuit,
                  ClothingType.suit,
                  ClothingType.swimwear,
                  ClothingType.sleepwear,
                  ClothingType.activewear,
                  ClothingType.undergarment,
                ].map((type) => _buildTypeChip(type)).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Accessories',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ClothingType.accessory,
                  ClothingType.jewelry,
                  ClothingType.bag,
                  ClothingType.hat,
                  ClothingType.scarf,
                  ClothingType.belt,
                  ClothingType.gloves,
                ].map((type) => _buildTypeChip(type)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChip(ClothingType type, {bool isMain = false}) {
    final isSelected = _selectedType == type;
    return ChoiceChip(
      label: Text(
        _getTypeLabel(type),
        style: TextStyle(
          fontSize: isMain ? 14 : 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedType = type;
          });
        }
      },
      selectedColor: AppTheme.pastelPink.withValues(alpha: 0.8),
      backgroundColor: isMain
          ? AppTheme.primaryWhite
          : AppTheme.mediumGray.withValues(alpha: 0.1),
      padding: EdgeInsets.symmetric(
        horizontal: isMain ? 12 : 8,
        vertical: isMain ? 8 : 4,
      ),
    );
  }

  void _showColorPicker(int colorIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose ${colorIndex == 0 ? 'Primary' : colorIndex == 1 ? 'Secondary' : 'Accent'} Color'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Common colors grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _commonColors.length,
                itemBuilder: (context, index) {
                  final color = _commonColors[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColors[colorIndex] = color;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          if (colorIndex > 0 && _selectedColors[colorIndex] != null)
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedColors[colorIndex] = null;
                });
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  final List<Color> _commonColors = [
    // Basic colors
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.brown,
    Colors.indigo,
    // Additional shades
    Colors.red.shade300,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Colors.blue.shade300,
    Colors.cyan.shade300,
    Colors.teal.shade300,
    Colors.green.shade300,
    Colors.yellow.shade300,
    Colors.orange.shade300,
    Colors.brown.shade300,
    Colors.grey.shade300,
    Colors.indigo.shade300,
    Colors.red.shade700,
    Colors.pink.shade700,
    Colors.purple.shade700,
    Colors.blue.shade700,
    Colors.cyan.shade700,
    Colors.teal.shade700,
    Colors.green.shade700,
    Colors.yellow.shade700,
    Colors.orange.shade700,
    Colors.brown.shade700,
    Colors.grey.shade700,
    Colors.indigo.shade700,
  ];

  String _generateItemName(ClothingType type, int index) {
    final typeName = _getTypeLabel(type);
    return '$typeName #$index';
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Top';
      case ClothingType.bottom: return 'Bottom';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.accessory: return 'Accessory';
      case ClothingType.outerwear: return 'Outerwear';
      case ClothingType.undergarment: return 'Undergarment';
      case ClothingType.jewelry: return 'Jewelry';
      case ClothingType.bag: return 'Bag';
      case ClothingType.hat: return 'Hat';
      case ClothingType.scarf: return 'Scarf';
      case ClothingType.belt: return 'Belt';
      case ClothingType.gloves: return 'Gloves';
      case ClothingType.swimwear: return 'Swimwear';
      case ClothingType.sleepwear: return 'Sleepwear';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.dress: return 'Dress';
      case ClothingType.jumpsuit: return 'Jumpsuit';
      case ClothingType.suit: return 'Suit';
    }
  }
}