import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../data/repositories/clothing_repository_impl.dart';

final clothingRepositoryProvider = Provider<ClothingRepository>((ref) {
  return ClothingRepositoryImpl();
});

final allClothingItemsProvider = FutureProvider<List<ClothingItem>>((ref) async {
  final repository = ref.read(clothingRepositoryProvider);
  return repository.getAllClothingItems();
});

final clothingItemByIdProvider = FutureProvider.family<ClothingItem?, String>((ref, id) async {
  final repository = ref.read(clothingRepositoryProvider);
  return repository.getClothingItemById(id);
});

final clothingItemsByTypeProvider = FutureProvider.family<List<ClothingItem>, ClothingType>((ref, type) async {
  final repository = ref.read(clothingRepositoryProvider);
  return repository.getClothingItemsByType(type);
});

class ClothingFilterState {
  final List<ClothingType> types;
  final List<String> categories;
  final Season? season;
  final List<WeatherRange> weatherRanges;
  final List<String> colors;
  final String searchQuery;

  const ClothingFilterState({
    this.types = const [],
    this.categories = const [],
    this.season,
    this.weatherRanges = const [],
    this.colors = const [],
    this.searchQuery = '',
  });

  ClothingFilterState copyWith({
    List<ClothingType>? types,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? colors,
    String? searchQuery,
  }) {
    return ClothingFilterState(
      types: types ?? this.types,
      categories: categories ?? this.categories,
      season: season ?? this.season,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      colors: colors ?? this.colors,
      searchQuery: searchQuery ?? this.searchQuery,
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

  void clearFilters() {
    state = const ClothingFilterState();
  }
}

final clothingFilterProvider = StateNotifierProvider<ClothingFilterNotifier, ClothingFilterState>((ref) {
  return ClothingFilterNotifier();
});

final filteredClothingItemsProvider = FutureProvider<List<ClothingItem>>((ref) async {
  final repository = ref.read(clothingRepositoryProvider);
  final filter = ref.watch(clothingFilterProvider);

  if (filter.searchQuery.isNotEmpty) {
    return repository.searchClothingItems(filter.searchQuery);
  }

  return repository.filterClothingItems(
    types: filter.types.isEmpty ? null : filter.types,
    categories: filter.categories.isEmpty ? null : filter.categories,
    season: filter.season,
    weatherRanges: filter.weatherRanges.isEmpty ? null : filter.weatherRanges,
    colors: filter.colors.isEmpty ? null : filter.colors,
  );
});