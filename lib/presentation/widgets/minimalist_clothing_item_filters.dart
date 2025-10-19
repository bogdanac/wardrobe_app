import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/custom_color.dart';
import '../../core/themes/app_theme.dart';
import '../providers/custom_color_provider.dart';
import '../providers/category_provider.dart';

class MinimalistClothingItemFilters extends ConsumerStatefulWidget {
  final List<ClothingType> selectedTypes;
  final Season? selectedSeason;
  final List<String> selectedColors;
  final List<String> selectedCategories;
  final Function(List<ClothingType>) onTypesChanged;
  final Function(Season?) onSeasonChanged;
  final Function(List<String>) onColorsChanged;
  final Function(List<String>) onCategoriesChanged;

  const MinimalistClothingItemFilters({
    super.key,
    required this.selectedTypes,
    this.selectedSeason,
    required this.selectedColors,
    this.selectedCategories = const [],
    required this.onTypesChanged,
    required this.onSeasonChanged,
    required this.onColorsChanged,
    required this.onCategoriesChanged,
  });

  @override
  ConsumerState<MinimalistClothingItemFilters> createState() => _MinimalistClothingItemFiltersState();
}

class _MinimalistClothingItemFiltersState extends ConsumerState<MinimalistClothingItemFilters> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          // Type dropdown
          _buildTypeDropdown(),
          const SizedBox(height: 3),
          // Row with other dropdowns
          Row(
            children: [
              Expanded(child: _buildCategoryDropdown()),
              const SizedBox(width: 4),
              Expanded(child: _buildSeasonDropdown()),
              const SizedBox(width: 4),
              Expanded(child: _buildColorDropdown()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonFormField<ClothingType?>(
        decoration: const InputDecoration(
          labelText: 'Type',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: widget.selectedTypes.isEmpty ? null : widget.selectedTypes.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<ClothingType?>(
            value: null,
            child: Row(
              children: [
                Icon(Icons.checkroom, size: 18, color: AppTheme.mediumGray),
                SizedBox(width: 10),
                Text('All Types', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          ...ClothingType.values.map((type) => DropdownMenuItem<ClothingType?>(
            value: type,
            child: Row(
              children: [
                Icon(_getTypeIcon(type), size: 18, color: AppTheme.pastelPink),
                const SizedBox(width: 10),
                Text(_getTypeLabel(type), style: const TextStyle(fontSize: 14)),
              ],
            ),
          )),
        ],
        onChanged: (ClothingType? value) {
          if (value == null) {
            widget.onTypesChanged([]);
          } else {
            widget.onTypesChanged([value]);
          }
        },
      ),
    );
  }

  Widget _buildSeasonDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonFormField<Season?>(
        decoration: const InputDecoration(
          labelText: 'Season',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: widget.selectedSeason,
        isExpanded: true,
        items: [
          // All Season first
          ...Season.values.where((s) => s == Season.allSeason).map((season) => DropdownMenuItem<Season?>(
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
          // Then the other seasons
          ...Season.values.where((s) => s != Season.allSeason).map((season) => DropdownMenuItem<Season?>(
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
          widget.onSeasonChanged(value);
        },
      ),
    );
  }
  Widget _buildColorDropdown() {
    final currentValue = widget.selectedColors.isEmpty ? null : widget.selectedColors.first;
    final colorsAsync = ref.watch(allCustomColorsProvider);

    return colorsAsync.when(
      data: (colors) {
        if (colors.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                'No colors',
                style: TextStyle(fontSize: 12, color: AppTheme.mediumGray),
              ),
            ),
          );
        }

        // Group colors by section
        final neutrals = colors.where((c) => c.section == ColorSection.neutrals).toList();
        final pastels = colors.where((c) => c.section == ColorSection.pastels).toList();
        final accents = colors.where((c) => c.section == ColorSection.accents).toList();

        final dropdownItems = <DropdownMenuItem<String?>>[];

        // Add "All" option
        dropdownItems.add(const DropdownMenuItem<String?>(
          value: null,
          child: Text('All', style: TextStyle(fontSize: 12)),
        ));

        // Add Neutrals section
        if (neutrals.isNotEmpty) {
          dropdownItems.add(const DropdownMenuItem<String?>(
            enabled: false,
            value: '_neutrals_header',
            child: Text(
              'NEUTRALS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppTheme.mediumGray,
              ),
            ),
          ));
          dropdownItems.addAll(neutrals.map((color) => _buildColorMenuItem(color)));
        }

        // Add Pastels section
        if (pastels.isNotEmpty) {
          dropdownItems.add(const DropdownMenuItem<String?>(
            enabled: false,
            value: '_pastels_header',
            child: Text(
              'PASTELS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppTheme.mediumGray,
              ),
            ),
          ));
          dropdownItems.addAll(pastels.map((color) => _buildColorMenuItem(color)));
        }

        // Add Accents section
        if (accents.isNotEmpty) {
          dropdownItems.add(const DropdownMenuItem<String?>(
            enabled: false,
            value: '_accents_header',
            child: Text(
              'ACCENT COLORS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppTheme.mediumGray,
              ),
            ),
          ));
          dropdownItems.addAll(accents.map((color) => _buildColorMenuItem(color)));
        }

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonFormField<String?>(
            decoration: const InputDecoration(
              labelText: 'Color',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              labelStyle: TextStyle(fontSize: 12),
            ),
            initialValue: currentValue,
            isExpanded: true,
            items: dropdownItems,
            onChanged: (String? value) {
              if (value == null || value.startsWith('_')) {
                widget.onColorsChanged([]);
              } else {
                widget.onColorsChanged([value]);
              }
            },
          ),
        );
      },
      loading: () => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Text(
            'Loading...',
            style: TextStyle(fontSize: 12, color: AppTheme.mediumGray),
          ),
        ),
      ),
      error: (_, __) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Text(
            'Error',
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String?> _buildColorMenuItem(CustomColor color) {
    return DropdownMenuItem<String?>(
      value: color.name,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.mediumGray.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                color.name,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top: return Icons.checkroom;
      case ClothingType.bottom: return Icons.compress;
      case ClothingType.dress: return Icons.weekend;
      case ClothingType.shoes: return Icons.elevator_rounded;
      case ClothingType.bag: return Icons.shopping_bag_outlined;
      case ClothingType.accessory: return Icons.star;
      case ClothingType.outerwear: return Icons.ac_unit;
      case ClothingType.activewear: return Icons.directions_run;
      case ClothingType.swimwear: return Icons.pool;
    }
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Tops';
      case ClothingType.bottom: return 'Bottoms';
      case ClothingType.dress: return 'Dresses';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.bag: return 'Bags';
      case ClothingType.accessory: return 'Accessories';
      case ClothingType.outerwear: return 'Coats';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.swimwear: return 'Swimwear';
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

  Color _getSeasonColor(Season? season) {
    if (season == null) return AppTheme.mediumGray;
    switch (season) {
      case Season.spring: return const Color(0xFF66BB6A);
      case Season.summer: return const Color(0xFFFFB74D);
      case Season.autumn: return const Color(0xFFFF7043);
      case Season.winter: return const Color(0xFF42A5F5);
      case Season.allSeason: return AppTheme.mediumGray;
    }
  }

  Widget _buildCategoryDropdown() {
    final currentValue = widget.selectedCategories.isEmpty ? null : widget.selectedCategories.first;
    final categoriesAsync = ref.watch(allCategoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        if (categories.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                'No styles',
                style: TextStyle(fontSize: 12, color: AppTheme.mediumGray),
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonFormField<String?>(
            decoration: const InputDecoration(
              labelText: 'Style',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              labelStyle: TextStyle(fontSize: 12),
            ),
            initialValue: currentValue,
            isExpanded: true,
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('All', style: TextStyle(fontSize: 12)),
              ),
              ...categories.map((category) => DropdownMenuItem<String?>(
                value: category.name,
                child: Row(
                  children: [
                    Icon(
                      category.icon ?? Icons.label,
                      size: 16,
                      color: category.color,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        category.name[0].toUpperCase() + category.name.substring(1),
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )),
            ],
            onChanged: (String? value) {
              if (value == null) {
                widget.onCategoriesChanged([]);
              } else {
                widget.onCategoriesChanged([value]);
              }
            },
          ),
        );
      },
      loading: () => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Text(
            'Loading...',
            style: TextStyle(fontSize: 12, color: AppTheme.mediumGray),
          ),
        ),
      ),
      error: (_, __) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Text(
            'Error',
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
      ),
    );
  }
}