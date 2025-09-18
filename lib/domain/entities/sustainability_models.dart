import 'package:isar/isar.dart';

part 'sustainability_models.g.dart';

// Carbon footprint analysis result
class CarbonFootprintAnalysis {
  final String itemId;
  final double productionCO2;
  final double transportationCO2;
  final double totalCO2;
  final String calculationMethod;
  final DateTime analyzedAt;
  final Map<String, dynamic> factors;

  const CarbonFootprintAnalysis({
    required this.itemId,
    required this.productionCO2,
    required this.transportationCO2,
    required this.totalCO2,
    required this.calculationMethod,
    required this.analyzedAt,
    this.factors = const {},
  });

  static CarbonFootprintAnalysis fromMap(Map<String, dynamic> map) {
    return CarbonFootprintAnalysis(
      itemId: map['itemId'] ?? '',
      productionCO2: (map['productionCO2'] ?? 0.0).toDouble(),
      transportationCO2: (map['transportationCO2'] ?? 0.0).toDouble(),
      totalCO2: (map['totalCO2'] ?? 0.0).toDouble(),
      calculationMethod: map['calculationMethod'] ?? '',
      analyzedAt: map['analyzedAt'] != null 
          ? DateTime.parse(map['analyzedAt'])
          : DateTime.now(),
      factors: Map<String, dynamic>.from(map['factors'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'productionCO2': productionCO2,
      'transportationCO2': transportationCO2,
      'totalCO2': totalCO2,
      'calculationMethod': calculationMethod,
      'analyzedAt': analyzedAt.toIso8601String(),
      'factors': factors,
    };
  }
}

// Ethical brand analysis result
class EthicalBrandAnalysis {
  final String brandName;
  final double overallScore;
  final double laborScore;
  final double environmentalScore;
  final double animalWelfareScore;
  final List<String> certifications;
  final List<String> concerns;
  final DateTime lastUpdated;

  const EthicalBrandAnalysis({
    required this.brandName,
    required this.overallScore,
    required this.laborScore,
    required this.environmentalScore,
    required this.animalWelfareScore,
    this.certifications = const [],
    this.concerns = const [],
    required this.lastUpdated,
  });

  static EthicalBrandAnalysis fromMap(Map<String, dynamic> map) {
    return EthicalBrandAnalysis(
      brandName: map['brandName'] ?? '',
      overallScore: (map['overallScore'] ?? 0.0).toDouble(),
      laborScore: (map['laborScore'] ?? 0.0).toDouble(),
      environmentalScore: (map['environmentalScore'] ?? 0.0).toDouble(),
      animalWelfareScore: (map['animalWelfareScore'] ?? 0.0).toDouble(),
      certifications: List<String>.from(map['certifications'] ?? []),
      concerns: List<String>.from(map['concerns'] ?? []),
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.parse(map['lastUpdated'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brandName': brandName,
      'overallScore': overallScore,
      'laborScore': laborScore,
      'environmentalScore': environmentalScore,
      'animalWelfareScore': animalWelfareScore,
      'certifications': certifications,
      'concerns': concerns,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}

// Brand ethics score
class BrandEthicsScore {
  final String brandName;
  final double score;
  final String category;
  final List<String> strengths;
  final List<String> weaknesses;

  const BrandEthicsScore({
    required this.brandName,
    required this.score,
    required this.category,
    this.strengths = const [],
    this.weaknesses = const [],
  });

  static BrandEthicsScore fromMap(Map<String, dynamic> map) {
    return BrandEthicsScore(
      brandName: map['brandName'] ?? '',
      score: (map['score'] ?? 0.0).toDouble(),
      category: map['category'] ?? '',
      strengths: List<String>.from(map['strengths'] ?? []),
      weaknesses: List<String>.from(map['weaknesses'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brandName': brandName,
      'score': score,
      'category': category,
      'strengths': strengths,
      'weaknesses': weaknesses,
    };
  }
}

// Sustainability metrics for wardrobe items
@collection
class SustainabilityMetrics {
  Id id = Isar.autoIncrement;

  @Index()
  late String itemId;

  late double carbonFootprint;
  late double waterUsage;
  late double energyConsumption;

  late String materialSustainabilityScore;
  late String brandEthicsScore;
  
  List<String> certifications = [];
  List<String> sustainablePractices = [];

  late DateTime calculatedAt;
  late DateTime lastUpdated;

  SustainabilityMetrics();
}

// Wardrobe sustainability summary
@collection
class WardrobeSustainabilityReport {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late DateTime reportDate;

  // Overall metrics
  late double totalCarbonFootprint;
  late double averageItemFootprint;
  late int sustainableItemsCount;
  late int totalItemsAnalyzed;

  // Brand analysis
  @ignore
  Map<String, double> brandScores = {};
  List<String> topSustainableBrands = [];
  List<String> concerningBrands = [];

  // Usage efficiency
  late double wearEfficiencyScore;
  late int underutilizedItemsCount;
  late double costPerWearAverage;

  // Recommendations
  List<String> sustainabilityRecommendations = [];
  List<String> itemsToConsider = [];

  late DateTime generatedAt;

  WardrobeSustainabilityReport();
}