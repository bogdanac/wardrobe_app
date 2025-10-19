import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';

class MaximalistOutfitFilters extends StatelessWidget {
  final Season? selectedSeason;
  final List<WeatherRange> selectedWeatherRanges;
  final Function(Season?) onSeasonChanged;
  final Function(List<WeatherRange>) onWeatherRangesChanged;
  final Season? suggestedSeason;
  final bool isDarkMode;

  const MaximalistOutfitFilters({
    super.key,
    required this.selectedSeason,
    required this.selectedWeatherRanges,
    required this.onSeasonChanged,
    required this.onWeatherRangesChanged,
    this.suggestedSeason,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSeasonSelector(),
        const SizedBox(height: 24),
        _buildWeatherRangeSelector(),
      ],
    );
  }

  Widget _buildSeasonSelector() {
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Season',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            if (suggestedSeason != null) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppTheme.pastelPink,
              ),
              const SizedBox(width: 4),
              Text(
                'Suggested: ${_getSeasonLabel(suggestedSeason!)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.pastelPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            // All Season first
            ...Season.values.where((s) => s == Season.allSeason).map((season) {
              final isSelected = selectedSeason == season;
              final isSuggested = suggestedSeason == season;
              return ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSuggested) ...[
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      _getSeasonLabel(season),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                selected: isSelected,
                selectedColor: _getSeasonColor(season),
                backgroundColor: _getSeasonColor(season).withValues(alpha: 0.9),
                side: BorderSide.none,
                onSelected: (selected) {
                  onSeasonChanged(selected ? season : null);
                },
              );
            }),
            // Then the other seasons
            ...Season.values.where((s) => s != Season.allSeason).map((season) {
              final isSelected = selectedSeason == season;
              final isSuggested = suggestedSeason == season;
              return ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSuggested) ...[
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      _getSeasonLabel(season),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                selected: isSelected,
                selectedColor: _getSeasonColor(season),
                backgroundColor: _getSeasonColor(season).withValues(alpha: 0.9),
                side: BorderSide.none,
                onSelected: (selected) {
                  onSeasonChanged(selected ? season : null);
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherRangeSelector() {
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weather',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: WeatherRange.values.map((range) {
            final isSelected = selectedWeatherRanges.contains(range);
            return FilterChip(
              label: Text(
                _getWeatherRangeLabel(range),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
              selected: isSelected,
              selectedColor: _getWeatherColor(range),
              backgroundColor: _getWeatherColor(range).withValues(alpha: 0.9),
              side: BorderSide.none,
              onSelected: (selected) {
                final currentRanges = List<WeatherRange>.from(selectedWeatherRanges);
                if (selected) {
                  currentRanges.add(range);
                } else {
                  currentRanges.remove(range);
                }
                onWeatherRangesChanged(currentRanges);
              },
            );
          }).toList(),
        ),
      ],
    );
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

  Color _getSeasonColor(Season season) {
    switch (season) {
      case Season.spring:
        return const Color(0xFF66BB6A);
      case Season.summer:
        return const Color(0xFFFFB74D);
      case Season.autumn:
        return const Color(0xFFFF7043);
      case Season.winter:
        return const Color(0xFF42A5F5);
      case Season.allSeason:
        return AppTheme.mediumGray;
    }
  }

  String _getWeatherRangeLabel(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return '28°C';
      case WeatherRange.hot:
        return '22°C';
      case WeatherRange.warm:
        return '14°C';
      case WeatherRange.cool:
        return '4°C';
      case WeatherRange.cold:
        return '-4°C';
      case WeatherRange.veryCold:
        return '-15°C';
    }
  }

  Color _getWeatherColor(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return const Color(0xFFFF5722);
      case WeatherRange.hot:
        return const Color(0xFFFF9800);
      case WeatherRange.warm:
        return const Color(0xFFFFC107);
      case WeatherRange.cool:
        return const Color(0xFF4CAF50);
      case WeatherRange.cold:
        return const Color(0xFF2196F3);
      case WeatherRange.veryCold:
        return const Color(0xFF3F51B5);
    }
  }
}
