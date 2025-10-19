import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/constants/category_constants.dart';
import '../providers/category_provider.dart';

class MaximalistClothingItemFilters extends ConsumerStatefulWidget {
  final bool showCategories;
  final bool showSeasons;
  final bool showWeather;
  final bool showColors;
  final bool showClothingTypes;
  final bool showFavorites;
  final bool showMetallicElements;
  final List<String> selectedCategories;
  final List<Season> selectedSeasons;
  final List<WeatherRange> selectedWeatherRanges;
  final List<String> selectedColors;
  final List<ClothingType> selectedTypes;
  final bool? selectedFavorites;
  final MetallicElements? selectedMetallicElements;
  final Function(List<String>) onCategoriesChanged;
  final Function(List<Season>) onSeasonsChanged;
  final Function(List<WeatherRange>) onWeatherChanged;
  final Function(List<String>) onColorsChanged;
  final Function(List<ClothingType>) onTypesChanged;
  final Function(bool?) onFavoritesChanged;
  final Function(MetallicElements?) onMetallicElementsChanged;

  const MaximalistClothingItemFilters({
    super.key,
    this.showCategories = true,
    this.showSeasons = true,
    this.showWeather = true,
    this.showColors = false,
    this.showClothingTypes = false,
    this.showFavorites = false,
    this.showMetallicElements = false,
    required this.selectedCategories,
    this.selectedSeasons = const [],
    required this.selectedWeatherRanges,
    this.selectedColors = const [],
    this.selectedTypes = const [],
    this.selectedFavorites,
    this.selectedMetallicElements,
    required this.onCategoriesChanged,
    required this.onSeasonsChanged,
    required this.onWeatherChanged,
    required this.onColorsChanged,
    required this.onTypesChanged,
    required this.onFavoritesChanged,
    required this.onMetallicElementsChanged,
  });

  @override
  ConsumerState<MaximalistClothingItemFilters> createState() => _MaximalistClothingItemFiltersState();
}

class _MaximalistClothingItemFiltersState extends ConsumerState<MaximalistClothingItemFilters> {
  List<String> _wardrobeColors = [];

  @override
  void initState() {
    super.initState();
    if (widget.showColors) _loadWardrobeColors();
  }

