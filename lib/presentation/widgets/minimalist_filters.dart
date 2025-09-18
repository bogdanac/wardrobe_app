import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';

class MinimalistFilters extends ConsumerWidget {
  final List<ClothingType> selectedTypes;
  final Season? selectedSeason;
  final List<String> selectedColors;
  final List<SizeFit> selectedSizeFits;
  final Function(List<ClothingType>) onTypesChanged;
  final Function(Season?) onSeasonChanged;
  final Function(List<String>) onColorsChanged;
  final Function(List<SizeFit>) onSizeFitsChanged;

  const MinimalistFilters({
    super.key,
    required this.selectedTypes,
    this.selectedSeason,
    required this.selectedColors,
    this.selectedSizeFits = const [],
    required this.onTypesChanged,
    required this.onSeasonChanged,
    required this.onColorsChanged,
    required this.onSizeFitsChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // Type dropdown
          _buildTypeDropdown(),
          const SizedBox(height: 12),
          // Row with other dropdowns
          Row(
            children: [
              Expanded(child: _buildSeasonDropdown()),
              const SizedBox(width: 12),
              Expanded(child: _buildColorDropdown()),
              const SizedBox(width: 12),
              Expanded(child: _buildSizeFitDropdown()),
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
        initialValue: selectedTypes.isEmpty ? null : selectedTypes.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<ClothingType?>(
            value: null,
            child: Text('All Types', style: TextStyle(fontSize: 12)),
          ),
          ...ClothingType.values.map((type) => DropdownMenuItem<ClothingType?>(
            value: type,
            child: Text(_getTypeLabel(type), style: const TextStyle(fontSize: 12)),
          )),
        ],
        onChanged: (ClothingType? value) {
          if (value == null) {
            onTypesChanged([]);
          } else {
            onTypesChanged([value]);
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

  Widget _buildColorDropdown() {
    final quickColors = ['black', 'white', 'blue', 'red', 'green', 'gray', 'pink', 'yellow', 'purple', 'orange', 'brown'];

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
        initialValue: selectedColors.isEmpty ? null : selectedColors.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<String?>(
            value: null,
            child: Text('All Colors', style: TextStyle(fontSize: 12)),
          ),
          ...quickColors.map((color) => DropdownMenuItem<String?>(
            value: color,
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: _getColorFromName(color),
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
                    color.capitalize(),
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
            onColorsChanged([]);
          } else {
            onColorsChanged([value]);
          }
        },
      ),
    );
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Tops';
      case ClothingType.bottom: return 'Bottoms';
      case ClothingType.dress: return 'Dresses';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.outerwear: return 'Outerwear';
      default: return type.toString().split('.').last;
    }
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

  Widget _buildSizeFitDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<SizeFit?>(
        decoration: const InputDecoration(
          labelText: 'Fit',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelStyle: TextStyle(fontSize: 12),
        ),
        initialValue: selectedSizeFits.isEmpty ? null : selectedSizeFits.first,
        isExpanded: true,
        items: [
          const DropdownMenuItem<SizeFit?>(
            value: null,
            child: Text('All Fits', style: TextStyle(fontSize: 12)),
          ),
          ...SizeFit.values.map((sizeFit) => DropdownMenuItem<SizeFit?>(
            value: sizeFit,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getSizeFitColor(sizeFit),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    _getSizeFitLabel(sizeFit),
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )),
        ],
        onChanged: (SizeFit? value) {
          if (value == null) {
            onSizeFitsChanged([]);
          } else {
            onSizeFitsChanged([value]);
          }
        },
      ),
    );
  }

  String _getSizeFitLabel(SizeFit sizeFit) {
    switch (sizeFit) {
      case SizeFit.tooSmall: return 'Too Small';
      case SizeFit.cropped: return 'Cropped';
      case SizeFit.tooLarge: return 'Too Large';
      case SizeFit.oversized: return 'Oversized';
      case SizeFit.perfect: return 'Perfect';
    }
  }

  Color _getSizeFitColor(SizeFit sizeFit) {
    switch (sizeFit) {
      case SizeFit.perfect: return Colors.green.withValues(alpha: 0.3);
      case SizeFit.oversized: return Colors.blue.withValues(alpha: 0.3);
      case SizeFit.tooSmall: return Colors.orange.withValues(alpha: 0.3);
      case SizeFit.cropped: return Colors.orange.withValues(alpha: 0.3);
      case SizeFit.tooLarge: return Colors.red.withValues(alpha: 0.3);
    }
  }

  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black': return Colors.black;
      case 'white': return Colors.white;
      case 'gray': return Colors.grey;
      case 'blue': return Colors.blue;
      case 'red': return Colors.red;
      case 'green': return Colors.green;
      case 'pink': return Colors.pink;
      case 'yellow': return Colors.yellow;
      case 'purple': return Colors.purple;
      case 'orange': return Colors.orange;
      case 'brown': return Colors.brown;
      case 'navy': return const Color(0xFF000080);
      default: return Colors.grey;
    }
  }
}

extension StringCapitalize on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}