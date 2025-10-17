import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/category_constants.dart';
import '../../domain/entities/category.dart' as entity;
import '../providers/category_provider.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_provider.dart';

class ManageCategoriesScreen extends ConsumerStatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  ConsumerState<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends ConsumerState<ManageCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    _initializeDefaultCategories();
  }

  Future<void> _initializeDefaultCategories() async {
    final repository = ref.read(categoryRepositoryProvider);
    final existingCategories = await repository.getAllCategories();

    // Migrate existing categories to add order field if missing
    if (existingCategories.isNotEmpty) {
      // Check if any categories need migration (have order = 0 and weren't intentionally set to 0)
      final needsMigration = existingCategories.where((c) => c.order == 0).length == existingCategories.length;

      if (needsMigration) {
        for (int i = 0; i < existingCategories.length; i++) {
          final updatedCategory = existingCategories[i].copyWith(
            order: i,
            updatedAt: DateTime.now(),
          );
          await repository.updateCategory(updatedCategory);
        }
      }
      return; // Don't initialize defaults if user has categories
    }

    // If no categories exist, initialize with defaults
    final now = DateTime.now();
    for (int i = 0; i < DefaultCategories.items.length; i++) {
      final categoryInfo = DefaultCategories.items[i];
      final category = entity.Category(
        id: const Uuid().v4(),
        name: categoryInfo.name,
        color: categoryInfo.color,
        icon: categoryInfo.icon,
        description: categoryInfo.description,
        createdAt: now,
        updatedAt: now,
        order: i,
      );
      await repository.saveCategory(category);
    }
  }

  void _showAddCategoryDialog() {
    final controller = TextEditingController();
    Color selectedColor = _getColorOptions().first;
    IconData selectedIcon = _getIconOptions().first;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Category Name',
                    hintText: 'Enter category name',
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
                final categoryName = controller.text.trim();
                if (categoryName.isNotEmpty) {
                  // Check if category name already exists
                  final repository = ref.read(categoryRepositoryProvider);
                  final existing = await repository.getAllCategories();
                  final nameExists = existing.any((c) => c.name == categoryName);

                  if (!nameExists) {
                    final maxOrder = existing.isEmpty ? 0 : existing.map((c) => c.order).reduce((a, b) => a > b ? a : b);
                    final now = DateTime.now();
                    final category = entity.Category(
                      id: const Uuid().v4(),
                      name: categoryName,
                      color: selectedColor,
                      icon: selectedIcon,
                      createdAt: now,
                      updatedAt: now,
                      order: maxOrder + 1,
                    );
                    await repository.saveCategory(category);

                    // Invalidate to refresh the list
                    ref.invalidate(allCategoriesProvider);

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


  Future<void> _deleteCategory(entity.Category category) async {
    await _deleteCategoryWithUnassign(category);
  }

  Future<void> _deleteCategoryWithUnassign(entity.Category category) async {
    try {
      // Delete from Firebase
      final repository = ref.read(categoryRepositoryProvider);
      await repository.deleteCategory(category.id);

      // Remove from all clothing items
      final clothingRepository = ref.read(clothingRepositoryProvider);
      final allClothingItems = await clothingRepository.getAllClothingItems();

      for (final item in allClothingItems) {
        if (item.categories.contains(category.name)) {
          final updatedCategories = item.categories.where((c) => c != category.name).toList();
          final updatedItem = item.copyWith(categories: updatedCategories);
          await clothingRepository.updateClothingItem(updatedItem);
        }
      }

      // Remove from all outfits
      final outfitRepository = ref.read(outfitRepositoryProvider);
      final allOutfits = await outfitRepository.getAllOutfits();

      for (final outfit in allOutfits) {
        if (outfit.categories.contains(category.name)) {
          final updatedCategories = outfit.categories.where((c) => c != category.name).toList();
          final updatedOutfit = outfit.copyWith(categories: updatedCategories);
          await outfitRepository.updateOutfit(updatedOutfit);
        }
      }

      // Invalidate providers to refresh UI
      ref.invalidate(allCategoriesProvider);
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      
    } catch (e) {
      // Silent error handling - no snackbars
      debugPrint('Failed to delete category: $e');
    }
  }

  Future<void> _editCategory(entity.Category category) async {
    final controller = TextEditingController(text: category.name);
    Color selectedColor = category.color;
    IconData selectedIcon = category.icon ?? Icons.star;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Category Name',
                    hintText: 'Enter category name',
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
                final repository = ref.read(categoryRepositoryProvider);

                if (newName.isNotEmpty && newName != category.name) {
                  // Check if new name already exists
                  final existing = await repository.getAllCategories();
                  final nameExists = existing.any((c) => c.name == newName && c.id != category.id);

                  if (!nameExists) {
                    // Update category name in all clothing items
                    final clothingRepository = ref.read(clothingRepositoryProvider);
                    final allClothingItems = await clothingRepository.getAllClothingItems();

                    for (final item in allClothingItems) {
                      if (item.categories.contains(category.name)) {
                        final updatedCategories = item.categories.map((c) => c == category.name ? newName : c).toList();
                        final updatedItem = item.copyWith(categories: updatedCategories);
                        await clothingRepository.updateClothingItem(updatedItem);
                      }
                    }

                    // Update category name in all outfits
                    final outfitRepository = ref.read(outfitRepositoryProvider);
                    final allOutfits = await outfitRepository.getAllOutfits();

                    for (final outfit in allOutfits) {
                      if (outfit.categories.contains(category.name)) {
                        final updatedCategories = outfit.categories.map((c) => c == category.name ? newName : c).toList();
                        final updatedOutfit = outfit.copyWith(categories: updatedCategories);
                        await outfitRepository.updateOutfit(updatedOutfit);
                      }
                    }

                    // Update the category in Firebase
                    final updatedCategory = category.copyWith(
                      name: newName,
                      color: selectedColor,
                      icon: selectedIcon,
                      updatedAt: DateTime.now(),
                    );
                    await repository.updateCategory(updatedCategory);

                    // Invalidate providers to refresh UI
                    ref.invalidate(allCategoriesProvider);
                    ref.invalidate(allClothingItemsProvider);
                    ref.invalidate(allOutfitsProvider);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                } else if (newName == category.name) {
                  // Just update color/icon if name didn't change
                  final updatedCategory = category.copyWith(
                    color: selectedColor,
                    icon: selectedIcon,
                    updatedAt: DateTime.now(),
                  );
                  await repository.updateCategory(updatedCategory);

                  // Invalidate to refresh UI
                  ref.invalidate(allCategoriesProvider);

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

  Future<void> _reorderCategories(List<entity.Category> categories, int oldIndex, int newIndex) async {
    // Adjust newIndex if moving down
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    // Create a new list with reordered items
    final List<entity.Category> reorderedCategories = List.from(categories);
    final item = reorderedCategories.removeAt(oldIndex);
    reorderedCategories.insert(newIndex, item);

    // Update order values
    final repository = ref.read(categoryRepositoryProvider);
    for (int i = 0; i < reorderedCategories.length; i++) {
      final updatedCategory = reorderedCategories[i].copyWith(
        order: i,
        updatedAt: DateTime.now(),
      );
      await repository.updateCategory(updatedCategory);
    }

    // Refresh the UI
    ref.invalidate(allCategoriesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(allCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Style Categories'),
        actions: [
          IconButton(
            onPressed: () => _showInfoDialog(),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: categoriesAsync.when(
        data: (categories) => ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // All categories section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Style',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                          Text(
                            '${categories.length} categories',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      if (categories.isNotEmpty)
                        Card(
                          child: ReorderableListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            onReorder: (oldIndex, newIndex) => _reorderCategories(categories, oldIndex, newIndex),
                            children: categories.map((category) {
                              return Dismissible(
                                key: Key(category.id),
                                direction: DismissDirection.endToStart,
                                confirmDismiss: (direction) async {
                                  await _deleteCategory(category);
                                  return false; // Don't auto-dismiss, we handle it manually
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
                                  title: Text(category.name),
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
                                        category.icon ?? Icons.star,
                                        color: category.color,
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () => _editCategory(category),
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
                                  Icons.category_outlined,
                                  size: 64,
                                  color: AppTheme.mediumGray.withValues(alpha: 0.5),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No Categories Yet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.mediumGray.withValues(alpha: 0.7),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Add style categories to organize your wardrobe.',
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
          child: Text('Error loading categories: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryDialog,
        backgroundColor: AppTheme.pastelPink,
        foregroundColor: AppTheme.primaryBlack,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Color> _getColorOptions() {
    return [
      const Color(0xFFE53935), // Bright Red
      const Color(0xFFFF4081), // Pink
      const Color(0xFFFF7043), // Deep Orange
      const Color(0xFFFFC107), // Amber
      const Color(0xFF66BB6A), // Green
      const Color(0xE83CB88C), // Turquoise
      const Color(0xFF00ACC1), // Blue
      const Color(0xFF5C6BC0), // Indigo
      const Color(0xFFBA68C8), // Purple
      const Color(0xFFAA6E4B), // Brown
      const Color(0xFF800020), // Burgundy
      const Color(0xFF59341E), // Coffee Brown
      const Color(0xFF3A3A3A) // Black
    ];
  }

  List<IconData> _getIconOptions() {
    return [
      Icons.favorite,           // Love/romantic
      Icons.star,               // Special/favorite
      Icons.celebration,        // Parties/celebrations
      Icons.business,           // Office/work
      Icons.school,             // Casual/educational
      Icons.shopping_bag,       // Shopping/errands
      Icons.coffee,             // Coffee dates
      Icons.brunch_dining,      // Brunch with friends
      Icons.restaurant,         // Dinner dates
      Icons.wine_bar,           // Wine dates/bar
      Icons.nightlife,          // Nightclub/cocktails
      Icons.theater_comedy,     // Theater/shows
      Icons.music_note,         // Concerts/music
      Icons.beach_access,       // Beach/resort
      Icons.directions_run,     // Running/gym
      Icons.fitness_center,     // Gym/fitness
      Icons.self_improvement,   // Yoga/wellness
      Icons.spa,                // Spa/relaxation
      Icons.weekend,            // Relaxed/comfy
      Icons.pets,               // Pet-friendly outfits
    ];
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Style Categories'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Style categories help you organize and filter your clothing items and outfits.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Text(
              '• Default categories cannot be modified',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Custom categories can be edited or deleted',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Categories are used in outfit generation',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '• Each category has a unique color for easy identification',
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