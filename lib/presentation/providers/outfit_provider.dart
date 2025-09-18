import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../../data/repositories/outfit_repository_impl.dart';
import '../../core/services/outfit_generator_service.dart';
import 'clothing_provider.dart';

final outfitRepositoryProvider = Provider<OutfitRepository>((ref) {
  return OutfitRepositoryImpl();
});

final outfitGeneratorProvider = Provider<OutfitGeneratorService>((ref) {
  final clothingRepository = ref.read(clothingRepositoryProvider);
  return OutfitGeneratorService(clothingRepository);
});

final allOutfitsProvider = FutureProvider<List<Outfit>>((ref) async {
  final repository = ref.read(outfitRepositoryProvider);
  return repository.getAllOutfits();
});

final outfitByIdProvider = FutureProvider.family<Outfit?, String>((ref, id) async {
  final repository = ref.read(outfitRepositoryProvider);
  return repository.getOutfitById(id);
});

final favoriteOutfitsProvider = FutureProvider<List<Outfit>>((ref) async {
  final repository = ref.read(outfitRepositoryProvider);
  return repository.getFavoriteOutfits();
});

class OutfitFilterState {
  final List<String> categories;
  final Season? season;
  final List<WeatherRange> weatherRanges;
  final bool? isFavorite;
  final String searchQuery;
  final bool showArchived;

  const OutfitFilterState({
    this.categories = const [],
    this.season,
    this.weatherRanges = const [],
    this.isFavorite,
    this.searchQuery = '',
    this.showArchived = false,
  });

  OutfitFilterState copyWith({
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    bool? isFavorite,
    String? searchQuery,
    bool? showArchived,
  }) {
    return OutfitFilterState(
      categories: categories ?? this.categories,
      season: season ?? this.season,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      isFavorite: isFavorite ?? this.isFavorite,
      searchQuery: searchQuery ?? this.searchQuery,
      showArchived: showArchived ?? this.showArchived,
    );
  }
}

class OutfitFilterNotifier extends StateNotifier<OutfitFilterState> {
  OutfitFilterNotifier() : super(const OutfitFilterState());

  void updateCategories(List<String> categories) {
    state = state.copyWith(categories: categories);
  }

  void updateSeason(Season? season) {
    state = state.copyWith(season: season);
  }

  void updateWeatherRanges(List<WeatherRange> weatherRanges) {
    state = state.copyWith(weatherRanges: weatherRanges);
  }

  void updateFavoriteFilter(bool? isFavorite) {
    state = state.copyWith(isFavorite: isFavorite);
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updateShowArchived(bool showArchived) {
    state = state.copyWith(showArchived: showArchived);
  }

  void clearFilters() {
    state = const OutfitFilterState();
  }
}

final outfitFilterProvider = StateNotifierProvider<OutfitFilterNotifier, OutfitFilterState>((ref) {
  return OutfitFilterNotifier();
});

final filteredOutfitsProvider = FutureProvider<List<Outfit>>((ref) async {
  final repository = ref.read(outfitRepositoryProvider);
  final filter = ref.watch(outfitFilterProvider);

  List<Outfit> outfits;

  if (filter.searchQuery.isNotEmpty) {
    outfits = await repository.searchOutfits(filter.searchQuery);
  } else {
    outfits = await repository.filterOutfits(
      categories: filter.categories.isEmpty ? null : filter.categories,
      season: filter.season,
      weatherRanges: filter.weatherRanges.isEmpty ? null : filter.weatherRanges,
      isFavorite: filter.isFavorite,
    );
  }

  // Filter out archived outfits unless specifically requested
  if (!filter.showArchived) {
    outfits = outfits.where((outfit) => !outfit.isArchived).toList();
  } else {
    // When showing archived outfits, sort by most recently archived first
    outfits = outfits.where((outfit) => outfit.isArchived).toList();
    outfits.sort((a, b) {
      if (a.dateArchived == null && b.dateArchived == null) return 0;
      if (a.dateArchived == null) return 1;
      if (b.dateArchived == null) return -1;
      return b.dateArchived!.compareTo(a.dateArchived!); // Most recent first
    });
  }

  return outfits;
});

class GeneratedOutfitsNotifier extends StateNotifier<List<Outfit>> {
  GeneratedOutfitsNotifier(this._outfitGenerator) : super([]);

  final OutfitGeneratorService _outfitGenerator;

  Future<void> generateOutfits({
    required int count,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? preferredColors,
  }) async {
    final outfits = await _outfitGenerator.generateMultipleOutfits(
      count: count,
      categories: categories,
      season: season,
      weatherRanges: weatherRanges,
      preferredColors: preferredColors,
    );
    state = outfits;
  }

  void setOutfits(List<Outfit> outfits) {
    state = outfits;
  }

  void clearGenerated() {
    state = [];
  }
}

final generatedOutfitsProvider = StateNotifierProvider<GeneratedOutfitsNotifier, List<Outfit>>((ref) {
  final generator = ref.read(outfitGeneratorProvider);
  return GeneratedOutfitsNotifier(generator);
});