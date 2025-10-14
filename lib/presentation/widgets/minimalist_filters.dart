import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/color_palette_service.dart';

class MinimalistFilters extends ConsumerStatefulWidget {
  final List<ClothingType> selectedTypes;
  final Season? selectedSeason;
  final List<String> selectedColors;
  final List<String> selectedCategories;
  final Function(List<ClothingType>) onTypesChanged;
  final Function(Season?) onSeasonChanged;
  final Function(List<String>) onColorsChanged;
  final Function(List<String>) onCategoriesChanged;

  const MinimalistFilters({
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
  ConsumerState<MinimalistFilters> createState() => _MinimalistFiltersState();
}

class _MinimalistFiltersState extends ConsumerState<MinimalistFilters> {
  final ColorPaletteService _colorService = ColorPaletteService();
  List<Map<String, String>> _paletteColors = [];
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadColors();
    _loadCategories();
  }

  Future<void> _loadColors() async {
    final colors = await _colorService.getColors();
    setState(() {
      _paletteColors = colors;
    });
  }

  Future<void> _loadCategories() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedCategories = prefs.getStringList('custom_style_categories') ?? [];

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
      _categories = savedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          // Type dropdown
          _buildTypeDropdown(),
          const SizedBox(height: 8),
          // Row with other dropdowns
          Row(
            children: [
              Expanded(child: _buildCategoryDropdown()),
              const SizedBox(width: 12),
              Expanded(child: _buildSeasonDropdown()),
              const SizedBox(width: 12),
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<ClothingType?>(
        decoration: const InputDecoration(
          labelText: 'Type',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        value: widget.selectedTypes.isEmpty ? null : widget.selectedTypes.first,
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<Season?>(
        decoration: const InputDecoration(
          labelText: 'Season',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        value: widget.selectedSeason,
        isExpanded: true,
        items: [
          const DropdownMenuItem<Season?>(
            value: null,
            child: Text('All', style: TextStyle(fontSize: 12)),
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
          widget.onSeasonChanged(value);
        },
      ),
    );
  }
  Widget _buildColorDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String?>(
        decoration: const InputDecoration(
          labelText: 'Color',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        value: widget.selectedColors.isEmpty ? null : widget.selectedColors.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<String?>(
            value: null,
            child: Text('All', style: TextStyle(fontSize: 12)),
          ),
          ..._paletteColors.map((colorData) => DropdownMenuItem<String?>(
            value: colorData['name'],
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: _hexToColor(colorData['hex']!),
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
                    colorData['name']!,
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
            widget.onColorsChanged([]);
          } else {
            widget.onColorsChanged([value]);
          }
        },
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
      case Season.autumn: return 'Fall';
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String?>(
        decoration: const InputDecoration(
          labelText: 'Style',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        value: widget.selectedCategories.isEmpty ? null : widget.selectedCategories.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<String?>(
            value: null,
            child: Text('All', style: TextStyle(fontSize: 12)),
          ),
          ..._categories.map((category) => DropdownMenuItem<String?>(
            value: category,
            child: Text(
              category[0].toUpperCase() + category.substring(1),
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
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
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }
}