import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../widgets/clothing_item_card.dart';

class CreateOutfitScreen extends ConsumerStatefulWidget {
  final Outfit? outfit;

  const CreateOutfitScreen({super.key, this.outfit});

  @override
  ConsumerState<CreateOutfitScreen> createState() => _CreateOutfitScreenState();
}

class _CreateOutfitScreenState extends ConsumerState<CreateOutfitScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _uuid = const Uuid();

  late TabController _tabController;
  List<String> _selectedItemIds = [];
  List<String> _selectedCategories = [];
  Season? _selectedSeason;
  List<WeatherRange> _selectedWeatherRanges = [];
  bool _isFavorite = false;

  final List<String> _outfitCategories = [
    'brunch',
    'period safe',
    'errands',
    'work',
    'elegant',
    'events',
    'festivals',
    'dates',
    'comfortable',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    if (widget.outfit != null) {
      _initializeWithExistingOutfit();
    }
  }

  void _initializeWithExistingOutfit() {
    final outfit = widget.outfit!;
    _nameController.text = outfit.name;
    _notesController.text = outfit.notes ?? '';
    _selectedItemIds = List.from(outfit.clothingItemIds);
    _selectedCategories = List.from(outfit.categories);
    _selectedSeason = outfit.season;
    _selectedWeatherRanges = List.from(outfit.weatherRanges);
    _isFavorite = outfit.isFavorite;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.outfit == null ? 'Create Outfit' : 'Edit Outfit'),
        actions: [
          if (widget.outfit != null)
            IconButton(
              onPressed: _deleteOutfit,
              icon: const Icon(Icons.delete_outline),
              color: Colors.red,
            ),
          TextButton(
            onPressed: _saveOutfit,
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppTheme.pastelPink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Select Items'),
            Tab(text: 'Outfit Details'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSelectItemsTab(),
          _buildOutfitDetailsTab(),
        ],
      ),
    );
  }

  Widget _buildSelectItemsTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.lightGray,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Selected Items: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('${_selectedItemIds.length}'),
                  const Spacer(),
                  if (_selectedItemIds.isNotEmpty)
                    TextButton(
                      onPressed: () => setState(() => _selectedItemIds.clear()),
                      child: const Text(
                        'Clear All',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
              if (_selectedItemIds.isNotEmpty)
                SizedBox(
                  height: 120,
                  child: _buildSelectedItemsPreview(),
                ),
            ],
          ),
        ),
        Expanded(
          child: _buildClothingItemsList(),
        ),
      ],
    );
  }

  Widget _buildSelectedItemsPreview() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _selectedItemIds.length,
      itemBuilder: (context, index) {
        final itemId = _selectedItemIds[index];
        final itemAsync = ref.watch(clothingItemByIdProvider(itemId));
        
        return itemAsync.when(
          data: (item) {
            if (item == null) return const SizedBox.shrink();
            
            return Container(
              width: 80,
              margin: const EdgeInsets.only(right: 8),
              child: Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.primaryWhite,
                    ),
                    child: item.imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(item.imagePath!),
                              fit: BoxFit.contain,
                            ),
                          )
                        : const Icon(Icons.checkroom),
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: IconButton(
                      onPressed: () => _removeItem(itemId),
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.lightGray,
            ),
            child: const CircularProgressIndicator(),
          ),
          error: (error, stack) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildClothingItemsList() {
    final clothingItemsAsync = ref.watch(allClothingItemsProvider);
    
    return clothingItemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.checkroom_outlined,
                  size: 64,
                  color: AppTheme.mediumGray,
                ),
                SizedBox(height: 16),
                Text(
                  'No clothing items found',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.mediumGray,
                  ),
                ),
                Text(
                  'Add some items first!',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          );
        }

        // Group items by type for better organization
        final groupedItems = _groupItemsByType(items);
        
        return ListView(
          padding: const EdgeInsets.all(12),
          children: groupedItems.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    _getTypeLabel(entry.key),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    final item = entry.value[index];
                    final isSelected = _selectedItemIds.contains(item.id);
                    
                    return ClothingItemCard(
                      item: item,
                      isSelected: isSelected,
                      onTap: () => _toggleItem(item.id),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading items: $error'),
      ),
    );
  }

  Widget _buildOutfitDetailsTab() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Outfit Name',
              hintText: 'e.g., Summer Brunch Look',
              filled: true,
              fillColor: AppTheme.mediumGray.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter an outfit name';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          _buildCategorySelector(),
          const SizedBox(height: 24),
          _buildSeasonSelector(),
          const SizedBox(height: 24),
          _buildWeatherRangeSelector(),
          const SizedBox(height: 24),
          _buildFavoriteToggle(),
          const SizedBox(height: 24),
          TextFormField(
            controller: _notesController,
            decoration: InputDecoration(
              labelText: 'Notes (Optional)',
              filled: true,
              fillColor: AppTheme.mediumGray.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText: 'Additional details about this outfit...',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          if (_selectedItemIds.isNotEmpty)
            _buildOutfitPreview(),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
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
          spacing: 8,
          runSpacing: 8,
          children: _outfitCategories.map((category) {
            final isSelected = _selectedCategories.contains(category);
            return FilterChip(
              label: Text(
                category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedCategories.add(category);
                  } else {
                    _selectedCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeasonSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Season (Optional)',
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
              label: const Text('None'),
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
                label: Text(
                  _getSeasonLabel(season),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedSeason = selected ? season : null;
                  });
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherRangeSelector() {
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
              label: Text(
                _getWeatherRangeLabel(range),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
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

  Widget _buildFavoriteToggle() {
    return Row(
      children: [
        const Text(
          'Mark as Favorite',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Switch(
          value: _isFavorite,
          onChanged: (value) {
            setState(() {
              _isFavorite = value;
            });
          },
          activeThumbColor: AppTheme.pastelPink,
        ),
      ],
    );
  }

  Widget _buildOutfitPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Outfit Preview',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.lightGray,
          ),
          child: _selectedItemIds.isEmpty
              ? const Center(
                  child: Text(
                    'Select items to see preview',
                    style: TextStyle(color: AppTheme.mediumGray),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _selectedItemIds.length,
                  itemBuilder: (context, index) {
                    final itemId = _selectedItemIds[index];
                    final itemAsync = ref.watch(clothingItemByIdProvider(itemId));
                    
                    return itemAsync.when(
                      data: (item) {
                        if (item?.imagePath != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(item!.imagePath!),
                              fit: BoxFit.contain,
                            ),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: AppTheme.primaryWhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.checkroom),
                        );
                      },
                      loading: () => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const CircularProgressIndicator(),
                      ),
                      error: (error, stack) => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.error),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _toggleItem(String itemId) {
    setState(() {
      if (_selectedItemIds.contains(itemId)) {
        _selectedItemIds.remove(itemId);
      } else {
        _selectedItemIds.add(itemId);
      }
    });
  }

  void _removeItem(String itemId) {
    setState(() {
      _selectedItemIds.remove(itemId);
    });
  }

  Map<ClothingType, List<ClothingItem>> _groupItemsByType(List<ClothingItem> items) {
    final Map<ClothingType, List<ClothingItem>> grouped = {};
    for (final item in items) {
      grouped.putIfAbsent(item.type, () => []).add(item);
    }
    return grouped;
  }

  Future<void> _saveOutfit() async {
    if (!_formKey.currentState!.validate()) {
      _tabController.animateTo(1);
      return;
    }

    if (_selectedItemIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one clothing item'),
          backgroundColor: Colors.red,
        ),
      );
      _tabController.animateTo(0);
      return;
    }

    try {
      final outfit = Outfit(
        id: widget.outfit?.id ?? _uuid.v4(),
        name: _nameController.text.trim(),
        clothingItemIds: _selectedItemIds,
        categories: _selectedCategories,
        season: _selectedSeason,
        weatherRanges: _selectedWeatherRanges,
        wearCount: widget.outfit?.wearCount ?? 0,
        lastWornDate: widget.outfit?.lastWornDate,
        createdAt: widget.outfit?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isFavorite: _isFavorite,
      );

      final repository = ref.read(outfitRepositoryProvider);
      if (widget.outfit == null) {
        await repository.saveOutfit(outfit);
      } else {
        await repository.updateOutfit(outfit);
      }

      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.outfit == null ? 'Outfit created successfully!' : 'Outfit updated successfully!',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to save outfit: $e',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _deleteOutfit() async {
    if (widget.outfit == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Outfit'),
        content: const Text('Are you sure you want to delete this outfit? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final repository = ref.read(outfitRepositoryProvider);
        await repository.deleteOutfit(widget.outfit!.id);
        
        ref.invalidate(allOutfitsProvider);
        ref.invalidate(filteredOutfitsProvider);
        ref.invalidate(favoriteOutfitsProvider);

        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Outfit deleted successfully!'),
              backgroundColor: AppTheme.pastelPink,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to delete outfit: $e',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top: return 'Tops';
      case ClothingType.bottom: return 'Bottoms';
      case ClothingType.shoes: return 'Shoes';
      case ClothingType.accessory: return 'Accessories';
      case ClothingType.outerwear: return 'Outerwear';
      case ClothingType.undergarment: return 'Undergarments';
      case ClothingType.jewelry: return 'Jewelry';
      case ClothingType.bag: return 'Bags';
      case ClothingType.hat: return 'Hats';
      case ClothingType.scarf: return 'Scarves';
      case ClothingType.belt: return 'Belts';
      case ClothingType.gloves: return 'Gloves';
      case ClothingType.swimwear: return 'Swimwear';
      case ClothingType.sleepwear: return 'Sleepwear';
      case ClothingType.activewear: return 'Activewear';
      case ClothingType.dress: return 'Dresses';
      case ClothingType.jumpsuit: return 'Jumpsuits';
      case ClothingType.suit: return 'Suits';
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
}