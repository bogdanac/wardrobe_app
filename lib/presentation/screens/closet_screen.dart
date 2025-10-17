import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../widgets/clothing_item_card.dart';
import '../widgets/minimalist_filters.dart';
import '../widgets/common/empty_state_widget.dart';
import 'add_clothing_item_screen.dart';
import 'simple_bulk_add_screen.dart';
import 'create_outfit_screen.dart';

class ClosetScreen extends ConsumerStatefulWidget {
  const ClosetScreen({super.key});

  @override
  ConsumerState<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends ConsumerState<ClosetScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    final filteredClothingItems = ref.watch(filteredClothingItemsProvider);
    ref.watch(clothingFilterProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _isSelectionMode ? _buildSelectionAppBar() : null,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
            child: _buildCompactFilters(),
          ),
          Expanded(
            child: filteredClothingItems.when(
              data: (items) => _buildClothingGrid(items),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClothingGrid(List<ClothingItem> items) {
    if (items.isEmpty) {
      final filter = ref.watch(clothingFilterProvider);
      final hasActiveFilters = _hasActiveFilters(filter);

      if (hasActiveFilters) {
        // Show filtered empty state
        return EmptyStateWidget(
          icon: Icons.search_off,
          iconColor: AppTheme.mediumGray,
          title: 'No items match your filters',
          subtitle: 'Try adjusting your search criteria or filters to see more items.',
          actionText: 'Clear Filters',
          onActionPressed: () {
            ref.read(clothingFilterProvider.notifier).clearFilters();
          },
        );
      }

      // Show first-time empty state
      return EmptyStateWidget(
        icon: Icons.checkroom_outlined,
        title: 'Welcome to your digital closet!',
        subtitle: 'Start building your wardrobe by adding your favorite clothing items. Take photos or choose from your gallery.',
        actionText: 'Add First Item',
        onActionPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddClothingItemScreen(),
          ),
        ),
        secondaryActionText: 'Bulk Add Photos',
        onSecondaryActionPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SimpleBulkAddScreen(),
          ),
        ),
        additionalWidgets: const [
          QuickTipsWidget(
            tips: [
              'Take clear, well-lit photos for best results',
              'Organize items by type, color, or season',
              'Use tags to create custom categories',
              'Archive items you rarely wear',
            ],
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => _onItemTap(items[index]),
          onLongPress: items[index].isArchived
              ? () => _showUnarchiveDialog(items[index])
              : () => _onItemLongPress(items[index]),
          child: ClothingItemCard(
            item: items[index],
            isSelected: _selectedItems.contains(items[index].id),
          ),
        ),
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
    );
  }

