import 'package:isar/isar.dart';
import 'clothing_item.dart';

part 'shopping_models.g.dart';

@collection
class ShoppingSuggestion {
  Id id = Isar.autoIncrement;
  
  late String itemName;
  late String category;
  late String reason;
  
  // Priority (1-5, where 5 is highest priority)
  late int priority;
  
  // Estimated price
  late double estimatedPrice;
  
  // Optional clothing type for more specific suggestions
  @Enumerated(EnumType.name)
  ClothingType? clothingType;
  
  // Season relevance
  @Enumerated(EnumType.name)
  Season? season;
  
  // Style preference
  String? style;
  
  // Colors that would work well
  List<String> suggestedColors = [];
  
  // Tags for categorization
  List<String> tags = [];
  
  // Reason details
  String? detailedReason;
  
  // Related outfit IDs that would be completed with this item
  List<String> relatedOutfitIds = [];
  
  late DateTime createdAt;
  
  // User interaction
  bool isDismissed = false;
  bool isBookmarked = false;
  DateTime? dismissedAt;
  
  ShoppingSuggestion();
}

@collection
class ShoppingList {
  Id id = Isar.autoIncrement;
  
  late String name;
  String? description;
  
  List<ShoppingListItem> items = [];
  
  late DateTime createdAt;
  DateTime? updatedAt;
  
  // Budget tracking
  double budget = 0.0;
  double totalEstimatedCost = 0.0;
  double totalActualCost = 0.0;
  
  // Status
  bool isCompleted = false;
  DateTime? completedAt;
  
  // Categories
  List<String> categories = [];
  
  // Shopping trip details
  String? plannedStore;
  DateTime? plannedShoppingDate;
  
  ShoppingList();
}

@embedded
class ShoppingListItem {
  String? suggestionId;
  late String itemName;
  late String category;
  String? description;
  
  late double estimatedPrice;
  double? actualPrice;
  
  late int priority;
  
  // Purchase tracking
  bool isPurchased = false;
  DateTime? purchasedAt;
  String? purchasedStore;
  
  // Alternative options found
  List<String> alternativeUrls = [];
  List<double> alternativePrices = [];
  
  // Notes
  String? notes;
  
  late DateTime createdAt;
  
  ShoppingListItem();
}

@collection
class PriceAlert {
  Id id = Isar.autoIncrement;
  
  late String itemName;
  late String storeName;
  late String productUrl;
  
  late double targetPrice;
  late double currentPrice;
  double? originalPrice;
  
  late DateTime createdAt;
  DateTime? lastChecked;
  DateTime? alertTriggered;
  
  bool isActive = true;
  bool wasTriggered = false;
  
  // Check frequency (in hours)
  int checkFrequency = 24;
  
  // Notification preferences
  bool notifyOnPriceDrop = true;
  bool notifyOnBackInStock = true;
  
  PriceAlert();
}

@collection
class PurchaseRecord {
  Id id = Isar.autoIncrement;
  
  late String itemName;
  late String category;
  late String store;
  
  late double actualPrice;
  double? estimatedPrice;
  
  late DateTime purchaseDate;
  
  // Purchase method
  String? paymentMethod;
  String? orderNumber;
  
  // Item details
  String? brand;
  String? size;
  String? color;
  
  // Satisfaction tracking
  int? satisfactionRating; // 1-5
  String? feedback;
  
  // Return/exchange info
  bool isReturned = false;
  DateTime? returnDate;
  String? returnReason;
  
  // Associated wardrobe item (if added to wardrobe)
  String? wardrobeItemId;
  
  String? notes;
  
  PurchaseRecord();
}

@collection
class WishlistItem {
  Id id = Isar.autoIncrement;
  
  late String itemName;
  String? brand;
  String? description;
  
  late String category;
  
  // Pricing
  double? targetPrice;
  double? currentPrice;
  String? priceRange; // e.g., "$50-$100"
  
  // Product details
  String? imageUrl;
  String? productUrl;
  String? storeName;
  
  // Preferences
  List<String> preferredColors = [];
  List<String> preferredSizes = [];
  
  // Priority and status
  late int priority; // 1-5
  bool isAvailable = true;
  bool isPriceAlertSet = false;
  
  // Occasions this item would be used for
  List<String> occasions = [];
  
  // Related outfit possibilities
  List<String> relatedOutfitIds = [];
  
  late DateTime createdAt;
  DateTime? updatedAt;
  
  // User notes
  String? notes;
  List<String> tags = [];
  
