import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/outfit_provider.dart';
import 'outfit_card.dart';

class OutfitVariantsSheet extends ConsumerWidget {
  final Outfit baseOutfit;

  const OutfitVariantsSheet({
    super.key,
    required this.baseOutfit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variantsAsync = ref.watch(outfitVariantsProvider(baseOutfit.id));

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: AppTheme.primaryBlack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          baseOutfit.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryWhite,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Outfit Variants',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppTheme.primaryWhite),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Variants list
            Expanded(
              child: variantsAsync.when(
                data: (variants) {
                  if (variants.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.content_copy,
                              size: 64,
                              color: AppTheme.mediumGray,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No variants yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.mediumGray,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Create variations of this outfit with different items, seasons, or styles',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.mediumGray,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Base outfit
                      const Text(
                        'Base Outfit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryWhite,
                        ),
                      ),
                      const SizedBox(height: 12),
                      OutfitCard(
                        outfit: baseOutfit,
                        onTap: () {
                          Navigator.pop(context);
                          // The parent screen will handle navigation
                        },
                      ),
                      const SizedBox(height: 24),
                      // Variants
                      Text(
                        'Variants (${variants.length})',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryWhite,
                        ),
                      ),
                      const SizedBox(height: 12),
                      MasonryGridView.count(
                        crossAxisCount: 2,
                        itemCount: variants.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => OutfitCard(
                          outfit: variants[index],
                          onTap: () {
                            Navigator.pop(context);
                            // The parent screen will handle navigation
                          },
                        ),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                    ],
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.pastelPink,
                  ),
                ),
                error: (error, stack) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Error loading variants',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryWhite,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          error.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.mediumGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
