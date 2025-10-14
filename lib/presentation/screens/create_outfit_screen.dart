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
import '../../core/services/smart_defaults_service.dart';
import '../widgets/minimalist_filters.dart';
import '../../core/utils/category_colors.dart';

class CreateOutfitScreen extends ConsumerStatefulWidget {
  final Outfit? outfit;
  final List<String>? initialSelectedItemIds;

  const CreateOutfitScreen({super.key, this.outfit, this.initialSelectedItemIds});

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

  // Filters for item selection
  List<ClothingType> _filterTypes = [];
  Season? _filterSeason;
  List<String> _filterColors = [];
  List<String> _filterCategories = [];
  
  // Smart defaults services
  late SmartDefaultsService _smartDefaultsService;
  List<String> _suggestedCategories = [];
  Season? _suggestedSeason;
  List<WeatherRange> _suggestedWeatherRanges = [];
  bool _isGeneratingSuggestions = false;

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

    // Initialize smart defaults service
    _smartDefaultsService = SmartDefaultsService(
      ref.read(clothingRepositoryProvider),
    );

    if (widget.outfit != null) {
      _initializeWithExistingOutfit();
    } else if (widget.initialSelectedItemIds != null) {
      _selectedItemIds = List.from(widget.initialSelectedItemIds!);
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
        // Enhanced header section with better visual hierarchy
        if (_selectedItemIds.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with improved typography
                Row(
                  children: [
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () => setState(() => _selectedItemIds.clear()),
                      icon: const Icon(Icons.clear_all, size: 16),
                      label: const Text(
                        'Clear All',
                        style: TextStyle(fontSize: 13),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.mediumGray,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                    ),
                  ],
                ),
                // Enhanced preview section
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemCount: _selectedItemIds.length,
                    itemBuilder: (context, index) {
                      final itemId = _selectedItemIds[index];
                      final itemAsync = ref.watch(clothingItemByIdProvider(itemId));

                      return itemAsync.when(
                        data: (item) {
                          if (item == null) return const SizedBox.shrink();

                          return Container(
                            width: 88,
                            margin: const EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                // Enhanced item card with better styling
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 88,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: AppTheme.pastelPink.withValues(alpha: 0.3),
                                            width: 1.5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppTheme.pastelPink.withValues(alpha: 0.15),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: item.imagePath != null
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Image.file(
                                                  File(item.imagePath!),
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.checkroom,
                                                color: AppTheme.mediumGray,
                                                size: 32,
                                              ),
                                      ),
                                      // Enhanced remove button
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () => _removeItem(itemId),
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withValues(alpha: 0.7),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        loading: () => Container(
                          width: 88,
                          height: 80,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppTheme.lightGray,
                          ),
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        ),
                        error: (error, stack) => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        // Filters
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: MinimalistFilters(
            selectedTypes: _filterTypes,
            selectedSeason: _filterSeason,
            selectedColors: _filterColors,
            selectedCategories: _filterCategories,
            onTypesChanged: (types) => setState(() => _filterTypes = types),
            onSeasonChanged: (season) => setState(() => _filterSeason = season),
            onColorsChanged: (colors) => setState(() => _filterColors = colors),
            onCategoriesChanged: (categories) => setState(() => _filterCategories = categories),
          ),
        ),
        // Items list with improved spacing
        Expanded(
          child: _buildClothingItemsList(),
        ),
      ],
    );
  }


