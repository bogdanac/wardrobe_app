import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../widgets/clothing_item_card.dart';
import '../widgets/unified_filters.dart';
import 'add_clothing_item_screen.dart';

class ClosetScreen extends ConsumerStatefulWidget {
  const ClosetScreen({super.key});

  @override
  ConsumerState<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends ConsumerState<ClosetScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredClothingItems = ref.watch(filteredClothingItemsProvider);
    final filter = ref.watch(clothingFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Closet'),
        actions: [
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search clothing items...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                ref.read(clothingFilterProvider.notifier).updateSearchQuery(query);
              },
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddClothingItemScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildClothingGrid(List<ClothingItem> items) {
    if (items.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.checkroom_outlined,
              size: 64,
              color: AppTheme.mediumGray,
            ),
            SizedBox(height: 16),
            Text(
              'No clothing items found',
              style: TextStyle(
                fontSize: 18,
                color: AppTheme.mediumGray,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add some items to get started!',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: items.length,
        itemBuilder: (context, index) => ClothingItemCard(
          item: items[index],
          onTap: () => _onItemTap(items[index]),
        ),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }

  void _onItemTap(ClothingItem item) {
    // Navigate to item details screen
  }

  bool _hasActiveFilters(ClothingFilterState filter) {
    return filter.types.isNotEmpty ||
        filter.categories.isNotEmpty ||
        filter.season != null ||
        filter.weatherRanges.isNotEmpty ||
        filter.colors.isNotEmpty;
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
              selectedCategories: currentFilter.categories,
              selectedSeason: currentFilter.season,
              selectedWeatherRanges: currentFilter.weatherRanges,
              selectedColors: currentFilter.colors,
              selectedTypes: currentFilter.types,
              selectedFavorites: null,
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
}