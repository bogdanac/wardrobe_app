import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/image_service.dart';
import '../providers/clothing_provider.dart';

class AddClothingItemScreen extends ConsumerStatefulWidget {
  final ClothingItem? item;

  const AddClothingItemScreen({super.key, this.item});

  @override
  ConsumerState<AddClothingItemScreen> createState() => _AddClothingItemScreenState();
}

class _AddClothingItemScreenState extends ConsumerState<AddClothingItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _imageService = ImageService();
  final _uuid = const Uuid();

  ClothingType _selectedType = ClothingType.top;
  Season? _selectedSeason;
  List<WeatherRange> _selectedWeatherRanges = [];
  List<String> _selectedCategories = [];
  List<String> _selectedTags = [];
  List<Color> _detectedColors = [];
  File? _selectedImage;
  bool _isProcessing = false;

  final List<String> _styleCategories = [
    'brunch with the girls',
    'period safe',
    'mall/errands',
    'work',
    'elegant',
    'classy events',
    'festivals',
    'romantic dates',
    'comfortable',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _initializeWithExistingItem();
    }
  }

  void _initializeWithExistingItem() {
    final item = widget.item!;
    _nameController.text = item.name;
    _notesController.text = item.notes ?? '';
    _selectedType = item.type;
    _selectedSeason = item.season;
    _selectedWeatherRanges = List.from(item.weatherRanges);
    _selectedCategories = List.from(item.categories);
    _selectedTags = List.from(item.tags);
    _detectedColors = item.colors.map((hex) => _hexToColor(hex)).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
        actions: [
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
          padding: const EdgeInsets.all(16),
          children: [
            _buildImageSection(),
            const SizedBox(height: 24),
            _buildNameField(),
            const SizedBox(height: 16),
            _buildTypeSelector(),
            const SizedBox(height: 16),
            _buildSeasonSelector(),
            const SizedBox(height: 16),
            _buildWeatherRangeSelector(),
            const SizedBox(height: 16),
            _buildCategorySelector(),
            const SizedBox(height: 16),
            _buildColorSection(),
            const SizedBox(height: 16),
            _buildTagsField(),
            const SizedBox(height: 16),
            _buildNotesField(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photo',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: _selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.item?.imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(widget.item!.imagePath!),
                          fit: BoxFit.cover,
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
        if (_isProcessing)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: LinearProgressIndicator(),
          ),
      ],
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Item Name',
        hintText: 'e.g., Blue Denim Jacket',
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter an item name';
        }
        return null;
      },
    );
  }

  Widget _buildTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: ClothingType.values.map((type) {
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
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeasonSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Season (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            ChoiceChip(
              label: const Text('None'),
              selected: _selectedSeason == null,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedSeason = null;
                  });
                }
              },
            ),
            ...Season.values.map((season) {
              final isSelected = _selectedSeason == season;
              return ChoiceChip(
                label: Text(_getSeasonLabel(season)),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedSeason = selected ? season : null;
                  });
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherRangeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weather Range',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: WeatherRange.values.map((range) {
            final isSelected = _selectedWeatherRanges.contains(range);
            return FilterChip(
              label: Text(_getWeatherRangeLabel(range)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedWeatherRanges.add(range);
                  } else {
                    _selectedWeatherRanges.remove(range);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Style Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: _addCustomCategory,
              child: const Text('Add Custom'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: _styleCategories.map((category) {
            final isSelected = _selectedCategories.contains(category);
            return FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedCategories.add(category);
                  } else {
                    _selectedCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
        if (_selectedCategories.where((cat) => !_styleCategories.contains(cat)).isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Custom Categories',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: _selectedCategories
                .where((category) => !_styleCategories.contains(category))
                .map((category) {
              return Chip(
                label: Text(category),
                onDeleted: () {
                  setState(() {
                    _selectedCategories.remove(category);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Colors',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        if (_detectedColors.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _detectedColors.map((color) {
              return Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
              );
            }).toList(),
          )
        else
          const Text(
            'Colors will be detected automatically when you add a photo',
            style: TextStyle(
              color: AppTheme.mediumGray,
              fontSize: 14,
            ),
          ),
      ],
    );
  }

  Widget _buildTagsField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Tags (Optional)',
        hintText: 'casual, work, party (separate with commas)',
      ),
      onChanged: (value) {
        _selectedTags = value
            .split(',')
            .map((tag) => tag.trim())
            .where((tag) => tag.isNotEmpty)
            .toList();
      },
      initialValue: _selectedTags.join(', '),
    );
  }

  Widget _buildNotesField() {
    return TextFormField(
      controller: _notesController,
      decoration: const InputDecoration(
        labelText: 'Notes (Optional)',
        hintText: 'Additional details about this item...',
      ),
      maxLines: 3,
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromGallery();
              },
            ),
            if (_selectedImage != null || widget.item?.imagePath != null)
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Photo'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedImage = null;
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
    });

    try {
      final image = await _imageService.pickImageFromCamera();
      if (image != null) {
        await _processImage(image);
      }
    } catch (e) {
      _showErrorSnackBar('Failed to take photo: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final image = await _imageService.pickImageFromGallery();
      if (image != null) {
        await _processImage(image);
      }
    } catch (e) {
      _showErrorSnackBar('Failed to pick image: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _processImage(File image) async {
    try {
      final processedImage = await _imageService.removeBackground(image);
      final colors = await _imageService.extractColors(processedImage);
      
      setState(() {
        _selectedImage = processedImage;
        _detectedColors = colors;
      });
    } catch (e) {
      setState(() {
        _selectedImage = image;
      });
      
      try {
        final colors = await _imageService.extractColors(image);
        setState(() {
          _detectedColors = colors;
        });
      } catch (colorError) {
        _showErrorSnackBar('Failed to extract colors: $colorError');
      }
    }
  }

  void _addCustomCategory() {
    showDialog(
      context: context,
      builder: (context) {
        String categoryName = '';
        return AlertDialog(
          title: const Text('Add Category'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter category name',
            ),
            onChanged: (value) {
              categoryName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (categoryName.trim().isNotEmpty) {
                  setState(() {
                    _selectedCategories.add(categoryName.trim());
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      String? imagePath;
      if (_selectedImage != null) {
        imagePath = await _imageService.saveImage(_selectedImage!);
      } else if (widget.item != null) {
        imagePath = widget.item!.imagePath;
      }

      final item = ClothingItem(
        id: widget.item?.id ?? _uuid.v4(),
        name: _nameController.text.trim(),
        type: _selectedType,
        imagePath: imagePath,
        colors: _detectedColors.map((color) => _colorToHex(color)).toList(),
        categories: _selectedCategories,
        season: _selectedSeason,
        weatherRanges: _selectedWeatherRanges,
        wearCount: widget.item?.wearCount ?? 0,
        lastWornDate: widget.item?.lastWornDate,
        createdAt: widget.item?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        tags: _selectedTags,
      );

      final repository = ref.read(clothingRepositoryProvider);
      if (widget.item == null) {
        await repository.saveClothingItem(item);
      } else {
        await repository.updateClothingItem(item);
      }

      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.item == null ? 'Item added successfully!' : 'Item updated successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      _showErrorSnackBar('Failed to save item: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return 'Top';
      case ClothingType.bottom:
        return 'Bottom';
      case ClothingType.shoes:
        return 'Shoes';
      case ClothingType.accessory:
        return 'Accessory';
      case ClothingType.outerwear:
        return 'Outerwear';
      case ClothingType.undergarment:
        return 'Undergarment';
      case ClothingType.jewelry:
        return 'Jewelry';
      case ClothingType.bag:
        return 'Bag';
      case ClothingType.hat:
        return 'Hat';
      case ClothingType.scarf:
        return 'Scarf';
      case ClothingType.belt:
        return 'Belt';
      case ClothingType.gloves:
        return 'Gloves';
      case ClothingType.swimwear:
        return 'Swimwear';
      case ClothingType.sleepwear:
        return 'Sleepwear';
      case ClothingType.activewear:
        return 'Activewear';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.jumpsuit:
        return 'Jumpsuit';
      case ClothingType.suit:
        return 'Suit';
    }
  }

  String _getSeasonLabel(Season season) {
    switch (season) {
      case Season.spring:
        return 'Spring';
      case Season.summer:
        return 'Summer';
      case Season.autumn:
        return 'Autumn';
      case Season.winter:
        return 'Winter';
      case Season.allSeason:
        return 'All Season';
    }
  }

  String _getWeatherRangeLabel(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return '28°C+';
      case WeatherRange.hot:
        return '22°C+';
      case WeatherRange.warm:
        return '14°C+';
      case WeatherRange.cool:
        return '4°C+';
      case WeatherRange.cold:
        return '-4°C+';
      case WeatherRange.veryCold:
        return '-15°C+';
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
}