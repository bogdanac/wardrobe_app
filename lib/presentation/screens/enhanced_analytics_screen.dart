import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/wardrobe_analytics.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/errors/error_handler.dart';
import '../../core/utils/loading_state.dart';
import '../../core/themes/app_theme.dart';
import '../../core/themes/typography.dart';
import '../providers/clothing_provider.dart';
import '../widgets/analytics_widgets.dart';

/// Enhanced analytics screen with comprehensive wardrobe insights
class EnhancedAnalyticsScreen extends ConsumerStatefulWidget {
  const EnhancedAnalyticsScreen({super.key});

  @override
  ConsumerState<EnhancedAnalyticsScreen> createState() => _EnhancedAnalyticsScreenState();
}

class _EnhancedAnalyticsScreenState extends ConsumerState<EnhancedAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  WardrobeAnalytics? _analytics;
  LoadingState _loadingState = const LoadingState(
    type: LoadingType.loading,
    message: 'Analyzing your wardrobe...',
  );
  final ErrorHandler _errorHandler = ErrorHandler();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadAnalytics();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAnalytics() async {
    setState(() {
      _loadingState = const LoadingState(
        type: LoadingType.processing,
        message: 'Analyzing your wardrobe...',
      );
    });

    try {
      ref.read(clothingRepositoryProvider);
      // final outfitRepository = ref.read(outfitRepositoryProvider); // TODO: Create outfit repository provider
      // TODO: Comment out until outfit repository is available
      // final analyticsService = WardrobeAnalyticsService(
      //   clothingRepository,
      //   outfitRepository,
      // );

      // TODO: Uncomment when service is available
      // final analytics = await analyticsService.generateAnalytics();
      
      if (mounted) {
        setState(() {
          // _analytics = analytics; // TODO: Uncomment when analytics is available
          _loadingState = LoadingState.hidden;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingState = LoadingState.hidden;
        });
        final appException = _errorHandler.handleError(e, context: 'loading analytics');
        _errorHandler.showErrorSnackBar(context, appException);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wardrobe Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAnalytics,
            tooltip: 'Refresh Analytics',
          ),
        ],
        bottom: _analytics != null
            ? TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
                  Tab(text: 'Usage', icon: Icon(Icons.trending_up)),
                  Tab(text: 'Colors', icon: Icon(Icons.palette)),
                  Tab(text: 'Insights', icon: Icon(Icons.lightbulb)),
                ],
              )
            : null,
      ),
      body: LoadingOverlay(
        state: _loadingState,
        child: _analytics != null
            ? TabBarView(
                controller: _tabController,
                children: [
                  _buildOverviewTab(),
                  _buildUsageTab(),
                  _buildColorsTab(),
                  _buildInsightsTab(),
                ],
              )
            : _buildEmptyState(),
      ),
    );
  }

  Widget _buildOverviewTab() {
    final analytics = _analytics!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          WardrobeStatsCard(stats: analytics.stats),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SustainabilityScoreWidget(metrics: analytics.sustainability),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CostEfficiencyWidget(costAnalysis: analytics.costAnalysis),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SeasonalBreakdownWidget(insights: analytics.seasonalInsights),
        ],
      ),
    );
  }

  Widget _buildUsageTab() {
    final analytics = _analytics!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          UsagePatternsChart(patterns: analytics.usagePatterns),
          const SizedBox(height: 16),
          _buildUsageCategoryBreakdown(analytics.usagePatterns),
          const SizedBox(height: 16),
          _buildMostNeglectedItems(analytics.usagePatterns),
        ],
      ),
    );
  }

  Widget _buildColorsTab() {
    final analytics = _analytics!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ColorPaletteWidget(colorAnalysis: analytics.colorAnalysis),
          const SizedBox(height: 16),
          _buildColorInsights(analytics.colorAnalysis),
          const SizedBox(height: 16),
          _buildSeasonalColorAnalysis(analytics.seasonalInsights),
        ],
      ),
    );
  }

  Widget _buildInsightsTab() {
    final analytics = _analytics!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RecommendationsWidget(recommendations: analytics.recommendations),
          const SizedBox(height: 16),
          _buildSustainabilityTips(analytics.sustainability),
          const SizedBox(height: 16),
          _buildBudgetRecommendations(analytics.costAnalysis),
        ],
      ),
    );
  }

  Widget _buildUsageCategoryBreakdown(List<UsagePattern> patterns) {
    final categoryCounts = <UsageCategory, int>{};
    for (final pattern in patterns) {
      categoryCounts[pattern.category] = (categoryCounts[pattern.category] ?? 0) + 1;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Usage Categories', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...categoryCounts.entries.map((entry) => 
              _CategoryBreakdownItem(
                category: entry.key,
                count: entry.value,
                total: patterns.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMostNeglectedItems(List<UsagePattern> patterns) {
    final neglectedItems = patterns
        .where((p) => p.category == UsageCategory.unused || p.wearCount == 0)
        .take(5)
        .toList();

    if (neglectedItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Items to Rediscover', style: AppTypography.h5),
            const SizedBox(height: 8),
            Text(
              'These items could use some love',
              style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
            ),
            const SizedBox(height: 16),
            ...neglectedItems.map((pattern) => 
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.orange,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        pattern.itemName,
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        pattern.wearCount == 0 ? 'Never worn' : '${pattern.wearCount}x',
                        style: AppTypography.labelSmall.copyWith(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorInsights(List<ColorAnalysis> colorAnalysis) {
    final dominantColors = colorAnalysis.where((c) => c.category == ColorCategory.dominant).length;
    final underusedColors = colorAnalysis.where((c) => c.category == ColorCategory.underused).length;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Color Insights', style: AppTypography.h5),
            const SizedBox(height: 16),
            _InsightItem(
              icon: Icons.palette,
              title: 'Dominant Colors',
              value: '$dominantColors colors',
              description: 'Colors that appear in 20%+ of your wardrobe',
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            _InsightItem(
              icon: Icons.color_lens,
              title: 'Underused Colors',
              value: '$underusedColors colors',
              description: 'Colors that could be featured more prominently',
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _InsightItem(
              icon: Icons.auto_awesome,
              title: 'Color Harmony',
              value: '${_calculateColorHarmonyScore(colorAnalysis)}%',
              description: 'How well your colors work together',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeasonalColorAnalysis(List<SeasonalInsight> insights) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Seasonal Color Distribution', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...insights.map((insight) => 
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getSeasonName(insight.season),
                      style: AppTypography.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: insight.colorDistribution.entries
                          .take(5)
                          .map((entry) => 
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.lightGray.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${entry.key} (${entry.value})',
                                style: AppTypography.labelSmall,
                              ),
                            ),
                          ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSustainabilityTips(SustainabilityMetrics metrics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sustainability Tips', style: AppTypography.h5),
            const SizedBox(height: 16),
            ...metrics.tips.map((tip) => 
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.lightGray.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _getSustainabilityIcon(tip.category),
                          color: AppTheme.pastelPink,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip.title,
                            style: AppTypography.labelLarge,
                          ),
                        ),
                        ...List.generate(
                          tip.impact,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tip.description,
                      style: AppTypography.bodySmall,
                    ),
                    if (tip.actionItems.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ...tip.actionItems.map((action) => 
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• ', style: AppTypography.bodySmall),
                              Expanded(
                                child: Text(
                                  action,
                                  style: AppTypography.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetRecommendations(CostAnalysis costAnalysis) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Budget Insights', style: AppTypography.h5),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.gold.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suggested Monthly Budget',
                    style: AppTypography.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${costAnalysis.budgetRecommendation.suggestedMonthlyBudget.toInt()}',
                    style: AppTypography.h4.copyWith(color: AppTheme.gold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Based on your current wardrobe investment and usage patterns',
                    style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Budget Tips', style: AppTypography.labelLarge),
            const SizedBox(height: 8),
            ...costAnalysis.budgetRecommendation.budgetTips.map((tip) => 
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: AppTheme.gold,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip,
                        style: AppTypography.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.analytics_outlined,
            size: 64,
            color: AppTheme.mediumGray,
          ),
          const SizedBox(height: 16),
          Text(
            'No analytics available',
            style: AppTypography.h5.copyWith(color: AppTheme.mediumGray),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some clothing items to see insights',
            style: AppTypography.bodyMedium.copyWith(color: AppTheme.mediumGray),
          ),
        ],
      ),
    );
  }

  String _getSeasonName(Season season) {
    return season.name[0].toUpperCase() + season.name.substring(1);
  }

  int _calculateColorHarmonyScore(List<ColorAnalysis> colors) {
    if (colors.length < 2) return 0;
    
    int harmoniousConnections = 0;
    int totalConnections = 0;
    
    for (int i = 0; i < colors.length; i++) {
      for (int j = i + 1; j < colors.length; j++) {
        totalConnections++;
        if (colors[i].compatibleColors.contains(colors[j].colorHex) ||
            colors[j].compatibleColors.contains(colors[i].colorHex)) {
          harmoniousConnections++;
        }
      }
    }
    
    return totalConnections > 0 ? ((harmoniousConnections / totalConnections) * 100).round() : 0;
  }

  IconData _getSustainabilityIcon(SustainabilityCategory category) {
    switch (category) {
      case SustainabilityCategory.costEfficiency:
        return Icons.attach_money;
      case SustainabilityCategory.itemUtilization:
        return Icons.trending_up;
      case SustainabilityCategory.qualityInvestment:
        return Icons.star;
      case SustainabilityCategory.versatility:
        return Icons.shuffle;
      case SustainabilityCategory.longevity:
        return Icons.schedule;
    }
  }
}

class _CategoryBreakdownItem extends StatelessWidget {
  final UsageCategory category;
  final int count;
  final int total;

  const _CategoryBreakdownItem({
    required this.category,
    required this.count,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (count / total) * 100 : 0;
    final color = _getCategoryColor();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _getCategoryName(),
              style: AppTypography.bodyMedium,
            ),
          ),
          Text(
            '$count items (${percentage.toInt()}%)',
            style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
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

  String _getCategoryName() {
    switch (category) {
      case UsageCategory.frequent:
        return 'Frequent (4+ times/month)';
      case UsageCategory.regular:
        return 'Regular (2-4 times/month)';
      case UsageCategory.occasional:
        return 'Occasional (<2 times/month)';
      case UsageCategory.unused:
        return 'Unused (never or 6+ months)';
      case UsageCategory.seasonal:
        return 'Seasonal';
    }
  }
}

class _InsightItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String description;
  final Color color;

  const _InsightItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTypography.labelMedium),
                  Text(
                    value,
                    style: AppTypography.labelMedium.copyWith(color: color),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: AppTypography.bodySmall.copyWith(color: AppTheme.mediumGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}