  void _onItemTap(ClothingItem item) {
    if (_isSelectionMode) {
      _toggleItemSelection(item.id);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddClothingItemScreen(item: item),
        ),
      );
    }
  }

  void _onItemLongPress(ClothingItem item) {
    if (!_isSelectionMode) {
      setState(() {
        _isSelectionMode = true;
        _selectedItems.add(item.id);
      });
    }
  }

  void _toggleItemSelection(String itemId) {
    setState(() {
      if (_selectedItems.contains(itemId)) {
        _selectedItems.remove(itemId);
        if (_selectedItems.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedItems.add(itemId);
      }
    });
  }



  bool _hasActiveFilters(ClothingFilterState filter) {
    return filter.types.isNotEmpty ||
        filter.categories.isNotEmpty ||
        filter.season != null ||
        filter.weatherRanges.isNotEmpty ||
        filter.colors.isNotEmpty ||
        filter.sizeFits.isNotEmpty;
  }

  PreferredSizeWidget _buildSelectionAppBar() {
    final filteredClothingItems = ref.watch(filteredClothingItemsProvider);
    final totalItems = filteredClothingItems.maybeWhen(
      data: (items) => items.where((item) => !item.isArchived).length,
      orElse: () => 0,
    );
    final allSelected = _selectedItems.length == totalItems && totalItems > 0;

    return AppBar(
      backgroundColor: AppTheme.lightGray,
      foregroundColor: AppTheme.primaryBlack,
      toolbarHeight: 48,
      leadingWidth: 40,
      leading: IconButton(
        icon: const Icon(Icons.close, size: 20),
        color: AppTheme.mediumGray,
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {
            _isSelectionMode = false;
            _selectedItems.clear();
          });
        },
      ),
      title: Row(
        children: [
          IconButton(
            icon: Icon(
              allSelected ? Icons.check_box : Icons.check_box_outline_blank,
              size: 20,
              color: AppTheme.mediumGray,
            ),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            onPressed: () {
              setState(() {
                if (allSelected) {
                  _selectedItems.clear();
                } else {
                  filteredClothingItems.whenData((items) {
                    _selectedItems.addAll(
                      items.where((item) => !item.isArchived).map((item) => item.id),
                    );
                  });
                }
              });
            },
            tooltip: allSelected ? 'Deselect All' : 'Select All',
          ),
          const SizedBox(width: 4),
          Text(
            '${_selectedItems.length}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          // Action buttons on the right side of title
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 22),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            color: _selectedItems.isEmpty ? AppTheme.mediumGray : Colors.red,
            onPressed: _selectedItems.isEmpty ? null : () => _showDeleteDialog(),
            tooltip: 'Delete',
          ),
          IconButton(
            icon: const Icon(Icons.archive_outlined, size: 22),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            color: _selectedItems.isEmpty ? AppTheme.mediumGray : Colors.orange,
            onPressed: _selectedItems.isEmpty ? null : () => _showArchiveDialog(),
            tooltip: 'Archive',
          ),
          IconButton(
            icon: const Icon(Icons.checkroom, size: 22),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            color: _selectedItems.isEmpty ? AppTheme.mediumGray : AppTheme.pastelPink,
            onPressed: _selectedItems.isEmpty ? null : () => _createOutfitFromSelection(),
            tooltip: 'Create Outfit',
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Items'),
        content: Text('Delete ${_selectedItems.length} selected item(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final repository = ref.read(clothingRepositoryProvider);
              for (final id in _selectedItems) {
                await repository.deleteClothingItem(id);
              }
              ref.invalidate(allClothingItemsProvider);
              ref.invalidate(filteredClothingItemsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedItems.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Items deleted')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showArchiveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Archive Items'),
        content: Text('Archive ${_selectedItems.length} selected item(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final repository = ref.read(clothingRepositoryProvider);
              for (final id in _selectedItems) {
                await repository.archiveClothingItem(id);
              }
              ref.invalidate(allClothingItemsProvider);
              ref.invalidate(filteredClothingItemsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedItems.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Items archived')),
              );
            },
            child: const Text('Archive'),
          ),
        ],
      ),
    );
  }

  void _createOutfitFromSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateOutfitScreen(
          initialSelectedItemIds: _selectedItems.toList(),
        ),
      ),
    ).then((_) {
      // Exit selection mode after creating outfit
      setState(() {
        _isSelectionMode = false;
        _selectedItems.clear();
      });
    });
  }

  Widget _buildCompactFilters() {
    final filter = ref.watch(clothingFilterProvider);

    return MinimalistFilters(
      selectedTypes: filter.types,
      selectedSeason: filter.season,
      selectedColors: filter.colors,
      selectedCategories: filter.categories,
      onTypesChanged: (types) {
        ref.read(clothingFilterProvider.notifier).updateTypes(types);
      },
      onSeasonChanged: (season) {
        ref.read(clothingFilterProvider.notifier).updateSeason(season);
      },
      onColorsChanged: (colors) {
        ref.read(clothingFilterProvider.notifier).updateColors(colors);
      },
      onCategoriesChanged: (categories) {
        ref.read(clothingFilterProvider.notifier).updateCategories(categories);
      },
    );
  }


  void _showUnarchiveDialog(ClothingItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unarchive Item'),
        content: Text('Do you want to unarchive "${item.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final repository = ref.read(clothingRepositoryProvider);
                await repository.unarchiveClothingItem(item.id);

                ref.invalidate(allClothingItemsProvider);
                ref.invalidate(filteredClothingItemsProvider);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} has been unarchived'),
                    backgroundColor: AppTheme.pastelPink,
                  ),
                );
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to unarchive item: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Unarchive'),
          ),
        ],
      ),
    );
  }


}