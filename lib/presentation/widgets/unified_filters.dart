import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/utils/category_colors.dart';
import '../providers/clothing_provider.dart';

class UnifiedFilters extends ConsumerStatefulWidget {
  final bool showCategories;
  final bool showSeasons;
  final bool showWeather;
  final bool showColors;
  final bool showClothingTypes;
  final bool showFavorites;
  final List<String> selectedCategories;
  final Season? selectedSeason;
  final List<WeatherRange> selectedWeatherRanges;
  final List<String> selectedColors;
  final List<ClothingType> selectedTypes;
  final bool? selectedFavorites;
  final Function(List<String>) onCategoriesChanged;
  final Function(Season?) onSeasonChanged;
  final Function(List<WeatherRange>) onWeatherChanged;
  final Function(List<String>) onColorsChanged;
  final Function(List<ClothingType>) onTypesChanged;
  final Function(bool?) onFavoritesChanged;

  const UnifiedFilters({
    super.key,
    this.showCategories = true,
    this.showSeasons = true,
    this.showWeather = true,
    this.showColors = false,
    this.showClothingTypes = false,
    this.showFavorites = false,
    required this.selectedCategories,
    this.selectedSeason,
    required this.selectedWeatherRanges,
    this.selectedColors = const [],
    this.selectedTypes = const [],
    this.selectedFavorites,
    required this.onCategoriesChanged,
    required this.onSeasonChanged,
    required this.onWeatherChanged,
    required this.onColorsChanged,
    required this.onTypesChanged,
    required this.onFavoritesChanged,
  });

  @override
  ConsumerState<UnifiedFilters> createState() => _UnifiedFiltersState();
}

class _UnifiedFiltersState extends ConsumerState<UnifiedFilters> {
  List<String> _allCategories = [];
  List<String> _wardrobeColors = [];
  static const String _customCategoriesKey = 'custom_style_categories';

  @override
  void initState() {
    super.initState();
    if (widget.showCategories) _loadCategories();
    if (widget.showColors) _loadWardrobeColors();
  }

  Future<void> _loadCategories() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedCategories = prefs.getStringList(_customCategoriesKey) ?? [];
    
    if (savedCategories.isEmpty) {
      savedCategories = [
        'brunch with the girls',
        'period safe',
        'mall/errands',
        'work',
        'elegant',
        'classy events',
        'festivals',
        'romantic dates',
        'comfortable',
      ];
    }
    
