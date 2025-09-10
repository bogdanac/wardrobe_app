import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../providers/clothing_provider.dart';

class ClothingFilterBottomSheet extends ConsumerStatefulWidget {
  const ClothingFilterBottomSheet({super.key});

  @override
  ConsumerState<ClothingFilterBottomSheet> createState() => _ClothingFilterBottomSheetState();
}

class _ClothingFilterBottomSheetState extends ConsumerState<ClothingFilterBottomSheet> {
  late List<ClothingType> _selectedTypes;
  late List<String> _selectedCategories;
  late Season? _selectedSeason;
  late List<WeatherRange> _selectedWeatherRanges;

  @override
  void initState() {
    super.initState();
    final currentFilter = ref.read(clothingFilterProvider);
    _selectedTypes = List.from(currentFilter.types);
    _selectedCategories = List.from(currentFilter.categories);
    _selectedSeason = currentFilter.season;
    _selectedWeatherRanges = List.from(currentFilter.weatherRanges);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter Items',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: _clearFilters,
                child: const Text('Clear All'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTypeFilter(),
          const SizedBox(height: 16),
          _buildSeasonFilter(),
          const SizedBox(height: 16),
          _buildWeatherRangeFilter(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _applyFilters,
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeFilter() {
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
          spacing: 8,
          runSpacing: 8,
          children: ClothingType.values.map((type) {
            final isSelected = _selectedTypes.contains(type);
            return FilterChip(
              label: Text(_getTypeLabel(type)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedTypes.add(type);
                  } else {
                    _selectedTypes.remove(type);
                  }
                });
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
          spacing: 8,
          runSpacing: 8,
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: _selectedSeason == null,
              onSelected: (selected) {
                setState(() {
                  _selectedSeason = null;
                });
              },
            ),
            ...Season.values.map((season) {
              final isSelected = _selectedSeason == season;
              return ChoiceChip(
                label: Text(_getSeasonLabel(season)),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedSeason = selected ? season : null;
                  });
                },
              );
            }).toList(),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherRangeFilter() {
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
          spacing: 8,
          runSpacing: 8,
          children: WeatherRange.values.map((range) {
            final isSelected = _selectedWeatherRanges.contains(range);
            return FilterChip(
              label: Text(_getWeatherRangeLabel(range)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedWeatherRanges.add(range);
                  } else {
                    _selectedWeatherRanges.remove(range);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedTypes.clear();
      _selectedCategories.clear();
      _selectedSeason = null;
      _selectedWeatherRanges.clear();
    });
  }

  void _applyFilters() {
    final notifier = ref.read(clothingFilterProvider.notifier);
    notifier.updateTypes(_selectedTypes);
    notifier.updateCategories(_selectedCategories);
    notifier.updateSeason(_selectedSeason);
    notifier.updateWeatherRanges(_selectedWeatherRanges);
    Navigator.pop(context);
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return 'Top';
      case ClothingType.bottom:
        return 'Bottom';
      case ClothingType.shoes:
        return 'Shoes';
      case ClothingType.accessory:
        return 'Accessory';
      case ClothingType.outerwear:
        return 'Outerwear';
      case ClothingType.undergarment:
        return 'Undergarment';
      case ClothingType.jewelry:
        return 'Jewelry';
      case ClothingType.bag:
        return 'Bag';
      case ClothingType.hat:
        return 'Hat';
      case ClothingType.scarf:
        return 'Scarf';
      case ClothingType.belt:
        return 'Belt';
      case ClothingType.gloves:
        return 'Gloves';
      case ClothingType.swimwear:
        return 'Swimwear';
      case ClothingType.sleepwear:
        return 'Sleepwear';
      case ClothingType.activewear:
        return 'Activewear';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.jumpsuit:
        return 'Jumpsuit';
      case ClothingType.suit:
        return 'Suit';
    }
  }

  String _getSeasonLabel(Season season) {
    switch (season) {
      case Season.spring:
        return 'Spring';
      case Season.summer:
        return 'Summer';
      case Season.autumn:
        return 'Autumn';
      case Season.winter:
        return 'Winter';
      case Season.allSeason:
        return 'All Season';
    }
  }

  String _getWeatherRangeLabel(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return '28°C+';
      case WeatherRange.hot:
        return '22°C+';
      case WeatherRange.warm:
        return '14°C+';
      case WeatherRange.cool:
        return '4°C+';
      case WeatherRange.cold:
        return '-4°C+';
      case WeatherRange.veryCold:
        return '-15°C+';
    }
  }
}