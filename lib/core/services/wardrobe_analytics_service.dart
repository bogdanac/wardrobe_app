// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/wardrobe_analytics.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../themes/app_colors.dart';

/// Service for calculating comprehensive wardrobe analytics
class WardrobeAnalyticsService {
  final ClothingRepository _clothingRepository;
  final OutfitRepository _outfitRepository;

  WardrobeAnalyticsService(this._clothingRepository, this._outfitRepository);

  /// Generate complete wardrobe analytics
  Future<WardrobeAnalytics> generateAnalytics() async {
    final items = await _clothingRepository.getAllClothingItems();
    final outfits = await _outfitRepository.getAllOutfits();

    final stats = await _calculateStats(items, outfits);
    final usagePatterns = _analyzeUsagePatterns(items);
    final colorAnalysis = _analyzeColors(items, outfits);
    final seasonalInsights = _analyzeSeasonalUsage(items);
    final sustainability = _calculateSustainabilityMetrics(items);
    final recommendations = _generateRecommendations(items, stats, colorAnalysis);
    final costAnalysis = _analyzeCosts(items);

    return WardrobeAnalytics(
      stats: stats,
      usagePatterns: usagePatterns,
      colorAnalysis: colorAnalysis,
      seasonalInsights: seasonalInsights,
      sustainability: sustainability,
      recommendations: recommendations,
      costAnalysis: costAnalysis,
    );
  }

