import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/color_palette.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/firebase_image_service.dart';
import '../providers/color_palette_provider.dart';
import '../providers/custom_color_provider.dart';
import '../providers/auth_provider.dart';

class CreateColorPaletteScreen extends ConsumerStatefulWidget {
  final ColorPalette? palette;

  const CreateColorPaletteScreen({super.key, this.palette});

  @override
  ConsumerState<CreateColorPaletteScreen> createState() => _CreateColorPaletteScreenState();
}

class _CreateColorPaletteScreenState extends ConsumerState<CreateColorPaletteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _uuid = const Uuid();

  final List<Color> _selectedColors = [];
  List<Map<String, String>> _availableColors = [];
  File? _selectedImage;
  String? _existingImagePath;
  bool _isSaving = false;
  bool _isLoadingColors = true;
  late FirebaseImageService _imageService;

  @override
  void initState() {
    super.initState();
    final userId = ref.read(currentUserIdProvider);
    _imageService = FirebaseImageService(userId: userId);

    if (widget.palette != null) {
      _nameController.text = widget.palette!.name ?? '';
      _selectedColors.addAll(widget.palette!.colors);
      _existingImagePath = widget.palette!.imagePath;
    }

    _loadAvailableColors();
  }

  Future<void> _loadAvailableColors() async {
    final customColorRepository = ref.read(customColorRepositoryProvider);
    final customColors = await customColorRepository.getAllColors();
    final colors = customColors.map((c) => {'name': c.name, 'hex': c.hex}).toList();
    if (mounted) {
      setState(() {
        _availableColors = colors;
        _isLoadingColors = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.palette == null ? 'Create Color Palette' : 'Edit Color Palette'),
        actions: [
          if (widget.palette != null)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: _showDeleteDialog,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildImageSection(),
            const SizedBox(height: 24),
            _buildNameField(),
            const SizedBox(height: 24),
            _buildColorsSection(),
            const SizedBox(height: 32),
            _buildSaveButton(),
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
          'Reference Image (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
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
                : _existingImagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _existingImagePath!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 48,
                            color: AppTheme.mediumGray,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tap to add inspiration image',
                            style: TextStyle(
                              color: AppTheme.mediumGray,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
          ),
        ),
        if (_selectedImage != null || _existingImagePath != null)
          TextButton.icon(
            onPressed: () {
              setState(() {
                _selectedImage = null;
                _existingImagePath = null;
              });
            },
            icon: const Icon(Icons.delete, size: 16),
            label: const Text('Remove image'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
      ],
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'e.g., Summer Vibes, Elegant Night',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppTheme.lightGray,
          ),
        ),
      ],
    );
  }

  Widget _buildColorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '(${_selectedColors.length}/3)',
              style: TextStyle(
                fontSize: 14,
                color: _selectedColors.length >= 2 && _selectedColors.length <= 3
                    ? AppTheme.pastelPink
                    : Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Select 2-3 colors for your palette',
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.mediumGray,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ..._selectedColors.asMap().entries.map((entry) {
              final index = entry.key;
              final color = entry.value;
              return _buildColorCircle(color, index);
            }),
            if (_selectedColors.length < 3)
              GestureDetector(
                onTap: _addColor,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGray,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.mediumGray.withValues(alpha: 0.3),
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 32,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorCircle(Color color, int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _editColor(index),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _removeColor(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    final canSave = _selectedColors.length >= 2 && _selectedColors.length <= 3;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: canSave && !_isSaving ? _savePalette : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.pastelPink,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBackgroundColor: AppTheme.mediumGray,
        ),
        child: _isSaving
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(widget.palette == null ? 'Create Palette' : 'Update Palette'),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final image = await _imageService.pickImageFromGallery();
      if (image != null) {
        setState(() {
          _selectedImage = image;
          _existingImagePath = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to pick image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _addColor() {
    _showColorPickerDialog(null);
  }

  void _editColor(int index) {
    _showColorPickerDialog(index);
  }

  void _removeColor(int index) {
    setState(() {
      _selectedColors.removeAt(index);
    });
  }

  void _showColorPickerDialog(int? editIndex) {
    if (_isLoadingColors) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading colors...'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    if (_availableColors.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No custom colors available. Please add colors in Settings > Manage Colors first.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    Color? selectedColor = editIndex != null ? _selectedColors[editIndex] : null;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(editIndex != null ? 'Edit Color' : 'Select Color'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose from your custom colors',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _availableColors.map((colorData) {
                    final color = _hexToColor(colorData['hex']!);
                    final isSelected = selectedColor == color;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedColor = color);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? AppTheme.pastelPink : Colors.grey.shade300,
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 32,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                  ),
                                ],
                              )
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: selectedColor != null
                  ? () {
                      this.setState(() {
                        if (editIndex != null) {
                          _selectedColors[editIndex] = selectedColor!;
                        } else {
                          _selectedColors.add(selectedColor!);
                        }
                      });
                      Navigator.pop(dialogContext);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.pastelPink,
                disabledBackgroundColor: AppTheme.mediumGray,
              ),
              child: Text(editIndex != null ? 'Update' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }

  Future<void> _savePalette() async {
    if (!(_selectedColors.length >= 2 && _selectedColors.length <= 3)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select 2-3 colors'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final repository = ref.read(colorPaletteRepositoryProvider);

      // Upload image if new one was selected
      String? imagePath = _existingImagePath;
      if (_selectedImage != null) {
        imagePath = await _imageService.uploadImage(_selectedImage!, customPath: 'users/${ref.read(currentUserIdProvider)}/color_palettes/${_uuid.v4()}.jpg');
      }

      final palette = ColorPalette(
        id: widget.palette?.id ?? _uuid.v4(),
        name: _nameController.text.trim().isEmpty ? null : _nameController.text.trim(),
        colors: _selectedColors,
        imagePath: imagePath,
        createdAt: widget.palette?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        description: null,
        isCustom: true,
      );

      if (widget.palette == null) {
        await repository.saveColorPalette(palette);
      } else {
        await repository.updateColorPalette(palette);
      }

      // Invalidate the provider to refresh the list
      ref.invalidate(allColorPalettesProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.palette == null
                ? 'Color palette created successfully!'
                : 'Color palette updated successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save palette: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _showDeleteDialog() {
    if (widget.palette == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Color Palette'),
        content: const Text('Are you sure you want to delete this color palette?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deletePalette();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _deletePalette() async {
    try {
      final repository = ref.read(colorPaletteRepositoryProvider);
      await repository.deleteColorPalette(widget.palette!.id);

      // Delete image if exists
      if (widget.palette!.imagePath != null && _imageService.isFirebaseUrl(widget.palette!.imagePath)) {
        await _imageService.deleteImage(widget.palette!.imagePath!);
      }

      // Invalidate the provider to refresh the list
      ref.invalidate(allColorPalettesProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Color palette deleted successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete palette: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
