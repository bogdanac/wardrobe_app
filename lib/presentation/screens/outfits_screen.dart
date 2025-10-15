import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../widgets/outfit_card.dart';
import 'create_outfit_screen.dart';

class OutfitsScreen extends ConsumerStatefulWidget {
  const OutfitsScreen({super.key});

  @override
  ConsumerState<OutfitsScreen> createState() => _OutfitsScreenState();
}

class _OutfitsScreenState extends ConsumerState<OutfitsScreen> {

  @override
  Widget build(BuildContext context) {
    final filteredOutfits = ref.watch(filteredOutfitsProvider);
    ref.watch(outfitFilterProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: filteredOutfits.when(
              data: (outfits) => _buildOutfitGrid(outfits),
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: outfits.length,
        itemBuilder: (context, index) => OutfitCard(
          outfit: outfits[index],
          onTap: () => _onOutfitTap(outfits[index]),
          onFavorite: () => _toggleFavorite(outfits[index]),
          onWear: () => _markAsWornToday(outfits[index]),
        ),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }

  void _onOutfitTap(Outfit outfit) {
    // Navigate to outfit details screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateOutfitScreen(outfit: outfit),
      ),
    );
  }

  Future<void> _toggleFavorite(Outfit outfit) async {
    try {
      final repository = ref.read(outfitRepositoryProvider);
      await repository.toggleFavorite(outfit.id);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
    } catch (e) {
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
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Outfit marked as worn today!'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to mark as worn: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }



}

