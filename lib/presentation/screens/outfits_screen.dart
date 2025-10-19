import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../widgets/outfit_card.dart';
import '../widgets/outfit_variants_sheet.dart';
import 'create_outfit_screen.dart';

class OutfitsScreen extends ConsumerStatefulWidget {
  const OutfitsScreen({super.key});

  @override
  ConsumerState<OutfitsScreen> createState() => _OutfitsScreenState();
}

class _OutfitsScreenState extends ConsumerState<OutfitsScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedOutfits = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredOutfits = ref.watch(filteredOutfitsProvider);

    return Scaffold(
      appBar: _isSelectionMode ? _buildSelectionAppBar() : null,
      body: Column(
        children: [
          Expanded(
            child: filteredOutfits.when(
              data: (outfits) => _buildOutfitGrid(outfits),
              loading: () => _buildLoadingSkeleton(),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
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

  Widget _buildOutfitGrid(List<Outfit> outfits) {
    if (outfits.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.palette_outlined,
              size: 64,
              color: AppTheme.mediumGray,
            ),
            SizedBox(height: 16),
            Text(
              'No outfits found',
              style: TextStyle(
                fontSize: 18,
                color: AppTheme.mediumGray,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Create your first outfit!',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive columns based on screen width
        int crossAxisCount = 2; // Mobile default
        double effectiveWidth = constraints.maxWidth;

        if (effectiveWidth > 2000) {
          crossAxisCount = 6; // Very wide screens
        } else if (effectiveWidth > 1800) {
          crossAxisCount = 5; // Extra wide screens
        } else if (effectiveWidth > 1600) {
          crossAxisCount = 5; // Wide desktop
        } else if (effectiveWidth > 1400) {
          crossAxisCount = 4; // Desktop
        } else if (effectiveWidth > 1200) {
          crossAxisCount = 3; // Small desktop
        } else if (effectiveWidth > 900) {
          crossAxisCount = 3; // Tablet landscape
        } else if (effectiveWidth > 600) {
          crossAxisCount = 2; // Tablet portrait
        }

        // Full width on web for bigger cards
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: double.infinity),
            child: Padding(
              padding: EdgeInsets.all(effectiveWidth > 600 ? 24 : 20),
              child: MasonryGridView.count(
                crossAxisCount: crossAxisCount,
                itemCount: outfits.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => _onOutfitTap(outfits[index]),
                  onLongPress: outfits[index].isArchived
                      ? () => _showUnarchiveDialog(outfits[index])
                      : () => _onOutfitLongPress(outfits[index]),
                  child: Stack(
                    children: [
                      OutfitCard(
                        outfit: outfits[index],
                        onTap: () => _onOutfitTap(outfits[index]),
                        onFavorite: () => _toggleFavorite(outfits[index]),
                        onWear: () => _markAsWornToday(outfits[index]),
                        onVariantsTap: () => _showVariants(outfits[index]),
                      ),
                      if (_isSelectionMode && _selectedOutfits.contains(outfits[index].id))
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppTheme.pastelPink,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.check, size: 16, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ),
                mainAxisSpacing: effectiveWidth > 600 ? 24 : 20,
                crossAxisSpacing: effectiveWidth > 600 ? 24 : 20,
              ),
            ),
          ),
        );
      },
    );
  }

  void _onOutfitTap(Outfit outfit) {
    if (_isSelectionMode) {
      _toggleOutfitSelection(outfit.id);
    } else {
      // Navigate to outfit details screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateOutfitScreen(outfit: outfit),
        ),
      );
    }
  }

  void _onOutfitLongPress(Outfit outfit) {
    if (!_isSelectionMode) {
      setState(() {
        _isSelectionMode = true;
        _selectedOutfits.add(outfit.id);
      });
    }
  }

  void _toggleOutfitSelection(String outfitId) {
    setState(() {
      if (_selectedOutfits.contains(outfitId)) {
        _selectedOutfits.remove(outfitId);
        if (_selectedOutfits.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedOutfits.add(outfitId);
      }
    });
  }

  Future<void> _toggleFavorite(Outfit outfit) async {
    try {
      final repository = ref.read(outfitRepositoryProvider);
      await repository.toggleFavorite(outfit.id);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update favorite: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _markAsWornToday(Outfit outfit) async {
    try {
      final repository = ref.read(outfitRepositoryProvider);
      await repository.markAsWornToday(outfit.id);

      // Also mark all clothing items in the outfit as worn
      final clothingRepository = ref.read(clothingRepositoryProvider);
      for (final itemId in outfit.clothingItemIds) {
        await clothingRepository.markAsWornToday(itemId);
      }

      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(allClothingItemsProvider);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Outfit marked as worn today!'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to mark as worn: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  PreferredSizeWidget _buildSelectionAppBar() {
    final filteredOutfits = ref.watch(filteredOutfitsProvider);
    final filter = ref.watch(outfitFilterProvider);
    final isArchiveMode = filter.showArchived;

    final totalOutfits = filteredOutfits.maybeWhen(
      data: (outfits) => outfits.length,
      orElse: () => 0,
    );
    final allSelected = _selectedOutfits.length == totalOutfits && totalOutfits > 0;

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
            _selectedOutfits.clear();
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
                  _selectedOutfits.clear();
                } else {
                  filteredOutfits.whenData((outfits) {
                    _selectedOutfits.addAll(outfits.map((outfit) => outfit.id));
                  });
                }
              });
            },
            tooltip: allSelected ? 'Deselect All' : 'Select All',
          ),
          const SizedBox(width: 4),
          Text(
            '${_selectedOutfits.length}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          // Action buttons
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 22),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            color: _selectedOutfits.isEmpty ? AppTheme.mediumGray : Colors.red,
            onPressed: _selectedOutfits.isEmpty ? null : () => _showDeleteDialog(),
            tooltip: 'Delete',
          ),
          if (isArchiveMode)
            IconButton(
              icon: const Icon(Icons.unarchive_outlined, size: 22),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              color: _selectedOutfits.isEmpty ? AppTheme.mediumGray : Colors.green,
              onPressed: _selectedOutfits.isEmpty ? null : () => _showUnarchiveBulkDialog(),
              tooltip: 'Unarchive',
            )
          else
            IconButton(
              icon: const Icon(Icons.archive_outlined, size: 22),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              color: _selectedOutfits.isEmpty ? AppTheme.mediumGray : Colors.orange,
              onPressed: _selectedOutfits.isEmpty ? null : () => _showArchiveDialog(),
              tooltip: 'Archive',
            ),
        ],
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Outfits'),
        content: Text('Delete ${_selectedOutfits.length} selected outfit(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
              final repository = ref.read(outfitRepositoryProvider);
              for (final id in _selectedOutfits) {
                await repository.deleteOutfit(id);
              }
              ref.invalidate(allOutfitsProvider);
              ref.invalidate(filteredOutfitsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedOutfits.clear();
              });
              navigator.pop();
              if (!mounted) return;
              messenger.showSnackBar(
                const SnackBar(content: Text('Outfits deleted')),
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
      builder: (dialogContext) => AlertDialog(
        title: const Text('Archive Outfits'),
        content: Text('Archive ${_selectedOutfits.length} selected outfit(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
              final repository = ref.read(outfitRepositoryProvider);
              for (final id in _selectedOutfits) {
                await repository.archiveOutfit(id);
              }
              ref.invalidate(allOutfitsProvider);
              ref.invalidate(filteredOutfitsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedOutfits.clear();
              });
              navigator.pop();
              if (!mounted) return;
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('Outfits archived'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: const Text('Archive'),
          ),
        ],
      ),
    );
  }

  void _showUnarchiveDialog(Outfit outfit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Unarchive Outfit'),
        content: Text('Do you want to unarchive "${outfit.name}"?'),
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
                final repository = ref.read(outfitRepositoryProvider);
                await repository.unarchiveOutfit(outfit.id);

                ref.invalidate(allOutfitsProvider);
                ref.invalidate(filteredOutfitsProvider);

                navigator.pop();
                if (!mounted) return;
                messenger.showSnackBar(
                  SnackBar(
                    content: Text('${outfit.name} has been unarchived'),
                    backgroundColor: AppTheme.pastelPink,
                  ),
                );
              } catch (e) {
                navigator.pop();
                if (!mounted) return;
                messenger.showSnackBar(
                  SnackBar(
                    content: Text('Failed to unarchive outfit: $e'),
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

  void _showUnarchiveBulkDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Unarchive Outfits'),
        content: Text('Unarchive ${_selectedOutfits.length} selected outfit(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(dialogContext);
              final repository = ref.read(outfitRepositoryProvider);
              for (final id in _selectedOutfits) {
                await repository.unarchiveOutfit(id);
              }
              ref.invalidate(allOutfitsProvider);
              ref.invalidate(filteredOutfitsProvider);
              setState(() {
                _isSelectionMode = false;
                _selectedOutfits.clear();
              });
              navigator.pop();
              if (!mounted) return;
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('Outfits unarchived'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Unarchive'),
          ),
        ],
      ),
    );
  }

  void _showVariants(Outfit outfit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OutfitVariantsSheet(baseOutfit: outfit),
    );
  }

}