  Future<void> _loadWardrobeColors() async {
    // Fixed set of 6 distinct colors as specified
    setState(() {
      _wardrobeColors = [
        'white',
        'black',
        'pastel blue',
        'pastel pink',
        'fuchsia',
        'multicolor'
      ];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showCategories) ...[
          _buildCategoryFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showSeasons) ...[
          _buildSeasonFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showWeather) ...[
          _buildWeatherFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showColors) ...[
          _buildColorFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showClothingTypes) ...[
          _buildClothingTypeFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showFavorites) ...[
          _buildFavoriteFilter(),
          const SizedBox(height: 16),
        ],
        if (widget.showMetallicElements) ...[
          _buildMetallicElementsFilter(),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildCategoryFilter() {
    final categoriesAsync = ref.watch(allCategoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Style Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 0,
              children: categories.map((category) {
                final isSelected = widget.selectedCategories.contains(category.name);
                final description = category.description ?? DefaultCategories.getDescription(category.name);

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilterChip(
                      label: Text(category.name),
                      selected: isSelected,
                      selectedColor: category.color,
                      backgroundColor: category.color.withValues(alpha: 0.9),
                      side: BorderSide.none,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      onSelected: (selected) {
                        final newCategories = List<String>.from(widget.selectedCategories);
                        if (selected) {
                          newCategories.add(category.name);
                        } else {
                          newCategories.remove(category.name);
                        }
                        widget.onCategoriesChanged(newCategories);
                      },
                    ),
                    if (description != null && description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  description,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black,
                                duration: const Duration(seconds: 3),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          child: Tooltip(
                            message: description,
                            preferBelow: false,
                            child: Icon(
                              Icons.info_outline,
                              size: 16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error loading categories'),
    );
  }

  Widget _buildSeasonFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seasons',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 0,
          children: Season.values.map((season) {
            final isSelected = widget.selectedSeasons.contains(season);
            return FilterChip(
              label: Text(_getSeasonLabel(season)),
              selected: isSelected,
              selectedColor: _getSeasonColor(season),
              backgroundColor: _getSeasonColor(season).withValues(alpha: 0.9),
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                final newSeasons = List<Season>.from(widget.selectedSeasons);
                if (selected) {
                  newSeasons.add(season);
                } else {
                  newSeasons.remove(season);
                }
                widget.onSeasonsChanged(newSeasons);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildWeatherFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weather',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 0,
          children: WeatherRange.values.map((range) {
            final isSelected = widget.selectedWeatherRanges.contains(range);
            return FilterChip(
              label: Text(_getWeatherRangeLabel(range)),
              selected: isSelected,
              selectedColor: _getWeatherColor(range),
              backgroundColor: _getWeatherColor(range).withValues(alpha: 0.9),
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                final newRanges = List<WeatherRange>.from(widget.selectedWeatherRanges);
                if (selected) {
                  newRanges.add(range);
                } else {
                  newRanges.remove(range);
                }
                widget.onWeatherChanged(newRanges);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Wardrobe Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: _loadWardrobeColors,
              icon: const Icon(Icons.refresh, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 1,
          runSpacing: 0,
          children: _wardrobeColors.map((color) {
            final isSelected = widget.selectedColors.contains(color);
            return FilterChip(
              label: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: _getColorFromName(color).withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400),
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                final newColors = List<String>.from(widget.selectedColors);
                if (selected) {
                  newColors.add(color);
                } else {
                  newColors.remove(color);
                }
                widget.onColorsChanged(newColors);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildClothingTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clothing Types',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 0,
          children: ClothingType.values.map((type) {
            final isSelected = widget.selectedTypes.contains(type);
            return FilterChip(
              label: Text(_getClothingTypeLabel(type)),
              selected: isSelected,
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                final newTypes = List<ClothingType>.from(widget.selectedTypes);
                if (selected) {
                  newTypes.add(type);
                } else {
                  newTypes.remove(type);
                }
                widget.onTypesChanged(newTypes);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFavoriteFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 0,
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: widget.selectedFavorites == null,
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                widget.onFavoritesChanged(null);
              },
            ),
            ChoiceChip(
              label: const Text('Favorites Only'),
              selected: widget.selectedFavorites == true,
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                widget.onFavoritesChanged(selected ? true : null);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetallicElementsFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Metallic Elements',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 0,
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: widget.selectedMetallicElements == null,
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                widget.onMetallicElementsChanged(null);
              },
            ),
            ...MetallicElements.values.map((element) {
              final isSelected = widget.selectedMetallicElements == element;
              return ChoiceChip(
                label: Text(_getMetallicElementsLabel(element)),
                selected: isSelected,
                selectedColor: _getMetallicElementsColor(element),
                backgroundColor: _getMetallicElementsColor(element).withValues(alpha: 0.2),
                side: BorderSide.none,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                onSelected: (selected) {
                  widget.onMetallicElementsChanged(selected ? element : null);
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'white': return Colors.white;
      case 'black': return Colors.black;
      case 'pastel blue': return const Color(0xFFB3D9FF);
      case 'pastel pink': return const Color(0xFFFFB3D9);
      case 'fuchsia': return const Color(0xFFFF00FF);
      case 'multicolor': return const Color(0xFF808080); // Gray to represent multicolor
      default: return Colors.grey;
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

  String _getWeatherRangeLabel(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot: return '28°C';
      case WeatherRange.hot: return '22°C';
      case WeatherRange.warm: return '14°C';
      case WeatherRange.cool: return '4°C';
      case WeatherRange.cold: return '-4°C';
      case WeatherRange.veryCold: return '-15°C';
    }
  }

  String _getClothingTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Top';
      case ClothingType.bottom: return 'Bottom';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.accessory: return 'Accessory';
      case ClothingType.outerwear: return 'Outerwear';
      case ClothingType.bag: return 'Bag';
      case ClothingType.swimwear: return 'Swimwear';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.dress: return 'Dress';
    }
  }

  Color _getSeasonColor(Season season) {
    switch (season) {
      case Season.spring: return const Color(0xFF66BB6A);
      case Season.summer: return const Color(0xFFFA70A8);
      case Season.autumn: return const Color(0xE8F43761);
      case Season.winter: return const Color(0xFF42A5F5);
      case Season.allSeason: return const Color(0x4F8F7493);
    }
  }

  Color _getWeatherColor(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot: return const Color(0xFFFF6229);
      case WeatherRange.hot: return const Color(0xFFF8833B);
      case WeatherRange.warm: return const Color(0xFFFFB94F);
      case WeatherRange.cool: return const Color(0xFF42A5F5);
      case WeatherRange.cold: return const Color(0xFF5C6BC0);
      case WeatherRange.veryCold: return const Color(0xFF78909C);
    }
  }

  String _getMetallicElementsLabel(MetallicElements elements) {
    switch (elements) {
      case MetallicElements.none:
        return 'None';
      case MetallicElements.gold:
        return 'Gold';
      case MetallicElements.silver:
        return 'Silver';
    }
  }

  Color _getMetallicElementsColor(MetallicElements elements) {
    switch (elements) {
      case MetallicElements.none:
        return Colors.grey;
      case MetallicElements.gold:
        return const Color(0xFFFFD700);
      case MetallicElements.silver:
        return const Color(0xFFC0C0C0);
    }
  }
}