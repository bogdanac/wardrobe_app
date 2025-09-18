import 'package:equatable/equatable.dart';
import 'clothing_item.dart';

/// Comprehensive wardrobe analytics data
class WardrobeAnalytics extends Equatable {
  final WardrobeStats stats;
  final List<UsagePattern> usagePatterns;
  final List<ColorAnalysis> colorAnalysis;
  final List<SeasonalInsight> seasonalInsights;
  final SustainabilityMetrics sustainability;
  final List<RecommendationInsight> recommendations;
  final CostAnalysis costAnalysis;

  const WardrobeAnalytics({
    required this.stats,
    required this.usagePatterns,
    required this.colorAnalysis,
    required this.seasonalInsights,
    required this.sustainability,
    required this.recommendations,
    required this.costAnalysis,
  });

  @override
  List<Object> get props => [
        stats,
        usagePatterns,
        colorAnalysis,
        seasonalInsights,
        sustainability,
        recommendations,
        costAnalysis,
      ];
}

/// Basic wardrobe statistics
class WardrobeStats extends Equatable {
  final int totalItems;
  final int totalOutfits;
  final Map<ClothingType, int> itemsByType;
  final Map<Season, int> itemsBySeason;
  final double averageWearCount;
  final int unwornItems;
  final DateTime? lastActivity;
  final Map<String, int> topCategories;

  const WardrobeStats({
    required this.totalItems,
    required this.totalOutfits,
    required this.itemsByType,
    required this.itemsBySeason,
    required this.averageWearCount,
    required this.unwornItems,
    this.lastActivity,
    required this.topCategories,
  });

  @override
  List<Object?> get props => [
        totalItems,
        totalOutfits,
        itemsByType,
        itemsBySeason,
        averageWearCount,
        unwornItems,
        lastActivity,
        topCategories,
      ];
}

/// Usage pattern analysis
class UsagePattern extends Equatable {
  final String itemId;
  final String itemName;
  final ClothingType type;
  final int wearCount;
  final DateTime? lastWorn;
  final List<DateTime> wearDates;
  final double wearFrequency; // times per month
  final UsageCategory category;
  final List<String> tags;

  const UsagePattern({
    required this.itemId,
    required this.itemName,
    required this.type,
    required this.wearCount,
    this.lastWorn,
    required this.wearDates,
    required this.wearFrequency,
    required this.category,
    required this.tags,
  });

  @override
  List<Object?> get props => [
        itemId,
        itemName,
        type,
        wearCount,
        lastWorn,
        wearDates,
        wearFrequency,
        category,
        tags,
      ];
}

/// Usage categories for items
enum UsageCategory {
  frequent, // Worn more than 4 times/month
  regular,  // Worn 2-4 times/month
  occasional, // Worn less than 2 times/month
  unused,   // Never worn or not worn in 6+ months
  seasonal, // Only worn in specific seasons
}

/// Color analysis data
class ColorAnalysis extends Equatable {
  final String colorHex;
  final String colorName;
  final int itemCount;
  final double percentage;
  final List<String> compatibleColors;
  final int outfitAppearances;
  final ColorCategory category;

  const ColorAnalysis({
    required this.colorHex,
    required this.colorName,
    required this.itemCount,
    required this.percentage,
    required this.compatibleColors,
    required this.outfitAppearances,
    required this.category,
  });

  @override
  List<Object> get props => [
        colorHex,
        colorName,
        itemCount,
        percentage,
        compatibleColors,
        outfitAppearances,
        category,
      ];
}

/// Color categories for analysis
enum ColorCategory {
  dominant,    // Most used colors
  accent,      // Colors used for accents
  seasonal,    // Season-specific colors
  underused,   // Colors that could be used more
  missing,     // Recommended colors not in wardrobe
}

/// Seasonal insights
class SeasonalInsight extends Equatable {
  final Season season;
  final int availableItems;
  final int wornItems;
  final double utilizationRate;
  final List<ClothingType> missingTypes;
  final List<String> recommendations;
  final Map<String, int> colorDistribution;

  const SeasonalInsight({
    required this.season,
    required this.availableItems,
    required this.wornItems,
    required this.utilizationRate,
    required this.missingTypes,
    required this.recommendations,
    required this.colorDistribution,
  });

  @override
  List<Object> get props => [
        season,
        availableItems,
        wornItems,
        utilizationRate,
        missingTypes,
        recommendations,
        colorDistribution,
      ];
}

