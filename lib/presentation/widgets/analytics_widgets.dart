import 'package:flutter/material.dart';
import '../../domain/entities/wardrobe_analytics.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/themes/typography.dart';

/// Summary card showing key wardrobe statistics
class WardrobeStatsCard extends StatelessWidget {
  final WardrobeStats stats;

  const WardrobeStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Wardrobe Overview', style: AppTypography.h5),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    label: 'Total Items',
                    value: '${stats.totalItems}',
                    icon: Icons.checkroom,
                    color: AppTheme.pastelPink,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    label: 'Outfits Created',
                    value: '${stats.totalOutfits}',
                    icon: Icons.auto_awesome,
                    color: AppTheme.gold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    label: 'Avg. Wear Count',
                    value: stats.averageWearCount.toStringAsFixed(1),
                    icon: Icons.trending_up,
                    color: AppTheme.pastelPink,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    label: 'Unworn Items',
                    value: '${stats.unwornItems}',
                    icon: Icons.warning_outlined,
                    color: stats.unwornItems > stats.totalItems * 0.3 
                        ? Colors.orange 
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(value, style: AppTypography.h4.copyWith(color: color)),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.bodySmall, textAlign: TextAlign.center),
      ],
    );
  }
}

/// Circular progress indicator for sustainability score
class SustainabilityScoreWidget extends StatelessWidget {
  final SustainabilityMetrics metrics;

  const SustainabilityScoreWidget({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    final score = metrics.sustainabilityScore;
    final color = _getScoreColor(score);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Sustainability Score', style: AppTypography.h5),
            const SizedBox(height: 20),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: score / 100,
                      strokeWidth: 8,
                      backgroundColor: Colors.grey.withValues(alpha: 0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${score.toInt()}',
                        style: AppTypography.h2.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('out of 100', style: AppTypography.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _getScoreDescription(score),
              style: AppTypography.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '\$${metrics.averageCostPerWear.toStringAsFixed(2)} avg cost per wear',
              style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
            ),
          ],
        ),
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  String _getScoreDescription(double score) {
    if (score >= 80) return 'Excellent! Your wardrobe is highly sustainable.';
    if (score >= 60) return 'Good sustainability with room for improvement.';
    if (score >= 40) return 'Average sustainability. Consider optimizing usage.';
    return 'Your wardrobe could be more sustainable.';
  }
}

/// Usage patterns visualization
class UsagePatternsChart extends StatelessWidget {
  final List<UsagePattern> patterns;

  const UsagePatternsChart({super.key, required this.patterns});

  @override
  Widget build(BuildContext context) {
    final topItems = patterns.take(10).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Most Worn Items', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...topItems.map((pattern) => _UsagePatternBar(pattern: pattern)),
          ],
        ),
      ),
    );
  }
}

class _UsagePatternBar extends StatelessWidget {
  final UsagePattern pattern;

  const _UsagePatternBar({required this.pattern});

  @override
  Widget build(BuildContext context) {
    const maxWears = 50; // Normalize to this value
    final normalizedValue = (pattern.wearCount / maxWears).clamp(0.0, 1.0);
    final categoryColor = _getCategoryColor(pattern.category);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  pattern.itemName,
                  style: AppTypography.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${pattern.wearCount}x',
                  style: AppTypography.labelSmall.copyWith(color: categoryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: normalizedValue,
              child: Container(
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(UsageCategory category) {
    switch (category) {
      case UsageCategory.frequent:
        return Colors.green;
      case UsageCategory.regular:
        return Colors.blue;
      case UsageCategory.occasional:
        return Colors.orange;
      case UsageCategory.unused:
        return Colors.red;
      case UsageCategory.seasonal:
        return Colors.purple;
    }
  }
}

/// Color palette visualization
class ColorPaletteWidget extends StatelessWidget {
  final List<ColorAnalysis> colorAnalysis;

  const ColorPaletteWidget({super.key, required this.colorAnalysis});

  @override
  Widget build(BuildContext context) {
    final topColors = colorAnalysis.take(8).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Color Palette', style: AppTypography.h5),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: topColors.map((color) => _ColorSwatch(analysis: color)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final ColorAnalysis analysis;

  const _ColorSwatch({required this.analysis});

  @override
  Widget build(BuildContext context) {
    final color = _hexToColor(analysis.colorHex);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          analysis.colorName,
          style: AppTypography.labelSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          '${analysis.itemCount} items',
          style: AppTypography.labelSmall.copyWith(color: AppTheme.mediumGray),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }
}

/// Seasonal breakdown widget
class SeasonalBreakdownWidget extends StatelessWidget {
  final List<SeasonalInsight> insights;

  const SeasonalBreakdownWidget({super.key, required this.insights});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Seasonal Breakdown', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...insights.map((insight) => _SeasonalInsightItem(insight: insight)),
          ],
        ),
      ),
    );
  }
}