  WishlistItem();
}

@collection
class ShoppableOutfitInspiration {
  Id id = Isar.autoIncrement;
  
  late String title;
  late String description;
  String? imageUrl;
  
  late double totalPrice;
  List<ShoppableItem> items = [];
  
  List<String> tags = [];
  String? occasion;
  
  @Enumerated(EnumType.name)
  Season? season;
  
  String? style;
  
  // Source information
  String? sourceUrl;
  String? sourceName;
  String? influencer;
  
  // Engagement
  int likes = 0;
  int saves = 0;
  bool isBookmarked = false;
  
  late DateTime createdAt;
  
  ShoppableOutfitInspiration({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.totalPrice,
    required this.items,
    this.tags = const [],
    this.occasion,
    this.season,
    this.style,
    this.sourceUrl,
    this.sourceName,
    this.influencer,
  });
}

@embedded
class ShoppableItem {
  late String name;
  late double price;
  late String url;
  late String category;
  
  String? brand;
  String? imageUrl;
  String? description;
  
  // Alternative options
  List<String> alternativeUrls = [];
  List<double> alternativePrices = [];
  List<String> alternativeStores = [];
  
  ShoppableItem({
    this.name = '',
    this.price = 0.0,
    this.url = '',
    this.category = '',
    this.brand,
    this.imageUrl,
    this.description,
  });
}

class ShoppingResult {
  final String title;
  final double price;
  final double? originalPrice;
  final String storeName;
  final String url;
  final String? imageUrl;
  final double? rating;
  final int? reviewCount;
  final bool isSponsored;
  final bool isInStock;
  final String? brand;
  final List<String> availableSizes;
  final List<String> availableColors;
  final String? description;
  final Map<String, dynamic> metadata;

  const ShoppingResult({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.storeName,
    required this.url,
    this.imageUrl,
    this.rating,
    this.reviewCount,
    this.isSponsored = false,
    this.isInStock = true,
    this.brand,
    this.availableSizes = const [],
    this.availableColors = const [],
    this.description,
    this.metadata = const {},
  });

  double? get discountPercentage {
    if (originalPrice == null) return null;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  String? get formattedOriginalPrice => 
      originalPrice != null ? '\$${originalPrice!.toStringAsFixed(2)}' : null;
}

@collection
class ShoppingPreferences {
  Id id = Isar.autoIncrement;
  
  // Budget preferences
  double monthlyBudget = 200.0;
  double maxItemPrice = 100.0;
  
  // Store preferences
  List<String> preferredStores = [];
  List<String> blacklistedStores = [];
  
  // Brand preferences
  List<String> preferredBrands = [];
  List<String> avoidedBrands = [];
  
  // Shopping behavior
  bool enablePriceAlerts = true;
  bool enableWishlistNotifications = true;
  bool preferSustainableBrands = false;
  bool onlyShopSales = false;
  
  // Size preferences
  @ignore
  Map<String, String> sizePreferences = {}; // category -> size
  
  // Style preferences
  List<String> preferredStyles = [];
  List<String> preferredColors = [];
  List<String> avoidedColors = [];
  
  // Shopping frequency
  String shoppingFrequency = 'monthly'; // weekly, monthly, seasonal, as_needed
  
  // Notification settings
  bool notifyOnPriceDrops = true;
  bool notifyOnNewArrivals = false;
  bool notifyOnSales = true;
  
  late DateTime lastUpdated;
  
  ShoppingPreferences();
}

// Enums for shopping integration
enum ShoppingSuggestionType {
  wardrobeGap,
  seasonalNeed,
  replacement,
  trendingItem,
  occasionSpecific,
  colorGap,
  styleExpansion,
}

enum PurchaseStatus {
  planned,
  inCart,
  purchased,
  delivered,
  returned,
  exchanged,
}

enum ShoppingListStatus {
  active,
  completed,
  paused,
  cancelled,
}

// Shopping analytics
class ShoppingAnalytics {
  final double totalSpent;
  final double averageItemPrice;
  final int totalPurchases;
  final Map<String, double> spendingByCategory;
  final Map<String, int> purchasesByStore;
  final double budgetUtilization;
  final List<String> topCategories;
  final double savingsFromAlerts;

  const ShoppingAnalytics({
    required this.totalSpent,
    required this.averageItemPrice,
    required this.totalPurchases,
    required this.spendingByCategory,
    required this.purchasesByStore,
    required this.budgetUtilization,
    required this.topCategories,
    required this.savingsFromAlerts,
  });
}