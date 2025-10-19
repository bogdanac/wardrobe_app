import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:uuid/uuid.dart';
import '../../core/themes/app_theme.dart';
import '../../domain/entities/custom_color.dart';
import '../providers/custom_color_provider.dart';

class ManageColorsScreen extends ConsumerStatefulWidget {
  const ManageColorsScreen({super.key});

  @override
  ConsumerState<ManageColorsScreen> createState() => _ManageColorsScreenState();
}

class _ManageColorsScreenState extends ConsumerState<ManageColorsScreen> {
  @override
  void initState() {
    super.initState();
    _initializeDefaultColors();
  }

  Future<void> _initializeDefaultColors() async {
    final repository = ref.read(customColorRepositoryProvider);
    final existingColors = await repository.getAllColors();

    // If no colors exist, initialize with defaults
    if (existingColors.isEmpty) {
      await repository.resetToDefaults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorsAsync = ref.watch(allCustomColorsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Colors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            tooltip: 'Reset to defaults',
            onPressed: _showResetDialog,
          ),
        ],
      ),
      body: colorsAsync.when(
        data: (colors) {
          final neutrals = colors.where((c) => c.section == ColorSection.neutrals).toList();
          final pastels = colors.where((c) => c.section == ColorSection.pastels).toList();
          final accents = colors.where((c) => c.section == ColorSection.accents).toList();

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Color Palette',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Colors are organized by category. Drag within sections to reorder.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildSection('Neutrals', neutrals, ColorSection.neutrals),
                    const SizedBox(height: 16),
                    _buildSection('Pastels', pastels, ColorSection.pastels),
                    const SizedBox(height: 16),
                    _buildSection('Accent Colors', accents, ColorSection.accents),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading colors: $error'),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<CustomColor> colors, ColorSection section) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${colors.length} colors',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed: () => _addNewColor(section),
                      color: AppTheme.pastelPink,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (colors.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'No colors in this section',
                  style: TextStyle(
                    color: AppTheme.mediumGray.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else
            ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onReorder: (oldIndex, newIndex) => _reorderColorsInSection(colors, oldIndex, newIndex, section),
              children: colors.map((color) => _buildColorTile(color)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildColorTile(CustomColor colorData) {
    return Card(
      key: ValueKey(colorData.id),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.drag_handle,
              color: AppTheme.mediumGray,
              size: 20,
            ),
            const SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorData.color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ],
        ),
        title: Text(
          colorData.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          colorData.hex,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.mediumGray,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () => _editColor(colorData),
              color: AppTheme.pastelPink,
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () => _deleteColor(colorData),
              color: Colors.red.shade300,
            ),
          ],
        ),
      ),
    );
  }

  void _addNewColor(ColorSection section) async {
    final repository = ref.read(customColorRepositoryProvider);
    final existingColors = await repository.getAllColors();
    final maxOrder = existingColors.isEmpty ? 0 : existingColors.map((c) => c.order).reduce((a, b) => a > b ? a : b);

    _showColorEditDialog(
      title: 'Add New Color',
      initialName: '',
      initialColor: Colors.blue,
      initialSection: section,
      onSave: (name, color, selectedSection) async {
        final hex = _colorToHex(color);
        final now = DateTime.now();
        final customColor = CustomColor(
          id: const Uuid().v4(),
          name: name,
          hex: hex,
          createdAt: now,
          updatedAt: now,
          order: maxOrder + 1,
          section: selectedSection,
        );
        await repository.saveColor(customColor);
        ref.invalidate(allCustomColorsProvider);
      },
    );
  }

  void _editColor(CustomColor colorData) {
    _showColorEditDialog(
      title: 'Edit Color',
      initialName: colorData.name,
      initialColor: colorData.color,
      initialSection: colorData.section,
      onSave: (name, color, section) async {
        final hex = _colorToHex(color);
        final repository = ref.read(customColorRepositoryProvider);
        final updatedColor = colorData.copyWith(
          name: name,
          hex: hex,
          section: section,
          updatedAt: DateTime.now(),
        );
        await repository.updateColor(updatedColor);
        ref.invalidate(allCustomColorsProvider);
      },
    );
  }

  void _deleteColor(CustomColor colorData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Color'),
        content: Text('Are you sure you want to delete "${colorData.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final repository = ref.read(customColorRepositoryProvider);
              await repository.deleteColor(colorData.id);
              ref.invalidate(allCustomColorsProvider);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }


  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset to Defaults'),
        content: const Text(
          'This will restore the default color palette and remove any custom colors you\'ve added. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final messenger = ScaffoldMessenger.of(context);
              final repository = ref.read(customColorRepositoryProvider);
              await repository.resetToDefaults();
              ref.invalidate(allCustomColorsProvider);
              if (mounted) {
                messenger.showSnackBar(
                  const SnackBar(content: Text('Colors reset to defaults')),
                );
              }
            },
            child: const Text('Reset', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }

  Future<void> _reorderColorsInSection(List<CustomColor> colors, int oldIndex, int newIndex, ColorSection section) async {
    // Adjust newIndex if moving down
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    // Create a new list with reordered items
    final List<CustomColor> reorderedColors = List.from(colors);
    final item = reorderedColors.removeAt(oldIndex);
    reorderedColors.insert(newIndex, item);

    // Get all colors to reassign orders globally
    final repository = ref.read(customColorRepositoryProvider);
    final allColors = await repository.getAllColors();

    // Separate colors by section
    final otherColors = allColors.where((c) => c.section != section).toList();

    // Assign new orders to reordered section
    int orderCounter = 0;
    final updatedColors = <CustomColor>[];

    // Add colors from other sections first (maintain their existing order)
    for (final color in otherColors) {
      updatedColors.add(color.copyWith(order: orderCounter++));
    }

    // Add reordered colors from this section
    for (final color in reorderedColors) {
      updatedColors.add(color.copyWith(order: orderCounter++, updatedAt: DateTime.now()));
    }

    // Update all modified colors
    for (final color in updatedColors) {
      await repository.updateColor(color);
    }

    // Refresh the UI
    ref.invalidate(allCustomColorsProvider);
  }

  void _showColorEditDialog({
    required String title,
    required String initialName,
    required Color initialColor,
    required ColorSection initialSection,
    required Function(String name, Color color, ColorSection section) onSave,
  }) {
    final nameController = TextEditingController(text: initialName);
    Color selectedColor = initialColor;
    ColorSection selectedSection = initialSection;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Color Name',
                    hintText: 'e.g., light blue',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ColorSection>(
                  initialValue: selectedSection,
                  decoration: const InputDecoration(
                    labelText: 'Section',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: ColorSection.neutrals,
                      child: Text('Neutrals'),
                    ),
                    DropdownMenuItem(
                      value: ColorSection.pastels,
                      child: Text('Pastels'),
                    ),
                    DropdownMenuItem(
                      value: ColorSection.accents,
                      child: Text('Accent Colors'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedSection = value);
                    }
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Choose Color',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ColorPicker(
                  color: selectedColor,
                  onColorChanged: (color) {
                    setState(() => selectedColor = color);
                  },
                  width: 40,
                  height: 40,
                  borderRadius: 8,
                  spacing: 8,
                  runSpacing: 8,
                  wheelDiameter: 200,
                  heading: Container(),
                  subheading: Container(),
                  pickersEnabled: const {
                    ColorPickerType.both: false,
                    ColorPickerType.primary: true,
                    ColorPickerType.accent: false,
                    ColorPickerType.wheel: true,
                  },
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
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(content: Text('Please enter a color name')),
                  );
                  return;
                }
                Navigator.pop(dialogContext);
                onSave(name, selectedColor, selectedSection);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.pastelPink,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
