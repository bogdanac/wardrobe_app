import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/themes/app_theme.dart';
import '../../../domain/entities/clothing_item.dart';
import '../../providers/clothing_provider.dart';
import '../../widgets/common/empty_state_widget.dart';
import '../add_clothing_item_screen.dart';
import '../simple_bulk_add_screen.dart';
import '../home_screen.dart';

class QuickStartWizard extends ConsumerStatefulWidget {
  const QuickStartWizard({super.key});

  @override
  ConsumerState<QuickStartWizard> createState() => _QuickStartWizardState();
}

class _QuickStartWizardState extends ConsumerState<QuickStartWizard> {
  final int _targetItems = 5;

  @override
  Widget build(BuildContext context) {
    final clothingItems = ref.watch(allClothingItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Setup'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _skipToApp(),
        ),
        actions: [
          TextButton(
            onPressed: _skipToApp,
            child: const Text(
              'Skip',
              style: TextStyle(color: AppTheme.mediumGray),
            ),
          ),
        ],
      ),
      body: clothingItems.when(
        data: (items) => _buildWizardContent(items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildWizardContent(List<ClothingItem> items) {
    final progress = items.length / _targetItems;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress header
          _buildProgressHeader(progress, items.length),

          const SizedBox(height: 32),

          // Main content based on progress
          if (items.isEmpty) ...[
            _buildGettingStartedContent(),
          ] else if (items.length < _targetItems) ...[
            _buildAddMoreItemsContent(items),
          ] else ...[
            _buildCompletionContent(items),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressHeader(double progress, int itemCount) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.pastelPink.withValues(alpha: 0.1),
            AppTheme.gold.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.pastelPink.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Building Your Wardrobe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
              ),
              Text(
                '$itemCount/$_targetItems',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.pastelPink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: AppTheme.mediumGray.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                progress >= 1.0 ? Colors.green : AppTheme.pastelPink,
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            progress >= 1.0
                ? '🎉 Great job! Your wardrobe is ready!'
                : 'Add ${_targetItems - itemCount} more items to get started',
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGettingStartedContent() {
    return Column(
      children: [
        EmptyStateWidget(
          icon: Icons.add_a_photo,
          title: 'Let\'s add your first items!',
          subtitle: 'Start by adding at least 5 clothing items to get the most out of your wardrobe app.',
          actionText: 'Take a Photo',
          onActionPressed: () => _navigateToAddItem(),
          secondaryActionText: 'Add Multiple Photos',
          onSecondaryActionPressed: () => _navigateToBulkAdd(),
          additionalWidgets: [
            _buildQuickTips([
              'Good lighting makes better photos',
              'Lay clothes flat on a clean surface',
              'Include shoes and accessories too',
              'You can edit details later',
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildAddMoreItemsContent(List<ClothingItem> items) {
    return Column(
      children: [
        // Show recent items
        if (items.isNotEmpty) ...[
          const Text(
            'Recent Items Added',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.take(5).length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.mediumGray.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.mediumGray.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getIconForType(item.type),
                        size: 24,
                        color: AppTheme.pastelPink,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.name.length > 8
                            ? '${item.name.substring(0, 8)}...'
                            : item.name,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppTheme.mediumGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
        ],

        // Continue adding section
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.mediumGray.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppTheme.mediumGray.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.add_circle_outline,
                size: 48,
                color: AppTheme.pastelPink,
              ),
              const SizedBox(height: 16),
              Text(
                'Keep going! Add ${_targetItems - items.length} more items',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'The more items you add, the better outfit recommendations you\'ll get!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.mediumGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _navigateToAddItem,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.pastelPink,
                        foregroundColor: AppTheme.primaryBlack,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Add One Item'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _navigateToBulkAdd,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(
                          color: AppTheme.pastelPink,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Bulk Add',
                        style: TextStyle(color: AppTheme.pastelPink),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompletionContent(List<ClothingItem> items) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.withValues(alpha: 0.1),
                AppTheme.pastelPink.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Wardrobe Setup Complete!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryBlack,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'You\'ve added ${items.length} items to your wardrobe. You\'re ready to start creating amazing outfits!',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.mediumGray,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _completeSetup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.launch, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Start Using the App',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickTips(List<String> tips) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.gold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.gold.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 18,
                color: AppTheme.gold,
              ),
              SizedBox(width: 8),
              Text(
                'Quick Tips',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.gold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...tips.map((tip) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.only(top: 8, right: 12),
                  decoration: const BoxDecoration(
                    color: AppTheme.gold,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    tip,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.mediumGray,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  IconData _getIconForType(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return Icons.checkroom;
      case ClothingType.bottom:
        return Icons.straighten;
      case ClothingType.shoes:
        return Icons.directions_run;
      case ClothingType.outerwear:
        return Icons.ac_unit;
      case ClothingType.accessory:
        return Icons.watch;
      case ClothingType.activewear:
        return Icons.fitness_center;
      case ClothingType.swimwear:
        return Icons.pool;
      case ClothingType.bag:
        return Icons.shopping_bag;
      case ClothingType.dress:
        return Icons.woman;
    }
  }

  void _navigateToAddItem() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddClothingItemScreen(),
      ),
    );
    // Refresh items after adding
    ref.invalidate(allClothingItemsProvider);
  }

  void _navigateToBulkAdd() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SimpleBulkAddScreen(),
      ),
    );
    // Refresh items after adding
    ref.invalidate(allClothingItemsProvider);
  }

  void _completeSetup() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _skipToApp() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }
}