/// Sustainability metrics
class SustainabilityMetrics extends Equatable {
  final double averageCostPerWear;
  final int totalInvestment;
  final double sustainabilityScore; // 0-100
  final int itemsUnder10Wears;
  final int itemsOver50Wears;
  final List<SustainabilityTip> tips;
  final Map<ClothingType, double> costEfficiency;

  const SustainabilityMetrics({
    required this.averageCostPerWear,
    required this.totalInvestment,
    required this.sustainabilityScore,
    required this.itemsUnder10Wears,
    required this.itemsOver50Wears,
    required this.tips,
    required this.costEfficiency,
  });

  @override
  List<Object> get props => [
        averageCostPerWear,
        totalInvestment,
        sustainabilityScore,
        itemsUnder10Wears,
        itemsOver50Wears,
        tips,
        costEfficiency,
      ];
}

/// Sustainability tips
class SustainabilityTip extends Equatable {
  final String title;
  final String description;
  final SustainabilityCategory category;
  final int impact; // 1-5 stars
  final List<String> actionItems;

  const SustainabilityTip({
    required this.title,
    required this.description,
    required this.category,
    required this.impact,
    required this.actionItems,
  });

  @override
  List<Object> get props => [title, description, category, impact, actionItems];
}

enum SustainabilityCategory {
  costEfficiency,
  itemUtilization,
  qualityInvestment,
  versatility,
  longevity,
}

/// Recommendation insights
class RecommendationInsight extends Equatable {
  final String title;
  final String description;
  final RecommendationType type;
  final int priority; // 1-10
  final List<String> suggestedItems;
  final List<String> colors;
  final String? reasoning;

  const RecommendationInsight({
    required this.title,
    required this.description,
    required this.type,
    required this.priority,
    required this.suggestedItems,
    required this.colors,
    this.reasoning,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        priority,
        suggestedItems,
        colors,
        reasoning,
      ];
}

enum RecommendationType {
  missingBasic,
  colorGap,
  seasonalNeed,
  versatilePiece,
  qualityUpgrade,
  occasionSpecific,
}

/// Cost analysis data
class CostAnalysis extends Equatable {
  final double totalSpent;
  final double averageItemCost;
  final Map<ClothingType, double> costByType;
  final List<CostEfficiencyItem> mostEfficient;
  final List<CostEfficiencyItem> leastEfficient;
  final double monthlyWardrobeROI;
  final BudgetRecommendation budgetRecommendation;

  const CostAnalysis({
    required this.totalSpent,
    required this.averageItemCost,
    required this.costByType,
    required this.mostEfficient,
    required this.leastEfficient,
    required this.monthlyWardrobeROI,
    required this.budgetRecommendation,
  });

  @override
  List<Object> get props => [
        totalSpent,
        averageItemCost,
        costByType,
        mostEfficient,
        leastEfficient,
        monthlyWardrobeROI,
        budgetRecommendation,
      ];
}

/// Cost efficiency for individual items
class CostEfficiencyItem extends Equatable {
  final String itemId;
  final String itemName;
  final double cost;
  final int wearCount;
  final double costPerWear;
  final EfficiencyRating rating;

  const CostEfficiencyItem({
    required this.itemId,
    required this.itemName,
    required this.cost,
    required this.wearCount,
    required this.costPerWear,
    required this.rating,
  });

  @override
  List<Object> get props => [itemId, itemName, cost, wearCount, costPerWear, rating];
}

enum EfficiencyRating {
  excellent, // < $2 per wear
  good,      // $2-5 per wear
  fair,      // $5-10 per wear
  poor,      // $10-20 per wear
  terrible,  // > $20 per wear
}

/// Budget recommendations
class BudgetRecommendation extends Equatable {
  final double suggestedMonthlyBudget;
  final List<PriorityPurchase> priorities;
  final double potentialSavings;
  final List<String> budgetTips;

  const BudgetRecommendation({
    required this.suggestedMonthlyBudget,
    required this.priorities,
    required this.potentialSavings,
    required this.budgetTips,
  });

  @override
  List<Object> get props => [
        suggestedMonthlyBudget,
        priorities,
        potentialSavings,
        budgetTips,
      ];
}

/// Priority purchases for budget planning
class PriorityPurchase extends Equatable {
  final String item;
  final double suggestedPrice;
  final String reasoning;
  final int priority;
  final Season? targetSeason;

  const PriorityPurchase({
    required this.item,
    required this.suggestedPrice,
    required this.reasoning,
    required this.priority,
    this.targetSeason,
  });

  @override
  List<Object?> get props => [item, suggestedPrice, reasoning, priority, targetSeason];
}