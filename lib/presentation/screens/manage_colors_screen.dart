import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import '../../core/services/color_palette_service.dart';
import '../../core/themes/app_theme.dart';

class ManageColorsScreen extends StatefulWidget {
  const ManageColorsScreen({super.key});

  @override
  State<ManageColorsScreen> createState() => _ManageColorsScreenState();
}

class _ManageColorsScreenState extends State<ManageColorsScreen> {
  final ColorPaletteService _colorService = ColorPaletteService();
  List<Map<String, String>> _colors = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  Future<void> _loadColors() async {
    setState(() => _isLoading = true);
    final colors = await _colorService.getColors();
    setState(() {
      _colors = colors;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Your Color Palette',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These colors will be used throughout the app for filters, color detection, and item management.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
                const SizedBox(height: 24),
                ..._colors.asMap().entries.map((entry) {
                  final index = entry.key;
                  final colorData = entry.value;
                  return _buildColorTile(index, colorData);
                }),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: _addNewColor,
                  icon: const Icon(Icons.add),
                  label: const Text('Add New Color'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.pastelPink,
                    side: const BorderSide(color: AppTheme.pastelPink),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildColorTile(int index, Map<String, String> colorData) {
    final color = _hexToColor(colorData['hex']!);
    final name = colorData['name']!;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          colorData['hex']!,
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
              onPressed: () => _editColor(index, colorData),
              color: AppTheme.pastelPink,
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () => _deleteColor(index, name),
              color: Colors.red.shade300,
            ),
          ],
        ),
      ),
    );
  }

  void _addNewColor() {
    _showColorEditDialog(
      title: 'Add New Color',
      initialName: '',
      initialColor: Colors.blue,
      onSave: (name, color) async {
        final hex = _colorService.colorToHex(color);
        await _colorService.addColor(name, hex);
        await _loadColors();
      },
    );
  }

  void _editColor(int index, Map<String, String> colorData) {
    _showColorEditDialog(
      title: 'Edit Color',
      initialName: colorData['name']!,
      initialColor: _hexToColor(colorData['hex']!),
      onSave: (name, color) async {
        final hex = _colorService.colorToHex(color);
        await _colorService.updateColor(index, name, hex);
        await _loadColors();
      },
    );
  }

  void _deleteColor(int index, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Color'),
        content: Text('Are you sure you want to delete "$name"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _colorService.deleteColor(index);
              await _loadColors();
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
      builder: (context) => AlertDialog(
        title: const Text('Reset to Defaults'),
        content: const Text(
          'This will restore the default color palette and remove any custom colors you\'ve added. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _colorService.resetToDefaults();
              await _loadColors();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
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

  void _showColorEditDialog({
    required String title,
    required String initialName,
    required Color initialColor,
    required Function(String name, Color color) onSave,
  }) {
    final nameController = TextEditingController(text: initialName);
    Color selectedColor = initialColor;

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
                onSave(name, selectedColor);
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

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }
}