    setState(() {
      _allCategories = savedCategories;
    });
  }

  Future<void> _loadWardrobeColors() async {
    try {
      final clothingRepository = ref.read(clothingRepositoryProvider);
      final allItems = await clothingRepository.getAllClothingItems();
      
      final Map<String, int> colorCounts = {};
      for (final item in allItems) {
        for (final color in item.colors) {
          final normalizedColor = _normalizeColor(color.toLowerCase().trim());
          colorCounts[normalizedColor] = (colorCounts[normalizedColor] ?? 0) + 1;
        }
      }
      
      final sortedColors = colorCounts.entries
          .where((entry) => entry.value > 0)
          .toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      final mostCommon = sortedColors.take(6).map((e) => e.key).toList();
      
      final allPossibleColors = {
        'black', 'white', 'gray', 'brown', 'beige',
        'red', 'pink', 'orange', 'yellow',
        'green', 'blue', 'navy', 'purple',
        'teal', 'coral', 'burgundy', 'olive',
        'cream', 'tan', 'maroon', 'mint',
        'lavender', 'gold', 'crimson', 'emerald',
        'turquoise', 'magenta', 'lime', 'indigo', 'rose', 'amber',
      }.toList();
      
      final randomColors = <String>[];
      final remainingColors = allPossibleColors.where((c) => !mostCommon.contains(c)).toList();
      remainingColors.shuffle();
      randomColors.addAll(remainingColors.take(12));
      
      final combinedColors = [...mostCommon, ...randomColors];
      final uniqueColors = <String>[];
      final seen = <String>{};
      
      for (final color in combinedColors) {
        final normalized = _normalizeColor(color.toLowerCase().trim());
        if (!seen.contains(normalized)) {
          seen.add(normalized);
          uniqueColors.add(normalized);
        }
      }
      
      setState(() {
        _wardrobeColors = uniqueColors;
      });
    } catch (e) {
      final fallbackColors = [
        'black', 'white', 'red', 'blue', 'green', 'purple',
        'pink', 'orange', 'yellow', 'teal', 'coral', 'burgundy',
        'navy', 'mint', 'lavender', 'gold', 'crimson', 'emerald',
        'turquoise', 'magenta', 'lime', 'indigo', 'rose', 'amber',
      ];
      fallbackColors.shuffle();
      setState(() {
        _wardrobeColors = fallbackColors.toSet().toList();
      });
    }
  }

  String _normalizeColor(String color) {
    final colorMap = {
      'grey': 'gray', 'gray': 'gray', 'grey-blue': 'gray',
      'light gray': 'gray', 'dark gray': 'gray',
      'light grey': 'gray', 'dark grey': 'gray',
      'navy blue': 'navy', 'dark blue': 'navy',
      'light blue': 'blue', 'sky blue': 'blue',
      'royal blue': 'blue', 'baby blue': 'blue',
      'light green': 'green', 'dark green': 'green',
      'forest green': 'green', 'lime green': 'lime',
      'olive green': 'olive', 'light pink': 'pink',
      'hot pink': 'pink', 'baby pink': 'pink',
      'bright pink': 'pink', 'dark red': 'red',
      'bright red': 'red', 'deep red': 'red',
      'wine red': 'burgundy', 'dark purple': 'purple',
      'light purple': 'purple', 'bright purple': 'purple',
      'off white': 'white', 'cream white': 'cream',
      'ivory': 'cream', 'beige': 'beige',
      'tan': 'tan', 'khaki': 'beige',
    };
    return colorMap[color] ?? color;
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
      ],
    );
  }

  Widget _buildCategoryFilter() {
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
          spacing: 4,
          runSpacing: 0,
          children: _allCategories.map((category) {
            final isSelected = widget.selectedCategories.contains(category);
            return FilterChip(
              label: Text(category),
              selected: isSelected,
              selectedColor: CategoryColors.getCategoryColor(category),
              backgroundColor: CategoryColors.getCategoryColor(category).withValues(alpha: 0.9),
              onSelected: (selected) {
                final newCategories = List<String>.from(widget.selectedCategories);
                if (selected) {
                  newCategories.add(category);
                } else {
                  newCategories.remove(category);
                }
                widget.onCategoriesChanged(newCategories);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeasonFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Season',
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
            final isSelected = widget.selectedSeason == season;
            return ChoiceChip(
              label: Text(_getSeasonLabel(season)),
              selected: isSelected,
              selectedColor: _getSeasonColor(season),
              backgroundColor: _getSeasonColor(season).withValues(alpha: 0.9),
              onSelected: (selected) {
                widget.onSeasonChanged(season);
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
          'Weather Range',
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
              onSelected: (selected) {
                widget.onFavoritesChanged(null);
              },
            ),
            ChoiceChip(
              label: const Text('Favorites Only'),
              selected: widget.selectedFavorites == true,
              onSelected: (selected) {
                widget.onFavoritesChanged(selected ? true : null);
              },
            ),
          ],
        ),
      ],
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black': return Colors.black;
      case 'white': return Colors.white;
      case 'gray': return Colors.grey;
      case 'brown': return Colors.brown;
      case 'beige': return const Color(0xFFF5F5DC);
      case 'red': return Colors.red;
      case 'pink': return Colors.pink;
      case 'orange': return Colors.orange;
      case 'yellow': return Colors.yellow;
      case 'green': return Colors.green;
      case 'blue': return Colors.blue;
      case 'navy': return const Color(0xFF000080);
      case 'purple': return Colors.purple;
      case 'teal': return Colors.teal;
      case 'coral': return const Color(0xFFFF7F50);
      case 'burgundy': return const Color(0xFF800020);
      case 'olive': return const Color(0xFF808000);
      case 'cream': return const Color(0xFFFFFDD0);
      case 'tan': return const Color(0xFFD2B48C);
      case 'maroon': return const Color(0xFF800000);
      case 'mint': return const Color(0xFF98FF98);
      case 'lavender': return const Color(0xFFE6E6FA);
      case 'gold': return const Color(0xFFFFD700);
      case 'crimson': return const Color(0xFFDC143C);
      case 'emerald': return const Color(0xFF50C878);
      case 'turquoise': return const Color(0xFF40E0D0);
      case 'lime': return const Color(0xFF00FF00);
      case 'indigo': return Colors.indigo;
      case 'rose': return const Color(0xFFFF007F);
      case 'amber': return const Color(0xFFFFBF00);
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
      case WeatherRange.veryHot: return '28°C+';
      case WeatherRange.hot: return '22°C+';
      case WeatherRange.warm: return '14°C+';
      case WeatherRange.cool: return '4°C+';
      case WeatherRange.cold: return '-4°C+';
      case WeatherRange.veryCold: return '-15°C+';
    }
  }

  String _getClothingTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Top';
      case ClothingType.bottom: return 'Bottom';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.accessory: return 'Accessory';
      case ClothingType.outerwear: return 'Outerwear';
      case ClothingType.undergarment: return 'Undergarment';
      case ClothingType.jewelry: return 'Jewelry';
      case ClothingType.bag: return 'Bag';
      case ClothingType.hat: return 'Hat';
      case ClothingType.scarf: return 'Scarf';
      case ClothingType.belt: return 'Belt';
      case ClothingType.gloves: return 'Gloves';
      case ClothingType.swimwear: return 'Swimwear';
      case ClothingType.sleepwear: return 'Sleepwear';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.dress: return 'Dress';
      case ClothingType.jumpsuit: return 'Jumpsuit';
      case ClothingType.suit: return 'Suit';
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
}