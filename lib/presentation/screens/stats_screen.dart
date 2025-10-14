import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/stats_provider.dart';
import 'enhanced_analytics_screen.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(wardrobeStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EnhancedAnalyticsScreen(),
              ),
            ),
            tooltip: 'Advanced Analytics',
          ),
        ],
      ),
      body: statsAsync.when(
        data: (stats) => _buildStatsContent(stats),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppTheme.mediumGray,
              ),
              const SizedBox(height: 16),
              Text('Error loading statistics: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(wardrobeStatsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsContent(WardrobeStats stats) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildOverviewCards(stats),
        const SizedBox(height: 24),
        _buildWearAnalytics(stats),
        const SizedBox(height: 24),
        _buildTypeDistribution(stats),
        const SizedBox(height: 24),
        _buildColorAnalysis(stats),
        const SizedBox(height: 24),
        _buildSeasonalBreakdown(stats),
        const SizedBox(height: 24),
        _buildMostWornItems(stats),
        const SizedBox(height: 24),
        _buildLeastWornItems(stats),
        const SizedBox(height: 24),
        _buildNewestItems(stats),
        const SizedBox(height: 24),
        _buildFavoriteOutfits(stats),
      ],
    );
  }

  Widget _buildOverviewCards(WardrobeStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total Items',
                stats.totalItems.toString(),
                Icons.checkroom,
                AppTheme.pastelPink,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                'Total Outfits',
                stats.totalOutfits.toString(),
                Icons.palette,
                AppTheme.gold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Avg. Wear Count',
                stats.averageWearCount.toStringAsFixed(1),
                Icons.repeat,
                AppTheme.primaryBlack,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                'This Month',
                '${stats.itemsWornThisMonth} items',
                Icons.calendar_month,
                AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWearAnalytics(WardrobeStats stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wear Analytics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.trending_up, color: AppTheme.pastelPink),
                const SizedBox(width: 8),
                Text('Items worn this month: ${stats.itemsWornThisMonth}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.favorite, color: AppTheme.gold),
                const SizedBox(width: 8),
                Text('Outfits worn this month: ${stats.outfitsWornThisMonth}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.bar_chart, color: AppTheme.primaryWhite),
                const SizedBox(width: 8),
                Text('Average wear count: ${stats.averageWearCount.toStringAsFixed(1)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeDistribution(WardrobeStats stats) {
    if (stats.itemsByType.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Items by Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...stats.itemsByType.entries.map((entry) {
              final percentage = (entry.value / stats.totalItems * 100).toInt();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        _getTypeLabel(entry.key),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: entry.value / stats.totalItems,
                        backgroundColor: AppTheme.lightGray,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${entry.value} ($percentage%)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildColorAnalysis(WardrobeStats stats) {
    if (stats.colorDistribution.isEmpty) return const SizedBox.shrink();

    final topColors = stats.colorDistribution.entries
        .toList()
        ..sort((a, b) => b.value.compareTo(a.value))
        ..take(5);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Colors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: topColors.map((entry) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _hexToColor(entry.key),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${entry.value} items',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeasonalBreakdown(WardrobeStats stats) {
    if (stats.seasonalDistribution.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seasonal Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...stats.seasonalDistribution.entries.map((entry) {
              final percentage = (entry.value / stats.totalItems * 100).toInt();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        _getSeasonLabel(entry.key),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: entry.value / stats.totalItems,
                        backgroundColor: AppTheme.lightGray,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.gold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${entry.value} ($percentage%)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMostWornItems(WardrobeStats stats) {
    if (stats.mostWornItems.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Most Worn Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...stats.mostWornItems.map((item) => _buildItemRow(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildLeastWornItems(WardrobeStats stats) {
    if (stats.leastWornItems.isEmpty) return const SizedBox.shrink();
    
    final leastWorn = stats.leastWornItems.where((item) => item.wearCount == 0).toList();
    if (leastWorn.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Never Worn Items (${leastWorn.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Consider styling these items or donating them!',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.mediumGray,
              ),
            ),
            const SizedBox(height: 16),
            ...leastWorn.take(5).map((item) => _buildItemRow(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildNewestItems(WardrobeStats stats) {
    if (stats.newestItems.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Newest Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...stats.newestItems.map((item) => _buildItemRow(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteOutfits(WardrobeStats stats) {
    if (stats.favoriteOutfits.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Outfits (${stats.favoriteOutfits.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...stats.favoriteOutfits.take(5).map((outfit) => _buildOutfitRow(outfit)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.mediumGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(ClothingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.lightGray,
            ),
            child: item.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(item.imagePath!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.checkroom, size: 20),
                    ),
                  )
                : Icon(
                    _getTypeIcon(item.type),
                    size: 20,
                    color: AppTheme.mediumGray,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTypeLabel(item.type),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Worn ${item.wearCount}x',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          if (item.lastWornDate != null)
            Text(
              _getLastWornText(item.lastWornDate!),
              style: const TextStyle(
                fontSize: 10,
                color: AppTheme.mediumGray,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOutfitRow(Outfit outfit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.lightGray,
            ),
            child: const Icon(
              Icons.palette,
              size: 20,
              color: AppTheme.mediumGray,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  outfit.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${outfit.clothingItemIds.length} items • Worn ${outfit.wearCount}x',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.favorite,
            size: 16,
            color: AppTheme.pastelPink,
          ),
        ],
      ),
    );
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Top';
      case ClothingType.bottom: return 'Bottom';
      case ClothingType.dress: return 'Dress';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.bag: return 'Bag';
      case ClothingType.accessory: return 'Accessory';
      case ClothingType.outerwear: return 'Coat';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.swimwear: return 'Swimwear';
    }
  }

  String _getSeasonLabel(Season season) {
    switch (season) {
      case Season.spring: return 'Spring';
      case Season.summer: return 'Summer';
      case Season.autumn: return 'Autumn';
      case Season.winter: return 'Winter';
      case Season.allSeason: return 'All Season';
    }
  }

  IconData _getTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top: return Icons.checkroom;
      case ClothingType.bottom: return Icons.checkroom;
      case ClothingType.shoes: return Icons.directions_walk;
      case ClothingType.accessory: return Icons.diamond;
      case ClothingType.outerwear: return Icons.checkroom;
      case ClothingType.bag: return Icons.work_outline;
      case ClothingType.swimwear: return Icons.pool;
      case ClothingType.activewear: return Icons.fitness_center;
      case ClothingType.dress: return Icons.checkroom;
    }
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return AppTheme.mediumGray;
    }
  }

  String _getLastWornText(DateTime lastWorn) {
    final now = DateTime.now();
    final difference = now.difference(lastWorn);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return '1d ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7}w ago';
    } else {
      return '${difference.inDays ~/ 30}m ago';
    }
  }
}