  Widget _buildClothingItemsList() {
    final clothingItemsAsync = ref.watch(allClothingItemsProvider);

    return clothingItemsAsync.when(
      data: (allItems) {
        // Apply filters
        var items = allItems.where((item) {
          if (_filterTypes.isNotEmpty && !_filterTypes.contains(item.type)) {
            return false;
          }
          if (_filterSeason != null && item.season != _filterSeason) {
            return false;
          }
          if (_filterColors.isNotEmpty) {
            bool hasMatchingColor = false;
            for (final color in _filterColors) {
              if (item.colors.any((c) => c.toLowerCase().contains(color.toLowerCase()))) {
                hasMatchingColor = true;
                break;
              }
            }
            if (!hasMatchingColor) return false;
          }
          if (_filterCategories.isNotEmpty) {
            bool hasMatchingCategory = false;
            for (final category in _filterCategories) {
              if (item.categories.contains(category)) {
                hasMatchingCategory = true;
                break;
              }
            }
            if (!hasMatchingCategory) return false;
          }
          return true;
        }).toList();
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

        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final isSelected = _selectedItemIds.contains(item.id);

            return LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  child: ClothingItemCard(
                    item: item,
                    isSelected: isSelected,
                    onTap: () => _toggleItem(item.id),
                  ),
                );
              },
            );
          },
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Outfit Name',
              labelStyle: const TextStyle(color: Colors.white70),
              hintText: 'e.g., Summer Brunch Look',
              hintStyle: const TextStyle(color: Colors.white38),
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Notes (Optional)',
              labelStyle: const TextStyle(color: Colors.white70),
              hintText: 'Additional details about this outfit...',
              hintStyle: const TextStyle(color: Colors.white38),
              filled: true,
              fillColor: AppTheme.mediumGray.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        Row(
          children: [
            const Text(
              'Style Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            if (_isGeneratingSuggestions) ...[
              const SizedBox(width: 8),
              const SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ],
            if (_suggestedCategories.isNotEmpty) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppTheme.pastelPink,
              ),
              const SizedBox(width: 4),
              const Text(
                'Smart suggestions',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.pastelPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        // Suggested categories section
        if (_suggestedCategories.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.pastelPink.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.pastelPink.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Suggested based on your items:',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.mediumGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: _suggestedCategories.map((category) {
                    final isSelected = _selectedCategories.contains(category);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedCategories.remove(category);
                          } else {
                            _selectedCategories.add(category);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.pastelPink : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.pastelPink,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isSelected ? Icons.check_circle : Icons.add_circle_outline,
                              size: 14,
                              color: isSelected ? Colors.white : AppTheme.pastelPink,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.white : AppTheme.pastelPink,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        // All categories
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _outfitCategories.map((category) {
            final isSelected = _selectedCategories.contains(category);
            final isSuggested = _suggestedCategories.contains(category);
            final baseColor = CategoryColors.getCategoryColor(category);
            return FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSuggested) ...[
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              selected: isSelected,
              selectedColor: baseColor,
              backgroundColor: baseColor.withValues(alpha: 0.9),
              side: BorderSide.none,
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
        Row(
          children: [
            const Text(
              'Season',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            if (_suggestedSeason != null) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppTheme.pastelPink,
              ),
              const SizedBox(width: 4),
              Text(
                'Suggested: ${_getSeasonLabel(_suggestedSeason!)}',
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
          runSpacing: 8,
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: _selectedSeason == null,
              selectedColor: AppTheme.darkerPink,
              backgroundColor: AppTheme.darkerPink.withValues(alpha: 0.9),
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              onSelected: (selected) {
                setState(() {
                  _selectedSeason = null;
                });
              },
            ),
            ...Season.values.map((season) {
              final isSelected = _selectedSeason == season;
              final isSuggested = _suggestedSeason == season;
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
          'Weather',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
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
                style: const TextStyle(color: Colors.white),
              ),
              selected: isSelected,
              selectedColor: _getWeatherColor(range),
              backgroundColor: _getWeatherColor(range).withValues(alpha: 0.9),
              side: BorderSide.none,
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
            color: Colors.white,
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
            color: Colors.white,
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
    
    // Generate smart suggestions when items change
    _generateSmartSuggestions();
  }

  void _removeItem(String itemId) {
    setState(() {
      _selectedItemIds.remove(itemId);
    });
    
    // Generate smart suggestions when items change
    _generateSmartSuggestions();
  }

  /// Generate smart suggestions based on selected items
  Future<void> _generateSmartSuggestions() async {
    if (_selectedItemIds.isEmpty) {
      setState(() {
        _suggestedCategories.clear();
        _suggestedSeason = null;
        _suggestedWeatherRanges.clear();
      });
      return;
    }

    setState(() {
      _isGeneratingSuggestions = true;
    });

    try {
      final suggestions = await Future.wait([
        _smartDefaultsService.suggestCategories(_selectedItemIds),
        _smartDefaultsService.suggestSeason(_selectedItemIds),
        _smartDefaultsService.suggestWeatherRanges(_selectedItemIds),
      ]);

      setState(() {
        _suggestedCategories = suggestions[0] as List<String>;
        _suggestedSeason = suggestions[1] as Season?;
        _suggestedWeatherRanges = suggestions[2] as List<WeatherRange>;
        _isGeneratingSuggestions = false;
      });

      // Auto-apply suggestions if no manual selections have been made
      _autoApplySuggestions();
    } catch (e) {
      setState(() {
        _isGeneratingSuggestions = false;
      });
    }
  }

  /// Auto-apply suggestions if user hasn't made manual selections
  void _autoApplySuggestions() {
    // Auto-apply category suggestions
    if (_selectedCategories.isEmpty && _suggestedCategories.isNotEmpty) {
      setState(() {
        _selectedCategories.addAll(_suggestedCategories.take(2)); // Add top 2 suggestions
      });
    }

    // Auto-apply season suggestion
    if (_selectedSeason == null && _suggestedSeason != null) {
      setState(() {
        _selectedSeason = _suggestedSeason;
      });
    }

    // Auto-apply weather suggestions
    if (_selectedWeatherRanges.isEmpty && _suggestedWeatherRanges.isNotEmpty) {
      setState(() {
        _selectedWeatherRanges.addAll(_suggestedWeatherRanges);
      });
    }
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

  Color _getSeasonColor(Season season) {
    switch (season) {
      case Season.spring: return const Color(0xFF66BB6A);
      case Season.summer: return const Color(0xFFFFB74D);
      case Season.autumn: return const Color(0xFFFF7043);
      case Season.winter: return const Color(0xFF42A5F5);
      case Season.allSeason: return AppTheme.mediumGray;
    }
  }

  Color _getWeatherColor(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot: return const Color(0xFFFF5722);
      case WeatherRange.hot: return const Color(0xFFFF9800);
      case WeatherRange.warm: return const Color(0xFFFFC107);
      case WeatherRange.cool: return const Color(0xFF4CAF50);
      case WeatherRange.cold: return const Color(0xFF2196F3);
      case WeatherRange.veryCold: return const Color(0xFF3F51B5);
    }
  }
}