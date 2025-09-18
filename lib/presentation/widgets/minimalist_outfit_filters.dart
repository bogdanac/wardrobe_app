import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';

class MinimalistOutfitFilters extends ConsumerWidget {
  final List<String> selectedCategories;
  final Season? selectedSeason;
  final bool? selectedFavorites;
  final Function(List<String>) onCategoriesChanged;
  final Function(Season?) onSeasonChanged;
  final Function(bool?) onFavoritesChanged;

  const MinimalistOutfitFilters({
    super.key,
    required this.selectedCategories,
    this.selectedSeason,
    this.selectedFavorites,
    required this.onCategoriesChanged,
    required this.onSeasonChanged,
    required this.onFavoritesChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // Category dropdown
          _buildCategoryDropdown(),
          const SizedBox(height: 12),
          // Season and favorites dropdowns
          Row(
            children: [
              Expanded(child: _buildSeasonDropdown()),
              const SizedBox(width: 12),
              Expanded(child: _buildFavoriteDropdown()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final quickCategories = [
      'work',
      'casual',
      'elegant',
      'date night',
      'comfortable',
      'formal',
      'sporty',
      'party',
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String?>(
        decoration: const InputDecoration(
          labelText: 'Category',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: selectedCategories.isEmpty ? null : selectedCategories.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<String?>(
            value: null,
            child: Text('All Categories', style: TextStyle(fontSize: 12)),
          ),
          ...quickCategories.map((category) => DropdownMenuItem<String?>(
            value: category,
            child: Text(category.capitalize(), style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
          )),
        ],
        onChanged: (String? value) {
          if (value == null) {
            onCategoriesChanged([]);
          } else {
            onCategoriesChanged([value]);
          }
        },
      ),
    );
  }

  Widget _buildSeasonDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<Season?>(
        decoration: const InputDecoration(
          labelText: 'Season',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: selectedSeason,
        isExpanded: true,
        items: [
          const DropdownMenuItem<Season?>(
            value: null,
            child: Text('All Seasons', style: TextStyle(fontSize: 12)),
          ),
          ...Season.values.map((season) => DropdownMenuItem<Season?>(
            value: season,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getSeasonColor(season),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    _getSeasonLabel(season),
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )),
        ],
        onChanged: (Season? value) {
          onSeasonChanged(value);
        },
      ),
    );
  }

  Widget _buildFavoriteDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<bool?>(
        decoration: const InputDecoration(
          labelText: 'Favorites',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: selectedFavorites,
        isExpanded: true,
        items: [
          const DropdownMenuItem<bool?>(
            value: null,
            child: Text('All Outfits', style: TextStyle(fontSize: 12)),
          ),
          DropdownMenuItem<bool?>(
            value: true,
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.pastelPink.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '❤️',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Flexible(
                  child: Text(
                    'Favorites Only',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
        onChanged: (bool? value) {
          onFavoritesChanged(value);
        },
      ),
    );
  }

  String _getSeasonLabel(Season season) {
    switch (season) {
      case Season.spring: return 'Spring';
      case Season.summer: return 'Summer';
      case Season.autumn: return 'Fall';
      case Season.winter: return 'Winter';
      case Season.allSeason: return 'All';
    }
  }

  Color _getSeasonColor(Season? season) {
    if (season == null) return AppTheme.mediumGray.withValues(alpha: 0.3);
    switch (season) {
      case Season.spring: return const Color(0xFF66BB6A).withValues(alpha: 0.3);
      case Season.summer: return const Color(0xFFFA70A8).withValues(alpha: 0.3);
      case Season.autumn: return const Color(0xE8F43761).withValues(alpha: 0.3);
      case Season.winter: return const Color(0xFF42A5F5).withValues(alpha: 0.3);
      case Season.allSeason: return AppTheme.mediumGray.withValues(alpha: 0.3);
    }
  }
}

extension StringCapitalize on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}