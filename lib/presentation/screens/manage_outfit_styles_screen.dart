import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/category_constants.dart';
import '../../domain/entities/outfit_style.dart';
import '../providers/outfit_style_provider.dart';
import '../providers/outfit_provider.dart';

class ManageOutfitStylesScreen extends ConsumerStatefulWidget {
  const ManageOutfitStylesScreen({super.key});

  @override
  ConsumerState<ManageOutfitStylesScreen> createState() => _ManageOutfitStylesScreenState();
}

class _ManageOutfitStylesScreenState extends ConsumerState<ManageOutfitStylesScreen> {
  @override
  void initState() {
    super.initState();
    _initializeDefaultStyles();
  }

  Future<void> _initializeDefaultStyles() async {
    final repository = ref.read(outfitStyleRepositoryProvider);
    final existingStyles = await repository.getAllOutfitStyles();

    // Migrate existing styles to add order field if missing
    if (existingStyles.isNotEmpty) {
      final needsMigration = existingStyles.where((s) => s.order == 0).length == existingStyles.length;

      if (needsMigration) {
        for (int i = 0; i < existingStyles.length; i++) {
          final updatedStyle = existingStyles[i].copyWith(
            order: i,
            updatedAt: DateTime.now(),
          );
          await repository.updateOutfitStyle(updatedStyle);
        }
      }
      return; // Don't initialize defaults if user has styles
    }

    // If no styles exist, initialize with defaults
    final now = DateTime.now();
    for (int i = 0; i < DefaultOutfitStyles.items.length; i++) {
      final styleInfo = DefaultOutfitStyles.items[i];
      final style = OutfitStyle(
        id: const Uuid().v4(),
        name: styleInfo.name,
        color: styleInfo.color,
        icon: styleInfo.icon,
        description: styleInfo.description,
        createdAt: now,
        updatedAt: now,
        order: i,
      );
      await repository.saveOutfitStyle(style);
    }
  }

