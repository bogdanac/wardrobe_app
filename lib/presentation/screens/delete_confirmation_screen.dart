import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_provider.dart';

class DeleteConfirmationScreen extends ConsumerStatefulWidget {
  final ClothingItem clothingItem;

  const DeleteConfirmationScreen({
    super.key,
    required this.clothingItem,
  });

  @override
  ConsumerState<DeleteConfirmationScreen> createState() => _DeleteConfirmationScreenState();
}

class _DeleteConfirmationScreenState extends ConsumerState<DeleteConfirmationScreen> {
  List<Outfit> affectedOutfits = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAffectedOutfits();
  }

  Future<void> _loadAffectedOutfits() async {
    try {
      final repository = ref.read(outfitRepositoryProvider);
      final allOutfits = await repository.getAllOutfits();

      setState(() {
        affectedOutfits = allOutfits
            .where((outfit) => outfit.clothingItemIds.contains(widget.clothingItem.id))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Item'),
        backgroundColor: AppTheme.primaryBlack,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemCard(),
                  const SizedBox(height: 24),
                  _buildDeleteWarning(),
                  const SizedBox(height: 24),
                  if (affectedOutfits.isNotEmpty) ...[
                    _buildAffectedOutfits(),
                    const SizedBox(height: 24),
                  ],
                  _buildActionButtons(),
                ],
              ),
            ),
    );
  }

  Widget _buildItemCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: widget.clothingItem.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.clothingItem.imagePath!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.checkroom, size: 30),
                      ),
                    )
                  : const Icon(Icons.checkroom, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.clothingItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.clothingItem.brand?.isNotEmpty == true)
                    Text(
                      widget.clothingItem.brand!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  Text(
                    'Worn ${widget.clothingItem.wearCount} times',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.mediumGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteWarning() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'This action cannot be undone',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'The clothing item will be permanently deleted from your wardrobe. Consider archiving instead if you might want it back later.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildAffectedOutfits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Outfits that include this item (${affectedOutfits.length})',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.archive_outlined, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'These outfits will be archived (not deleted)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'You can unarchive and edit them later to replace the missing item.',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 8),
              ...affectedOutfits.take(5).map((outfit) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• ${outfit.name}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              )),
              if (affectedOutfits.length > 5)
                Text(
                  '...and ${affectedOutfits.length - 5} more',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _deleteItem,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Delete Item Permanently'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }

  Future<void> _deleteItem() async {
    try {
      final clothingRepository = ref.read(clothingRepositoryProvider);
      final outfitRepository = ref.read(outfitRepositoryProvider);

      // Archive affected outfits before deleting the item
      final now = DateTime.now();
      for (final outfit in affectedOutfits) {
        final updatedOutfit = outfit.copyWith(
          isArchived: true,
          dateArchived: now,
        );
        await outfitRepository.updateOutfit(updatedOutfit);
      }

      // Delete the clothing item
      await clothingRepository.deleteClothingItem(widget.clothingItem.id);

      // Refresh providers
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);

      if (mounted) {
        Navigator.pop(context, true); // Return true to indicate success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.clothingItem.name} has been deleted'),
                if (affectedOutfits.isNotEmpty)
                  Text(
                    '${affectedOutfits.length} outfit(s) archived',
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete item: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}