  /// Calculate basic wardrobe statistics
  Future<WardrobeStats> _calculateStats(List<ClothingItem> items, List<Outfit> outfits) async {
    final itemsByType = <ClothingType, int>{};
    final itemsBySeason = <Season, int>{};
    final topCategories = <String, int>{};
    
    int totalWearCount = 0;
    int unwornItems = 0;
    DateTime? lastActivity;

    for (final item in items) {
      // Count by type
      itemsByType[item.type] = (itemsByType[item.type] ?? 0) + 1;
      
      // Count by season
      for (final season in item.seasons) {
        itemsBySeason[season] = (itemsBySeason[season] ?? 0) + 1;
      }
      
      // Count categories
      for (final category in item.categories) {
        topCategories[category] = (topCategories[category] ?? 0) + 1;
      }
      
      // Track wear counts
      totalWearCount += item.wearCount;
      if (item.wearCount == 0) unwornItems++;
      
      // Track last activity
      if (item.lastWornDate != null && 
          (lastActivity == null || item.lastWornDate!.isAfter(lastActivity))) {
        lastActivity = item.lastWornDate;
      }
    }

    final averageWearCount = items.isNotEmpty ? totalWearCount / items.length : 0.0;

    return WardrobeStats(
      totalItems: items.length,
      totalOutfits: outfits.length,
      itemsByType: itemsByType,
      itemsBySeason: itemsBySeason,
      averageWearCount: averageWearCount,
      unwornItems: unwornItems,
      lastActivity: lastActivity,
      topCategories: Map.fromEntries(
        topCategories.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value))
          ..take(5),
      ),
    );
  }

  /// Analyze usage patterns for all items
  List<UsagePattern> _analyzeUsagePatterns(List<ClothingItem> items) {
    final patterns = <UsagePattern>[];
    final now = DateTime.now();

    for (final item in items) {
      final daysSinceCreation = now.difference(item.createdAt).inDays;
      final monthsSinceCreation = daysSinceCreation / 30.0;
      
      // Calculate wear frequency (times per month)
      final wearFrequency = monthsSinceCreation > 0 
          ? item.wearCount / monthsSinceCreation 
          : 0.0;

      // Determine usage category
      final category = _determineUsageCategory(item, wearFrequency, now);

      // Generate synthetic wear dates for analysis
      final wearDates = _generateWearDates(item, now);

      patterns.add(UsagePattern(
        itemId: item.id,
        itemName: _getItemDisplayName(item),
        type: item.type,
        wearCount: item.wearCount,
        lastWorn: item.lastWornDate,
        wearDates: wearDates,
        wearFrequency: wearFrequency,
        category: category,
        tags: item.tags,
      ));
    }

    // Sort by wear frequency (most used first)
    patterns.sort((a, b) => b.wearFrequency.compareTo(a.wearFrequency));
    return patterns;
  }

  /// Determine usage category for an item
  UsageCategory _determineUsageCategory(ClothingItem item, double wearFrequency, DateTime now) {
    if (item.wearCount == 0) return UsageCategory.unused;
    
    if (item.lastWornDate != null) {
      final daysSinceWorn = now.difference(item.lastWornDate!).inDays;
      if (daysSinceWorn > 180) return UsageCategory.unused;
    }

    if (wearFrequency >= 4) return UsageCategory.frequent;
    if (wearFrequency >= 2) return UsageCategory.regular;
    if (wearFrequency >= 0.5) return UsageCategory.occasional;

    // Check if it's seasonal
    if (item.seasons.isNotEmpty &&
        !item.seasons.contains(Season.allSeason) &&
        item.seasons.length <= 2) {
      return UsageCategory.seasonal;
    }
    
    return UsageCategory.unused;
  }

  /// Generate synthetic wear dates for analysis
  List<DateTime> _generateWearDates(ClothingItem item, DateTime now) {
    final dates = <DateTime>[];
    if (item.wearCount == 0) return dates;

    // Create plausible wear dates spread over the item's lifetime
    final daysSinceCreation = now.difference(item.createdAt).inDays;
    final random = Random(item.id.hashCode); // Consistent random for same item

    for (int i = 0; i < item.wearCount; i++) {
      final randomDays = random.nextInt(daysSinceCreation + 1);
      final wearDate = item.createdAt.add(Duration(days: randomDays));
      dates.add(wearDate);
    }

    dates.sort();
    return dates;
  }

  /// Analyze color usage across wardrobe
  List<ColorAnalysis> _analyzeColors(List<ClothingItem> items, List<Outfit> outfits) {
    final colorCounts = <String, int>{};
    final colorOutfitCounts = <String, int>{};
    final colorCompatibility = <String, Set<String>>{};

    // Count color usage in items
    for (final item in items) {
      for (final colorHex in item.colors) {
        colorCounts[colorHex] = (colorCounts[colorHex] ?? 0) + 1;
      }
    }

    // Count color usage in outfits
    for (final outfit in outfits) {
      final outfitColors = <String>{};
      for (final itemId in outfit.clothingItemIds) {
        ClothingItem? item;
        try {
          item = items.firstWhere((item) => item.id == itemId);
        } catch (e) {
          item = null;
        }
        if (item != null) {
          outfitColors.addAll(item.colors);
        }
      }
      
      for (final color in outfitColors) {
        colorOutfitCounts[color] = (colorOutfitCounts[color] ?? 0) + 1;
      }
    }

    // Analyze color compatibility
    for (final outfit in outfits) {
      final outfitColors = <String>[];
      for (final itemId in outfit.clothingItemIds) {
        ClothingItem? item;
        try {
          item = items.firstWhere((item) => item.id == itemId);
        } catch (e) {
          item = null;
        }
        if (item != null) {
          outfitColors.addAll(item.colors);
        }
      }
      for (int i = 0; i < outfitColors.length; i++) {
        for (int j = i + 1; j < outfitColors.length; j++) {
          final color1 = outfitColors[i];
          final color2 = outfitColors[j];
          colorCompatibility.putIfAbsent(color1, () => <String>{}).add(color2);
          colorCompatibility.putIfAbsent(color2, () => <String>{}).add(color1);
        }
      }
    }

    final totalItems = items.length;
    final analysis = <ColorAnalysis>[];

    for (final entry in colorCounts.entries) {
      final colorHex = entry.key;
      final count = entry.value;
      final percentage = totalItems > 0 ? (count / totalItems) * 100 : 0;
      final outfitAppearances = colorOutfitCounts[colorHex] ?? 0;
      final compatibleColors = colorCompatibility[colorHex]?.toList() ?? [];
      
      final category = _determineColorCategory(percentage.round().toDouble(), outfitAppearances, compatibleColors.length);

      analysis.add(ColorAnalysis(
        colorHex: colorHex,
        colorName: AppColors.getColorName(_hexToColor(colorHex)),
        itemCount: count,
        percentage: percentage.toDouble(),
        compatibleColors: compatibleColors,
        outfitAppearances: outfitAppearances,
        category: category,
      ));
    }

    // Sort by usage frequency
    analysis.sort((a, b) => b.itemCount.compareTo(a.itemCount));
    return analysis;
  }

  /// Determine color category based on usage
  ColorCategory _determineColorCategory(double percentage, int outfitAppearances, int compatibilityCount) {
    if (percentage >= 20) return ColorCategory.dominant;
    if (outfitAppearances >= 5) return ColorCategory.accent;
    if (compatibilityCount >= 3) return ColorCategory.seasonal;
    return ColorCategory.underused;
  }

  /// Analyze seasonal usage patterns
  List<SeasonalInsight> _analyzeSeasonalUsage(List<ClothingItem> items) {
    final insights = <SeasonalInsight>[];
    
    for (final season in Season.values) {
      if (season == Season.allSeason) continue;
      
      final seasonItems = items.where((item) =>
        item.seasons.contains(season) || item.seasons.contains(Season.allSeason)).toList();
      
      final wornItems = seasonItems.where((item) => item.wearCount > 0).length;
      final utilizationRate = seasonItems.isNotEmpty ? wornItems / seasonItems.length : 0.0;
      
      final availableTypes = seasonItems.map((item) => item.type).toSet();
      final missingTypes = _getExpectedTypesForSeason(season)
          .where((type) => !availableTypes.contains(type)).toList();
      
      final colorDistribution = <String, int>{};
      for (final item in seasonItems) {
        for (final color in item.colors) {
          final colorName = AppColors.getColorName(_hexToColor(color));
          colorDistribution[colorName] = (colorDistribution[colorName] ?? 0) + 1;
        }
      }
      
      final recommendations = _generateSeasonalRecommendations(season, seasonItems, missingTypes);
      
      insights.add(SeasonalInsight(
        season: season,
        availableItems: seasonItems.length,
        wornItems: wornItems,
        utilizationRate: utilizationRate,
        missingTypes: missingTypes,
        recommendations: recommendations,
        colorDistribution: colorDistribution,
      ));
    }
    
    return insights;
  }

  /// Get expected clothing types for a season
  List<ClothingType> _getExpectedTypesForSeason(Season season) {
    const basicsAllSeasons = [ClothingType.top, ClothingType.bottom, ClothingType.shoes];

    switch (season) {
      case Season.spring:
        return [...basicsAllSeasons, ClothingType.outerwear, ClothingType.dress];
      case Season.summer:
        return [...basicsAllSeasons, ClothingType.dress, ClothingType.swimwear, ClothingType.accessory];
      case Season.autumn:
        return [...basicsAllSeasons, ClothingType.outerwear, ClothingType.accessory];
      case Season.winter:
        return [...basicsAllSeasons, ClothingType.outerwear, ClothingType.accessory];
      case Season.allSeason:
        return basicsAllSeasons;
    }
  }

  /// Generate seasonal recommendations
  List<String> _generateSeasonalRecommendations(Season season, List<ClothingItem> items, List<ClothingType> missingTypes) {
    final recommendations = <String>[];
    
    for (final type in missingTypes) {
      recommendations.add('Consider adding ${_getTypeDisplayName(type)} for ${season.name}');
    }
    
    if (items.length < 5) {
      recommendations.add('Your ${season.name} wardrobe could use more variety');
    }
    
    final unwornItems = items.where((item) => item.wearCount == 0).length;
    if (unwornItems > items.length * 0.3) {
      recommendations.add('You have $unwornItems unworn ${season.name} items to explore');
    }
    
    return recommendations;
  }

  /// Calculate sustainability metrics
  SustainabilityMetrics _calculateSustainabilityMetrics(List<ClothingItem> items) {
    // Note: This assumes cost data would be added to ClothingItem model
    // For now, we'll use estimated costs based on type
    double totalInvestment = 0;
    double totalCostPerWear = 0;
    int itemsUnder10Wears = 0;
    int itemsOver50Wears = 0;
    final costEfficiency = <ClothingType, double>{};

    for (final item in items) {
      final estimatedCost = _estimateItemCost(item.type);
      totalInvestment += estimatedCost;
      
      final costPerWear = item.wearCount > 0 ? estimatedCost / item.wearCount : estimatedCost;
      totalCostPerWear += costPerWear;
      
      if (item.wearCount < 10) itemsUnder10Wears++;
      if (item.wearCount > 50) itemsOver50Wears++;
      
      costEfficiency[item.type] = (costEfficiency[item.type] ?? 0) + costPerWear;
    }

    final averageCostPerWear = items.isNotEmpty ? totalCostPerWear / items.length : 0.0;
    final sustainabilityScore = _calculateSustainabilityScore(items, averageCostPerWear.toDouble());
    
    // Normalize cost efficiency by count
    final typeCount = <ClothingType, int>{};
    for (final item in items) {
      typeCount[item.type] = (typeCount[item.type] ?? 0) + 1;
    }
    
    for (final type in costEfficiency.keys) {
      costEfficiency[type] = costEfficiency[type]! / typeCount[type]!;
    }

    final tips = _generateSustainabilityTips(items, sustainabilityScore, averageCostPerWear);

    return SustainabilityMetrics(
      averageCostPerWear: averageCostPerWear.toDouble(),
      totalInvestment: totalInvestment.round(),
      sustainabilityScore: sustainabilityScore.toDouble(),
      itemsUnder10Wears: itemsUnder10Wears,
      itemsOver50Wears: itemsOver50Wears,
      tips: tips,
      costEfficiency: costEfficiency,
    );
  }

  /// Estimate item cost based on type (placeholder)
  double _estimateItemCost(ClothingType type) {
    const baseCosts = {
      ClothingType.top: 30.0,
      ClothingType.bottom: 50.0,
      ClothingType.dress: 60.0,
      ClothingType.shoes: 80.0,
      ClothingType.outerwear: 120.0,
      ClothingType.accessory: 25.0,
      ClothingType.bag: 60.0,
      ClothingType.activewear: 40.0,
      ClothingType.swimwear: 35.0,
    };

    return baseCosts[type] ?? 40.0;
  }

  /// Calculate sustainability score (0-100)
  double _calculateSustainabilityScore(List<ClothingItem> items, double avgCostPerWear) {
    double score = 50; // Base score
    
    // Factor in cost per wear (lower is better)
    if (avgCostPerWear < 2) {
      score += 20;
    } else if (avgCostPerWear < 5) score += 10;
    else if (avgCostPerWear > 20) score -= 20;
    else if (avgCostPerWear > 10) score -= 10;
    
    // Factor in utilization rate
    final totalItems = items.length;
    final wornItems = items.where((item) => item.wearCount > 0).length;
    final utilizationRate = totalItems > 0 ? wornItems / totalItems : 0;
    
    score += utilizationRate * 30; // Up to 30 points for utilization
    
    // Factor in versatility (items with multiple categories)
    final versatileItems = items.where((item) => item.categories.length > 1).length;
    final versatilityRate = totalItems > 0 ? versatileItems / totalItems : 0;
    score += versatilityRate * 20; // Up to 20 points for versatility
    
    return score.clamp(0, 100);
  }

  /// Generate sustainability tips
  List<SustainabilityTip> _generateSustainabilityTips(List<ClothingItem> items, double score, double avgCostPerWear) {
    final tips = <SustainabilityTip>[];
    
    if (avgCostPerWear > 10) {
      tips.add(const SustainabilityTip(
        title: 'Reduce Cost Per Wear',
        description: 'Wear your items more frequently to improve cost efficiency',
        category: SustainabilityCategory.costEfficiency,
        impact: 4,
        actionItems: ['Create outfit combinations with underused items', 'Set reminders to wear forgotten pieces'],
      ));
    }
    
    final unwornItems = items.where((item) => item.wearCount == 0).length;
    if (unwornItems > items.length * 0.2) {
      tips.add(SustainabilityTip(
        title: 'Activate Unworn Items',
        description: 'You have $unwornItems items that have never been worn',
        category: SustainabilityCategory.itemUtilization,
        impact: 5,
        actionItems: const ['Try on unworn items this week', 'Create outfits featuring these pieces', 'Consider donating items that don\'t fit'],
      ));
    }
    
    if (score < 60) {
      tips.add(const SustainabilityTip(
        title: 'Focus on Versatile Pieces',
        description: 'Invest in items that work across multiple occasions and seasons',
        category: SustainabilityCategory.versatility,
        impact: 4,
        actionItems: ['Look for neutral colors', 'Choose classic cuts', 'Prioritize quality over quantity'],
      ));
    }
    
    return tips;
  }

  /// Generate wardrobe recommendations
  List<RecommendationInsight> _generateRecommendations(
    List<ClothingItem> items,
    WardrobeStats stats,
    List<ColorAnalysis> colorAnalysis,
  ) {
    final recommendations = <RecommendationInsight>[];
    
    // Check for missing basics
    final basicTypes = [ClothingType.top, ClothingType.bottom, ClothingType.shoes];
    for (final type in basicTypes) {
      if (!stats.itemsByType.containsKey(type) || stats.itemsByType[type]! < 3) {
        recommendations.add(RecommendationInsight(
          title: 'Add ${_getTypeDisplayName(type)} Basics',
          description: 'Your wardrobe could benefit from more ${_getTypeDisplayName(type)} options',
          type: RecommendationType.missingBasic,
          priority: 8,
          suggestedItems: _getSuggestedItemsForType(type),
          colors: const ['black', 'white', 'navy', 'gray'],
          reasoning: 'Having at least 3-5 ${_getTypeDisplayName(type)} items provides better outfit variety',
        ));
      }
    }
    
    // Color gap recommendations
    final dominantColors = colorAnalysis.where((c) => c.category == ColorCategory.dominant).length;
    if (dominantColors < 3) {
      recommendations.add(const RecommendationInsight(
        title: 'Expand Color Palette',
        description: 'Adding more color variety will increase your outfit options',
        type: RecommendationType.colorGap,
        priority: 6,
        suggestedItems: ['colorful tops', 'patterned accessories'],
        colors: ['burgundy', 'forest green', 'navy blue'],
        reasoning: 'A diverse color palette allows for more creative outfit combinations',
      ));
    }
    
    // Seasonal recommendations
    final currentSeason = _getCurrentSeason();
    final seasonalItems = items.where((item) =>
      item.seasons.contains(currentSeason) || item.seasons.contains(Season.allSeason)).length;
    
    if (seasonalItems < 10) {
      recommendations.add(RecommendationInsight(
        title: 'Build ${currentSeason.name.toUpperCase()} Wardrobe',
        description: 'You only have $seasonalItems items for the current season',
        type: RecommendationType.seasonalNeed,
        priority: 7,
        suggestedItems: _getSeasonalSuggestions(currentSeason),
        colors: AppColors.getSeasonalColors(currentSeason).map((c) => AppColors.getColorName(c)).toList(),
        reasoning: 'Having adequate seasonal clothing ensures comfort and style year-round',
      ));
    }
    
    // Sort by priority
    recommendations.sort((a, b) => b.priority.compareTo(a.priority));
    return recommendations;
  }

  /// Analyze costs and efficiency
  CostAnalysis _analyzeCosts(List<ClothingItem> items) {
    double totalSpent = 0;
    final costByType = <ClothingType, double>{};
    final efficiencyItems = <CostEfficiencyItem>[];
    
    for (final item in items) {
      final estimatedCost = _estimateItemCost(item.type);
      totalSpent += estimatedCost;
      costByType[item.type] = (costByType[item.type] ?? 0) + estimatedCost;
      
      final costPerWear = item.wearCount > 0 ? estimatedCost / item.wearCount : estimatedCost;
      final rating = _getEfficiencyRating(costPerWear);
      
      efficiencyItems.add(CostEfficiencyItem(
        itemId: item.id,
        itemName: _getItemDisplayName(item),
        cost: estimatedCost,
        wearCount: item.wearCount,
        costPerWear: costPerWear.toDouble(),
        rating: rating,
      ));
    }
    
    final averageItemCost = items.isNotEmpty ? totalSpent / items.length : 0;
    
    // Sort efficiency items
    efficiencyItems.sort((a, b) => a.costPerWear.compareTo(b.costPerWear));
    
    final mostEfficient = efficiencyItems.take(5).toList();
    final leastEfficient = efficiencyItems.reversed.take(5).toList();
    
    final monthlyROI = _calculateWardrobeROI(items, totalSpent);
    final budgetRecommendation = _generateBudgetRecommendation(items, totalSpent);
    
    return CostAnalysis(
      totalSpent: totalSpent,
      averageItemCost: averageItemCost.toDouble(),
      costByType: costByType,
      mostEfficient: mostEfficient,
      leastEfficient: leastEfficient,
      monthlyWardrobeROI: monthlyROI,
      budgetRecommendation: budgetRecommendation,
    );
  }

  /// Helper methods
  String _getItemDisplayName(ClothingItem item) {
    final typeName = _getTypeDisplayName(item.type);
    final mainColor = item.colors.isNotEmpty 
        ? AppColors.getColorName(_hexToColor(item.colors.first))
        : '';
    return mainColor.isNotEmpty ? '$mainColor $typeName' : typeName;
  }

  String _getTypeDisplayName(ClothingType type) {
    return type.name.replaceAll('_', ' ').split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }

  Season _getCurrentSeason() {
    final month = DateTime.now().month;
    if (month >= 3 && month <= 5) return Season.spring;
    if (month >= 6 && month <= 8) return Season.summer;
    if (month >= 9 && month <= 11) return Season.autumn;
    return Season.winter;
  }

  List<String> _getSuggestedItemsForType(ClothingType type) {
    const suggestions = {
      ClothingType.top: ['basic t-shirt', 'button-down shirt', 'sweater'],
      ClothingType.bottom: ['jeans', 'dress pants', 'shorts'],
      ClothingType.shoes: ['sneakers', 'dress shoes', 'boots'],
      ClothingType.outerwear: ['jacket', 'coat', 'blazer'],
    };
    return suggestions[type] ?? ['basic ${type.name}'];
  }

  List<String> _getSeasonalSuggestions(Season season) {
    const suggestions = {
      Season.spring: ['light jacket', 'cardigan', 'ankle boots'],
      Season.summer: ['sundress', 'shorts', 'sandals'],
      Season.autumn: ['sweater', 'boots', 'accessories'],
      Season.winter: ['warm coat', 'accessories', 'winter boots'],
    };
    return suggestions[season] ?? [];
  }

  EfficiencyRating _getEfficiencyRating(double costPerWear) {
    if (costPerWear < 2) return EfficiencyRating.excellent;
    if (costPerWear < 5) return EfficiencyRating.good;
    if (costPerWear < 10) return EfficiencyRating.fair;
    if (costPerWear < 20) return EfficiencyRating.poor;
    return EfficiencyRating.terrible;
  }

  double _calculateWardrobeROI(List<ClothingItem> items, double totalSpent) {
    final totalWears = items.fold<int>(0, (sum, item) => sum + item.wearCount);
    return totalSpent > 0 ? (totalWears / totalSpent) * 100 : 0;
  }

  BudgetRecommendation _generateBudgetRecommendation(List<ClothingItem> items, double totalSpent) {
    final monthlyBudget = totalSpent / 12; // Amortize over a year
    final priorities = <PriorityPurchase>[];
    
    // Add priority purchases based on analysis
    priorities.add(const PriorityPurchase(
      item: 'Quality basic top',
      suggestedPrice: 40,
      reasoning: 'High-wear items should be quality investments',
      priority: 1,
    ));
    
    return BudgetRecommendation(
      suggestedMonthlyBudget: monthlyBudget,
      priorities: priorities,
      potentialSavings: totalSpent * 0.2, // Estimate 20% potential savings
      budgetTips: const [
        'Focus on cost-per-wear rather than initial price',
        'Invest in versatile pieces that work across seasons',
        'Set a monthly wardrobe budget and stick to it',
      ],
    );
  }
}