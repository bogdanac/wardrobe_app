import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/clothing_item_card.dart';
import '../widgets/minimalist_clothing_item_filters.dart';
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
  void initState() {
    super.initState();

    // Initialize season filter on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = ref.read(settingsProvider);
      final currentSeason = settings.currentSeason;
      if (currentSeason != null) {
        ref.read(clothingFilterProvider.notifier).updateSeason(currentSeason);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredClothingItems = ref.watch(filteredClothingItemsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _isSelectionMode ? _buildSelectionAppBar() : null,
      body: Column(
        children: [
          // Filters at top
          Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.lightGray.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildCompactFilters(),
          ),
          // Main content
          Expanded(
            child: filteredClothingItems.when(
              data: (items) => _buildClothingGrid(items),
              loading: () => _buildLoadingSkeleton(),
              error: (error, stack) {
                if (kDebugMode) {
                  print('ERROR LOADING ITEMS: $error');
                  print('STACK: $stack');
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text('Error: $error'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(filteredClothingItemsProvider);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppTheme.pastelPink,
        strokeWidth: 3,
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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive columns based on screen width
        int crossAxisCount = 2; // Mobile default
        double effectiveWidth = constraints.maxWidth;

        if (effectiveWidth > 2000) {
          crossAxisCount = 8; // Very wide screens
        } else if (effectiveWidth > 1800) {
          crossAxisCount = 7; // Extra wide screens
        } else if (effectiveWidth > 1600) {
          crossAxisCount = 6; // Wide desktop
        } else if (effectiveWidth > 1400) {
          crossAxisCount = 5; // Desktop
        } else if (effectiveWidth > 1200) {
          crossAxisCount = 4; // Small desktop
        } else if (effectiveWidth > 900) {
          crossAxisCount = 3; // Tablet landscape
        } else if (effectiveWidth > 600) {
          crossAxisCount = 2; // Tablet portrait
        }

        // Use full width on web, centered with padding on mobile
        return Padding(
          padding: EdgeInsets.only(
            left: effectiveWidth > 600 ? 16 : 8,
            right: effectiveWidth > 600 ? 16 : 8,
            top: effectiveWidth > 600 ? 16 : 8,
            bottom: effectiveWidth > 600 ? 16 : 4,
          ),
          child: MasonryGridView.count(
            crossAxisCount: crossAxisCount,
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
            mainAxisSpacing: effectiveWidth > 600 ? 12 : 6,
            crossAxisSpacing: effectiveWidth > 600 ? 12 : 6,
          ),
        );
      },
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
    final filter = ref.watch(clothingFilterProvider);
    final isArchiveMode = filter.showArchived;

    final totalItems = filteredClothingItems.maybeWhen(
      data: (items) => items.length,
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
                    _selectedItems.addAll(items.map((item) => item.id));
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
          if (isArchiveMode)
            IconButton(
              icon: const Icon(Icons.unarchive_outlined, size: 22),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              color: _selectedItems.isEmpty ? AppTheme.mediumGray : Colors.green,
              onPressed: _selectedItems.isEmpty ? null : () => _showUnarchiveBulkDialog(),
              tooltip: 'Unarchive',
            )
          else
            IconButton(
              icon: const Icon(Icons.archive_outlined, size: 22),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              color: _selectedItems.isEmpty ? AppTheme.mediumGray : Colors.orange,
              onPressed: _selectedItems.isEmpty ? null : () => _showArchiveDialog(),
              tooltip: 'Archive',
            ),
          if (!isArchiveMode)
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
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Items'),
        content: Text('Delete ${_selectedItems.length} selected item(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
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
              navigator.pop();
              if (mounted) {
                messenger.showSnackBar(
                  const SnackBar(content: Text('Items deleted')),
                );
              }
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
      builder: (dialogContext) => AlertDialog(
        title: const Text('Archive Items'),
        content: Text('Archive ${_selectedItems.length} selected item(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
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
              navigator.pop();
              if (mounted) {
                messenger.showSnackBar(
                  const SnackBar(content: Text('Items archived')),
                );
              }
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

    return MinimalistClothingItemFilters(
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
      builder: (dialogContext) => AlertDialog(
        title: const Text('Unarchive Item'),
        content: Text('Do you want to unarchive "${item.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
              try {
                final repository = ref.read(clothingRepositoryProvider);
                await repository.unarchiveClothingItem(item.id);

                ref.invalidate(allClothingItemsProvider);
                ref.invalidate(filteredClothingItemsProvider);

                navigator.pop();
                if (mounted) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('${item.name} has been unarchived'),
                      backgroundColor: AppTheme.pastelPink,
                    ),
                  );
                }
              } catch (e) {
                navigator.pop();
                if (mounted) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('Failed to unarchive item: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('Unarchive'),
          ),
        ],
      ),
    );
  }

  void _showUnarchiveBulkDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Unarchive Items'),
        content: Text('Unarchive ${_selectedItems.length} selected item(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
              final repository = ref.read(clothingRepositoryProvider);
              for (final id in _selectedItems) {
                await repository.unarchiveClothingItem(id);
              }
              ref.invalidate(allClothingItemsProvider);
              ref.invalidate(filteredClothingItemsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedItems.clear();
              });
              navigator.pop();
              if (mounted) {
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Items unarchived'),
                    backgroundColor: Colors.green,
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