  void _showAddStyleDialog() {
    final controller = TextEditingController();
    Color selectedColor = _getColorOptions().first;
    IconData selectedIcon = _getIconOptions().first;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Outfit Style'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Style Name',
                    hintText: 'Enter style name',
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Choose Icon',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _getIconOptions().map((icon) {
                    final isSelected = selectedIcon == icon;
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          selectedIcon = icon;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isSelected ? selectedColor.withValues(alpha: 0.15) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? selectedColor : Colors.grey.shade400,
                            width: isSelected ? 2.5 : 1,
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: selectedColor,
                          size: 24,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Icon Color',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _getColorOptions().map((color) {
                    final isSelected = selectedColor == color;
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? color : Colors.grey.shade400,
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Icon(
                          selectedIcon,
                          color: color,
                          size: 24,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final styleName = controller.text.trim();
                if (styleName.isNotEmpty) {
                  final repository = ref.read(outfitStyleRepositoryProvider);
                  final existing = await repository.getAllOutfitStyles();
                  final nameExists = existing.any((s) => s.name == styleName);

                  if (!nameExists) {
                    final maxOrder = existing.isEmpty ? 0 : existing.map((s) => s.order).reduce((a, b) => a > b ? a : b);
                    final now = DateTime.now();
                    final style = OutfitStyle(
                      id: const Uuid().v4(),
                      name: styleName,
                      color: selectedColor,
                      icon: selectedIcon,
                      createdAt: now,
                      updatedAt: now,
                      order: maxOrder + 1,
                    );
                    await repository.saveOutfitStyle(style);

                    ref.invalidate(allOutfitStylesProvider);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteStyle(OutfitStyle style) async {
    try {
      // Delete from Firebase
      final repository = ref.read(outfitStyleRepositoryProvider);
      await repository.deleteOutfitStyle(style.id);

      // Remove from all outfits
      final outfitRepository = ref.read(outfitRepositoryProvider);
      final allOutfits = await outfitRepository.getAllOutfits();

      for (final outfit in allOutfits) {
        if (outfit.outfitStyles.contains(style.name)) {
          final updatedStyles = outfit.outfitStyles.where((s) => s != style.name).toList();
          final updatedOutfit = outfit.copyWith(outfitStyles: updatedStyles);
          await outfitRepository.updateOutfit(updatedOutfit);
        }
      }

      // Invalidate providers to refresh UI
      ref.invalidate(allOutfitStylesProvider);
      ref.invalidate(allOutfitsProvider);

    } catch (e) {
      debugPrint('Failed to delete outfit style: $e');
    }
  }

  Future<void> _editStyle(OutfitStyle style) async {
    final controller = TextEditingController(text: style.name);
    Color selectedColor = style.color;
    IconData selectedIcon = style.icon ?? Icons.style;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit Outfit Style'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Style Name',
                    hintText: 'Enter style name',
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Choose Icon',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _getIconOptions().map((icon) {
                    final isSelected = selectedIcon == icon;
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          selectedIcon = icon;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isSelected ? selectedColor.withValues(alpha: 0.15) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? selectedColor : Colors.grey.shade400,
                            width: isSelected ? 2.5 : 1,
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: selectedColor,
                          size: 24,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Icon Color',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _getColorOptions().map((color) {
                    final isSelected = selectedColor == color;
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? color : Colors.grey.shade400,
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Icon(
                          selectedIcon,
                          color: color,
                          size: 24,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newName = controller.text.trim();
                final repository = ref.read(outfitStyleRepositoryProvider);

                if (newName.isNotEmpty && newName != style.name) {
                  // Check if new name already exists
                  final existing = await repository.getAllOutfitStyles();
                  final nameExists = existing.any((s) => s.name == newName && s.id != style.id);

                  if (!nameExists) {
                    // Update style name in all outfits
                    final outfitRepository = ref.read(outfitRepositoryProvider);
                    final allOutfits = await outfitRepository.getAllOutfits();

                    for (final outfit in allOutfits) {
                      if (outfit.outfitStyles.contains(style.name)) {
                        final updatedStyles = outfit.outfitStyles.map((s) => s == style.name ? newName : s).toList();
                        final updatedOutfit = outfit.copyWith(outfitStyles: updatedStyles);
                        await outfitRepository.updateOutfit(updatedOutfit);
                      }
                    }

                    // Update the style in Firebase
                    final updatedStyle = style.copyWith(
                      name: newName,
                      color: selectedColor,
                      icon: selectedIcon,
                      updatedAt: DateTime.now(),
                    );
                    await repository.updateOutfitStyle(updatedStyle);

                    // Invalidate providers to refresh UI
                    ref.invalidate(allOutfitStylesProvider);
                    ref.invalidate(allOutfitsProvider);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                } else if (newName == style.name) {
                  // Just update color/icon if name didn't change
                  final updatedStyle = style.copyWith(
                    color: selectedColor,
                    icon: selectedIcon,
                    updatedAt: DateTime.now(),
                  );
                  await repository.updateOutfitStyle(updatedStyle);

                  ref.invalidate(allOutfitStylesProvider);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _reorderStyles(List<OutfitStyle> styles, int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final List<OutfitStyle> reorderedStyles = List.from(styles);
    final item = reorderedStyles.removeAt(oldIndex);
    reorderedStyles.insert(newIndex, item);

    final repository = ref.read(outfitStyleRepositoryProvider);
    for (int i = 0; i < reorderedStyles.length; i++) {
      final updatedStyle = reorderedStyles[i].copyWith(
        order: i,
        updatedAt: DateTime.now(),
      );
      await repository.updateOutfitStyle(updatedStyle);
    }

    ref.invalidate(allOutfitStylesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final stylesAsync = ref.watch(allOutfitStylesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Outfit Styles'),
        actions: [
          IconButton(
            onPressed: () => _showInfoDialog(),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: stylesAsync.when(
        data: (styles) => ListView(
              padding: const EdgeInsets.all(16),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Outfit Styles',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                          Text(
                            '${styles.length} styles',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      if (styles.isNotEmpty)
                        Card(
                          child: ReorderableListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            onReorder: (oldIndex, newIndex) => _reorderStyles(styles, oldIndex, newIndex),
                            children: styles.map((style) {
                              return Dismissible(
                                key: Key(style.id),
                                direction: DismissDirection.endToStart,
                                confirmDismiss: (direction) async {
                                  await _deleteStyle(style);
                                  return false;
                                },
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16),
                                  color: Colors.red,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.9,
                                },
                                child: ListTile(
                                  title: Text(style.name),
                                  leading: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.drag_handle,
                                        color: AppTheme.mediumGray,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 12),
                                      Icon(
                                        style.icon ?? Icons.style,
                                        color: style.color,
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () => _editStyle(style),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      else
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.style_outlined,
                                  size: 64,
                                  color: AppTheme.mediumGray.withValues(alpha: 0.5),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No Outfit Styles Yet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.mediumGray.withValues(alpha: 0.7),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Add outfit styles to organize your outfits.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.mediumGray.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: 32),
                    ],
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading outfit styles: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStyleDialog,
        backgroundColor: AppTheme.pastelPink,
        foregroundColor: AppTheme.primaryBlack,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Color> _getColorOptions() {
    return [
      const Color(0xFFE53935), // Bright Red
      const Color(0xFFF44336), // Red
      const Color(0xFFFF4081), // Pink
      const Color(0xFFFF7043), // Deep Orange
      const Color(0xFF800020), // Burgundy
      const Color(0xFFFFC107), // Amber
      const Color(0xFF66BB6A), // Green
      const Color(0xE83CB88C), // Turquoise
      const Color(0xFF00ACC1), // Blue
      const Color(0xFF5C6BC0), // Indigo
      const Color(0xFFBA68C8), // Purple
      const Color(0xFFAA6E4B), // Brown
      const Color(0xFF3A3A3A), // Black
      const Color(0xFF757575), // Gray
    ];
  }

  List<IconData> _getIconOptions() {
    return [
      Icons.style,
      Icons.checkroom,
      Icons.weekend,
      Icons.business,
      Icons.star,
      Icons.nightlife,
      Icons.fitness_center,
      Icons.spa,
      Icons.auto_awesome,
      Icons.skateboarding,
      Icons.celebration,
      Icons.workspace_premium,
      Icons.diamond,
      Icons.circle_outlined,
      Icons.verified,
    ];
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Outfit Styles'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Outfit styles help you categorize and filter complete outfits.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Text(
              '• Examples: Casual, Formal, Business Casual, etc.',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Separate from clothing item categories',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Each style can have a unique icon and color',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Drag to reorder, swipe to delete',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
