import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../widgets/clothing_item_card.dart';
import '../widgets/unified_filters.dart';
import '../widgets/minimalist_filters.dart';
import '../widgets/common/empty_state_widget.dart';
import 'add_clothing_item_screen.dart';
import 'simple_bulk_add_screen.dart';

class ClosetScreen extends ConsumerStatefulWidget {
  const ClosetScreen({super.key});

  @override
  ConsumerState<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends ConsumerState<ClosetScreen> {

  @override
  Widget build(BuildContext context) {
    final filteredClothingItems = ref.watch(filteredClothingItemsProvider);
    final filter = ref.watch(clothingFilterProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Closet'),
            if (filter.showArchived)
              Text(
                'Long press to unarchive items',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.orange.withValues(alpha: 0.8),
                  fontWeight: FontWeight.normal,
                ),
              ),
          ],
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(
              filter.showArchived ? Icons.archive : Icons.archive_outlined,
              color: filter.showArchived ? Colors.orange : null,
            ),
            onPressed: () {
              ref.read(clothingFilterProvider.notifier).updateShowArchived(!filter.showArchived);
            },
            tooltip: filter.showArchived ? 'Hide Archived' : 'Show Archived',
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: _hasActiveFilters(filter) ? AppTheme.pastelPink : null,
            ),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: "bulk_add",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SimpleBulkAddScreen(),
              ),
            ),
            backgroundColor: AppTheme.primaryWhite,
            foregroundColor: AppTheme.primaryBlack,
            child: const Icon(Icons.photo_library),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "single_add",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddClothingItemScreen(),
              ),
            ),
            backgroundColor: AppTheme.pastelPink,
            foregroundColor: AppTheme.primaryBlack,
            child: const Icon(Icons.add),
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
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: items[index].isArchived ? () => _showUnarchiveDialog(items[index]) : null,
          child: ClothingItemCard(
            item: items[index],
            onTap: () => _onItemTap(items[index]),
          ),
        ),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }

  void _onItemTap(ClothingItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddClothingItemScreen(item: item),
      ),
    );
  }

  bool _hasActiveFilters(ClothingFilterState filter) {
    return filter.types.isNotEmpty ||
        filter.categories.isNotEmpty ||
        filter.season != null ||
        filter.weatherRanges.isNotEmpty ||
        filter.colors.isNotEmpty ||
        filter.sizeFits.isNotEmpty;
  }

  Widget _buildCompactFilters() {
    final filter = ref.watch(clothingFilterProvider);

    return MinimalistFilters(
      selectedTypes: filter.types,
      selectedSeason: filter.season,
      selectedColors: filter.colors,
      selectedSizeFits: filter.sizeFits,
      onTypesChanged: (types) {
        ref.read(clothingFilterProvider.notifier).updateTypes(types);
      },
      onSeasonChanged: (season) {
        ref.read(clothingFilterProvider.notifier).updateSeason(season);
      },
      onColorsChanged: (colors) {
        ref.read(clothingFilterProvider.notifier).updateColors(colors);
      },
      onSizeFitsChanged: (sizeFits) {
        ref.read(clothingFilterProvider.notifier).updateSizeFits(sizeFits);
      },
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final currentFilter = ref.read(clothingFilterProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Items',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(clothingFilterProvider.notifier).clearFilters();
                    Navigator.pop(context);
                  },
                  child: const Text('Clear All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            UnifiedFilters(
              showCategories: true,
              showSeasons: true,
              showWeather: true,
              showColors: true,
              showClothingTypes: true,
              showFavorites: false,
              showMetallicElements: false,
              selectedCategories: currentFilter.categories,
              selectedSeason: currentFilter.season,
              selectedWeatherRanges: currentFilter.weatherRanges,
              selectedColors: currentFilter.colors,
              selectedTypes: currentFilter.types,
              selectedFavorites: null,
              selectedMetallicElements: null,
              onCategoriesChanged: (categories) {
                ref.read(clothingFilterProvider.notifier).updateCategories(categories);
              },
              onSeasonChanged: (season) {
                ref.read(clothingFilterProvider.notifier).updateSeason(season);
              },
              onWeatherChanged: (ranges) {
                ref.read(clothingFilterProvider.notifier).updateWeatherRanges(ranges);
              },
              onColorsChanged: (colors) {
                ref.read(clothingFilterProvider.notifier).updateColors(colors);
              },
              onTypesChanged: (types) {
                ref.read(clothingFilterProvider.notifier).updateTypes(types);
              },
              onFavoritesChanged: (favorites) {},
              onMetallicElementsChanged: (elements) {
                // For now, metallic elements filtering is disabled in closet screen
                // This can be enabled later by adding metallic elements to the filter provider
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Apply Filters'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
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