class _SeasonalInsightItem extends StatelessWidget {
  final SeasonalInsight insight;

  const _SeasonalInsightItem({required this.insight});

  @override
  Widget build(BuildContext context) {
    final utilizationColor = insight.utilizationRate > 0.7
        ? Colors.green
        : insight.utilizationRate > 0.4
            ? Colors.orange
            : Colors.red;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 40,
            decoration: BoxDecoration(
              color: _getSeasonColor(insight.season),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _getSeasonName(insight.season),
                      style: AppTypography.labelLarge,
                    ),
                    Text(
                      '${insight.availableItems} items',
                      style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Utilization: ${(insight.utilizationRate * 100).toInt()}%',
                      style: AppTypography.bodySmall.copyWith(color: utilizationColor),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: insight.utilizationRate,
                          child: Container(
                            decoration: BoxDecoration(
                              color: utilizationColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeasonColor(Season season) {
    switch (season) {
      case Season.spring:
        return Colors.lightGreen;
      case Season.summer:
        return Colors.orange;
      case Season.autumn:
        return Colors.brown;
      case Season.winter:
        return Colors.blueGrey;
      case Season.allSeason:
        return Colors.grey;
    }
  }

  String _getSeasonName(Season season) {
    return season.name[0].toUpperCase() + season.name.substring(1);
  }
}

/// Recommendations list widget
class RecommendationsWidget extends StatelessWidget {
  final List<RecommendationInsight> recommendations;

  const RecommendationsWidget({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recommendations', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...recommendations.take(5).map((rec) => _RecommendationItem(recommendation: rec)),
          ],
        ),
      ),
    );
  }
}

class _RecommendationItem extends StatelessWidget {
  final RecommendationInsight recommendation;

  const _RecommendationItem({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.lightGray.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getPriorityColor().withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getPriorityColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Priority ${recommendation.priority}',
                  style: AppTypography.labelSmall.copyWith(
                    color: _getPriorityColor(),
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                _getTypeIcon(),
                color: _getPriorityColor(),
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            recommendation.title,
            style: AppTypography.labelLarge,
          ),
          const SizedBox(height: 4),
          Text(
            recommendation.description,
            style: AppTypography.bodySmall,
          ),
          if (recommendation.reasoning != null) ...[
            const SizedBox(height: 8),
            Text(
              recommendation.reasoning!,
              style: AppTypography.bodySmall.copyWith(
                color: AppTheme.mediumGray,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getPriorityColor() {
    if (recommendation.priority >= 8) return Colors.red;
    if (recommendation.priority >= 6) return Colors.orange;
    return Colors.blue;
  }

  IconData _getTypeIcon() {
    switch (recommendation.type) {
      case RecommendationType.missingBasic:
        return Icons.shopping_bag_outlined;
      case RecommendationType.colorGap:
        return Icons.palette_outlined;
      case RecommendationType.seasonalNeed:
        return Icons.wb_sunny_outlined;
      case RecommendationType.versatilePiece:
        return Icons.auto_awesome_outlined;
      case RecommendationType.qualityUpgrade:
        return Icons.star_outline;
      case RecommendationType.occasionSpecific:
        return Icons.event_outlined;
    }
  }
}

/// Cost efficiency breakdown
class CostEfficiencyWidget extends StatelessWidget {
  final CostAnalysis costAnalysis;

  const CostEfficiencyWidget({super.key, required this.costAnalysis});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cost Efficiency', style: AppTypography.h5),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _CostStat(
                    label: 'Total Investment',
                    value: '\$${costAnalysis.totalSpent.toInt()}',
                    color: AppTheme.pastelPink,
                  ),
                ),
                Expanded(
                  child: _CostStat(
                    label: 'Avg. Item Cost',
                    value: '\$${costAnalysis.averageItemCost.toInt()}',
                    color: AppTheme.gold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (costAnalysis.mostEfficient.isNotEmpty) ...[
              const Text('Most Efficient Items', style: AppTypography.labelLarge),
              const SizedBox(height: 8),
              ...costAnalysis.mostEfficient.take(3).map((item) => 
                _EfficiencyItem(item: item, isPositive: true)),
            ],
          ],
        ),
      ),
    );
  }
}

class _CostStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _CostStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTypography.h4.copyWith(color: color)),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.bodySmall, textAlign: TextAlign.center),
      ],
    );
  }
}

class _EfficiencyItem extends StatelessWidget {
  final CostEfficiencyItem item;
  final bool isPositive;

  const _EfficiencyItem({required this.item, this.isPositive = true});

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? Colors.green : Colors.red;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.itemName,
              style: AppTypography.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '\$${item.costPerWear.toStringAsFixed(2)}/wear',
            style: AppTypography.bodySmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}