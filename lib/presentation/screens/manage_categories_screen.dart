import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/category_colors.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_provider.dart';

class ManageCategoriesScreen extends ConsumerStatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  ConsumerState<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends ConsumerState<ManageCategoriesScreen> {
  static const String _customCategoriesKey = 'custom_style_categories';
  
  List<String> _categories = [];
  final TextEditingController _newCategoryController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCustomCategories();
  }

  @override
  void dispose() {
    _newCategoryController.dispose();
    super.dispose();
  }

  Future<void> _loadCustomCategories() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedCategories = prefs.getStringList(_customCategoriesKey) ?? [];
    
    // If no saved categories, initialize with defaults
    if (savedCategories.isEmpty) {
      savedCategories = [
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
      await prefs.setStringList(_customCategoriesKey, savedCategories);
    }
    
    setState(() {
      _categories = savedCategories;
      _isLoading = false;
    });
  }

  Future<void> _saveCustomCategories() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_customCategoriesKey, _categories);
  }

  void _showAddCategoryDialog() {
    final controller = TextEditingController();
    Color selectedColor = _getColorOptions().first;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Category'),
          content: Column(
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
                'Color',
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
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final categoryName = controller.text.trim();
                if (categoryName.isNotEmpty && !_categories.contains(categoryName)) {
                  await _updateCategoryColor(categoryName, selectedColor);
                  setState(() {
                    _categories.add(categoryName);
                  });
                  await _saveCustomCategories();
                  if (context.mounted) {
                    Navigator.pop(context);
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

  void _addCategory() {
    final categoryName = _newCategoryController.text.trim();
    if (categoryName.isNotEmpty && !_categories.contains(categoryName)) {
      setState(() {
        _categories.add(categoryName);
      });
      _newCategoryController.clear();
      _saveCustomCategories();
    }
  }

  Future<void> _deleteCategory(String category) async {
    await _deleteCategoryWithUnassign(category);
  }

  Future<void> _deleteCategoryWithUnassign(String category) async {
    try {
      // Remove from categories list
      setState(() {
        _categories.remove(category);
      });
      await _saveCustomCategories();

      // Remove from all clothing items
      final clothingRepository = ref.read(clothingRepositoryProvider);
      final allClothingItems = await clothingRepository.getAllClothingItems();
      
      for (final item in allClothingItems) {
        if (item.categories.contains(category)) {
          final updatedCategories = item.categories.where((c) => c != category).toList();
          final updatedItem = item.copyWith(categories: updatedCategories);
          await clothingRepository.updateClothingItem(updatedItem);
        }
      }

      // Remove from all outfits
      final outfitRepository = ref.read(outfitRepositoryProvider);
      final allOutfits = await outfitRepository.getAllOutfits();
      
      for (final outfit in allOutfits) {
        if (outfit.categories.contains(category)) {
          final updatedCategories = outfit.categories.where((c) => c != category).toList();
          final updatedOutfit = outfit.copyWith(categories: updatedCategories);
          await outfitRepository.updateOutfit(updatedOutfit);
        }
      }

      // Invalidate providers to refresh UI
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      
    } catch (e) {
      // Silent error handling - no snackbars
      debugPrint('Failed to delete category: $e');
    }
  }

  Future<void> _editCategory(String oldCategory) async {
    final controller = TextEditingController(text: oldCategory);
    Color selectedColor = CategoryColors.getCategoryColor(oldCategory);

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit Category'),
          content: Column(
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
                'Color',
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
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newName = controller.text.trim();
                if (newName.isNotEmpty && newName != oldCategory) {
                  if (!_categories.contains(newName)) {
                    // Update category name in all clothing items
                    final clothingRepository = ref.read(clothingRepositoryProvider);
                    final allClothingItems = await clothingRepository.getAllClothingItems();

                    for (final item in allClothingItems) {
                      if (item.categories.contains(oldCategory)) {
                        final updatedCategories = item.categories.map((c) => c == oldCategory ? newName : c).toList();
                        final updatedItem = item.copyWith(categories: updatedCategories);
                        await clothingRepository.updateClothingItem(updatedItem);
                      }
                    }

                    // Update category name in all outfits
                    final outfitRepository = ref.read(outfitRepositoryProvider);
                    final allOutfits = await outfitRepository.getAllOutfits();

                    for (final outfit in allOutfits) {
                      if (outfit.categories.contains(oldCategory)) {
                        final updatedCategories = outfit.categories.map((c) => c == oldCategory ? newName : c).toList();
                        final updatedOutfit = outfit.copyWith(categories: updatedCategories);
                        await outfitRepository.updateOutfit(updatedOutfit);
                      }
                    }

                    // Store the color selection
                    await _updateCategoryColor(newName, selectedColor);

                    setState(() {
                      final index = _categories.indexOf(oldCategory);
                      if (index != -1) {
                        _categories[index] = newName;
                      }
                    });
                    await _saveCustomCategories();

                    // Invalidate providers to refresh UI
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
                } else if (newName == oldCategory) {
                  // Just update color if name didn't change
                  await _updateCategoryColor(oldCategory, selectedColor);
                  setState(() {}); // Refresh UI to show color change
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

  List<String> _getAllCategories() {
    return _categories;
  }

  // Removed snackbar methods as requested

  @override
  Widget build(BuildContext context) {
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Add new category section
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add New Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _newCategoryController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter category name...',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                onSubmitted: (_) => _addCategory(),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: _addCategory,
                              icon: const Icon(Icons.add),
                              label: const Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Categories list
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            '${_getAllCategories().length} categories',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      if (_getAllCategories().isNotEmpty)
                        Card(
                          child: ReorderableListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                if (newIndex > oldIndex) {
                                  newIndex -= 1;
                                }
                                final category = _categories.removeAt(oldIndex);
                                _categories.insert(newIndex, category);
                              });
                              _saveCustomCategories();
                            },
                            children: _getAllCategories().map((category) {
                              return Dismissible(
                                key: Key(category),
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
                                  title: Text(category),
                                  leading: Icon(
                                    Icons.label,
                                    color: CategoryColors.getCategoryColor(category),
                                  ),
                                  trailing: const Icon(Icons.drag_handle),
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
                ),
              ],
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
      const Color(0xFFF44336), // Red
      const Color(0xFFFF4081), // Pink
      const Color(0xFFFF7043), // Deep Orange
      const Color(0xFFFFC107), // Amber
      const Color(0xFF66BB6A), // Green
      const Color(0xE83CB88C), // Turquoise
      const Color(0xFF00ACC1), // Blue
      const Color(0xFF5C6BC0), // Indigo
      const Color(0xFFBA68C8), // Purple
      const Color(0xFFAA6E4B), // Brown
      const Color(0xFF3A3A3A) // Black
    ];
  }

  Future<void> _updateCategoryColor(String category, Color color) async {
    await CategoryColors.setCategoryColor(category, color);
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