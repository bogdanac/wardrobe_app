import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../data/repositories/firebase_clothing_repository.dart';
import '../../core/services/firebase_image_service.dart';
import 'auth_provider.dart';
import 'settings_provider.dart';

final clothingRepositoryProvider = Provider<ClothingRepository>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  // All platforms now use Firebase (cloud storage with sync)
  return FirebaseClothingRepository(userId: userId);
});

final firebaseImageServiceProvider = Provider<FirebaseImageService>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  return FirebaseImageService(userId: userId);
});

final allClothingItemsProvider = FutureProvider<List<ClothingItem>>((ref) async {
  final repository = ref.watch(clothingRepositoryProvider);
  return repository.getAllClothingItems();
});

final clothingItemByIdProvider = FutureProvider.family<ClothingItem?, String>((ref, id) async {
  final repository = ref.watch(clothingRepositoryProvider);
  return repository.getClothingItemById(id);
});

final clothingItemsByTypeProvider = FutureProvider.family<List<ClothingItem>, ClothingType>((ref, type) async {
  final repository = ref.watch(clothingRepositoryProvider);
  return repository.getClothingItemsByType(type);
});

class ClothingFilterState {
  final List<ClothingType> types;
  final List<String> categories;
  final Season? season;
  final List<WeatherRange> weatherRanges;
  final List<String> colors;
  final String searchQuery;
  final List<SizeFit> sizeFits;
  final bool showArchived;

  const ClothingFilterState({
    this.types = const [],
    this.categories = const [],
    this.season,
    this.weatherRanges = const [],
    this.colors = const [],
    this.searchQuery = '',
    this.sizeFits = const [],
    this.showArchived = false,
  });

  ClothingFilterState copyWith({
    List<ClothingType>? types,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? colors,
    String? searchQuery,
    List<SizeFit>? sizeFits,
    bool? showArchived,
  }) {
    return ClothingFilterState(
      types: types ?? this.types,
      categories: categories ?? this.categories,
      season: season ?? this.season,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      colors: colors ?? this.colors,
      searchQuery: searchQuery ?? this.searchQuery,
      sizeFits: sizeFits ?? this.sizeFits,
      showArchived: showArchived ?? this.showArchived,
    );
  }
}

class ClothingFilterNotifier extends StateNotifier<ClothingFilterState> {
  ClothingFilterNotifier() : super(const ClothingFilterState());

  void updateTypes(List<ClothingType> types) {
    state = state.copyWith(types: types);
  }

  void updateCategories(List<String> categories) {
    state = state.copyWith(categories: categories);
  }

  void updateSeason(Season? season) {
    state = state.copyWith(season: season);
  }

  void updateWeatherRanges(List<WeatherRange> weatherRanges) {
    state = state.copyWith(weatherRanges: weatherRanges);
  }

  void updateColors(List<String> colors) {
    state = state.copyWith(colors: colors);
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updateSizeFits(List<SizeFit> sizeFits) {
    state = state.copyWith(sizeFits: sizeFits);
  }

  void updateShowArchived(bool showArchived) {
    state = state.copyWith(showArchived: showArchived);
  }

  void clearFilters() {
    state = const ClothingFilterState();
  }
}

final clothingFilterProvider = StateNotifierProvider<ClothingFilterNotifier, ClothingFilterState>((ref) {
  return ClothingFilterNotifier();
});

final filteredClothingItemsProvider = FutureProvider<List<ClothingItem>>((ref) async {
  final repository = ref.watch(clothingRepositoryProvider);
  final filter = ref.watch(clothingFilterProvider);
  final settings = ref.watch(settingsProvider);

  // Apply global season filter from settings if no local filter is set
  final effectiveSeason = filter.season ?? settings.currentSeason;

  List<ClothingItem> items;

  if (filter.searchQuery.isNotEmpty) {
    items = await repository.searchClothingItems(filter.searchQuery);

    // Apply season filter to search results
    // If "All Season" is selected, show all items regardless of their season tags
    if (effectiveSeason != null && effectiveSeason != Season.allSeason) {
      items = items.where((item) =>
        item.seasons.contains(effectiveSeason) || item.seasons.contains(Season.allSeason)
      ).toList();
    }
  } else {
    items = await repository.filterClothingItems(
      types: filter.types.isEmpty ? null : filter.types,
      categories: filter.categories.isEmpty ? null : filter.categories,
      season: effectiveSeason,
      weatherRanges: filter.weatherRanges.isEmpty ? null : filter.weatherRanges,
      colors: filter.colors.isEmpty ? null : filter.colors,
    );
  }

  // Filter out archived items unless specifically requested
  if (!filter.showArchived) {
    items = items.where((item) => !item.isArchived).toList();
  }

  // Apply size fit filters if any
  if (filter.sizeFits.isNotEmpty) {
    items = items.where((item) => filter.sizeFits.contains(item.sizeFit)).toList();
  }

  // Sort by less worn items first (lower wearCount first)
  // For items with same wear count, prioritize items not worn recently
  items.sort((a, b) {
    // First, compare by wear count (less worn items first)
    int wearCountComparison = a.wearCount.compareTo(b.wearCount);
    if (wearCountComparison != 0) {
      return wearCountComparison;
    }

    // If wear counts are equal, prioritize items worn less recently
    // Items never worn (lastWornDate == null) come first
    if (a.lastWornDate == null && b.lastWornDate == null) {
      return 0; // Both never worn, maintain current order
    }
    if (a.lastWornDate == null) {
      return -1; // a never worn, comes first
    }
    if (b.lastWornDate == null) {
      return 1; // b never worn, comes first
    }

    // Both have been worn, prioritize the one worn less recently (older date first)
    return a.lastWornDate!.compareTo(b.lastWornDate!);
  });

  return items;
});