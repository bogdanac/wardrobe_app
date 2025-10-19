import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/category_constants.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_style_provider.dart';
import '../widgets/clothing_item_card.dart';
import '../../core/services/smart_defaults_service.dart';
import '../widgets/minimalist_clothing_item_filters.dart';
import '../widgets/cached_image_widget.dart';
import '../widgets/maximalist_outfit_filters.dart';

class CreateOutfitScreen extends ConsumerStatefulWidget {
  final Outfit? outfit;
  final List<String>? initialSelectedItemIds;
  final bool isCreatingVariant; // True if creating a variant of an existing outfit

  const CreateOutfitScreen({
    super.key,
    this.outfit,
    this.initialSelectedItemIds,
    this.isCreatingVariant = false,
  });

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
  List<String> _selectedOutfitStyles = [];
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
  List<String> _suggestedOutfitStyles = [];
  Season? _suggestedSeason;
  List<WeatherRange> _suggestedWeatherRanges = [];
  bool _isGeneratingSuggestions = false;

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
    _selectedOutfitStyles = List.from(outfit.outfitStyles);
    _selectedSeason = outfit.seasons.isNotEmpty ? outfit.seasons.first : null;
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
        title: Text(
          widget.isCreatingVariant
              ? 'Create Variant'
              : (widget.outfit == null ? 'Create Outfit' : 'Edit Outfit')
        ),
        actions: [
          if (widget.outfit != null && !widget.isCreatingVariant)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'create_variant') {
                  _createVariant();
                } else if (value == 'delete') {
                  _deleteOutfit();
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'create_variant',
                  child: Row(
                    children: [
                      Icon(Icons.content_copy, size: 20),
                      SizedBox(width: 8),
                      Text('Create Variant'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text('Delete', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.outfit != null && widget.isCreatingVariant)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
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
                                        child: CachedImageWidget(
                                          imagePath: item.imagePath,
                                          fit: BoxFit.contain,
                                          borderRadius: BorderRadius.circular(12),
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
          child: MinimalistClothingItemFilters(
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
          if (_filterSeason != null && !item.seasons.contains(_filterSeason)) {
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
          _buildCategorySelector(),
          const SizedBox(height: 24),
          MaximalistOutfitFilters(
            selectedSeason: _selectedSeason,
            selectedWeatherRanges: _selectedWeatherRanges,
            onSeasonChanged: (season) {
              setState(() {
                _selectedSeason = season;
              });
            },
            onWeatherRangesChanged: (ranges) {
              setState(() {
                _selectedWeatherRanges = ranges;
              });
            },
            suggestedSeason: _suggestedSeason,
            isDarkMode: true,
          ),
          const SizedBox(height: 24),
          _buildFavoriteToggle(),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Outfit Name (Optional)',
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
          ),
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
    final outfitStylesAsync = ref.watch(allOutfitStylesProvider);

    return outfitStylesAsync.when(
      data: (outfitStyles) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Outfit Styles',
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
                if (_suggestedOutfitStyles.isNotEmpty) ...[
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
            const SizedBox(height: 12),
            // Suggested styles section
            if (_suggestedOutfitStyles.isNotEmpty) ...[
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
                      runSpacing: 4,
                      children: _suggestedOutfitStyles.map((styleName) {
                        final isSelected = _selectedOutfitStyles.contains(styleName);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedOutfitStyles.remove(styleName);
                              } else {
                                _selectedOutfitStyles.add(styleName);
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
                                  styleName,
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
            // All outfit styles
            if (outfitStyles.isEmpty)
              const Text(
                'No outfit styles yet. Add some in Settings.',
                style: TextStyle(color: AppTheme.mediumGray),
              )
            else
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: outfitStyles.map((style) {
                  final isSelected = _selectedOutfitStyles.contains(style.name);
                  final isSuggested = _suggestedOutfitStyles.contains(style.name);
                  final description = style.description ?? DefaultOutfitStyles.getDescription(style.name);
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isSuggested) ...[
                              const Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 3),
                            ],
                            Icon(
                              style.icon ?? Icons.style,
                              size: 12,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              style.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                        selected: isSelected,
                        selectedColor: style.color,
                        backgroundColor: style.color.withValues(alpha: 0.9),
                        side: BorderSide.none,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedOutfitStyles.add(style.name);
                            } else {
                              _selectedOutfitStyles.remove(style.name);
                            }
                          });
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
                                size: 14,
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
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading outfit styles: $error'),
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
        const SizedBox(height: 12),
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
                        return CachedImageWidget(
                          imagePath: item?.imagePath,
                          fit: BoxFit.contain,
                          borderRadius: BorderRadius.circular(8),
                        );
                      },
                      loading: () => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.lightGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      error: (error, stack) => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.lightGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.error_outline,
                          color: AppTheme.mediumGray,
                        ),
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
        _suggestedOutfitStyles.clear();
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
        _suggestedOutfitStyles = suggestions[0] as List<String>;
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
    // Auto-apply outfit style suggestions
    if (_selectedOutfitStyles.isEmpty && _suggestedOutfitStyles.isNotEmpty) {
      setState(() {
        _selectedOutfitStyles.addAll(_suggestedOutfitStyles.take(2)); // Add top 2 suggestions
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
      // Generate default name if not provided
      String outfitName = _nameController.text.trim();
      if (outfitName.isEmpty) {
        // Create name based on outfit styles or date
        if (_selectedOutfitStyles.isNotEmpty) {
          outfitName = '${_selectedOutfitStyles.first.replaceFirst(
            _selectedOutfitStyles.first[0],
            _selectedOutfitStyles.first[0].toUpperCase(),
          )} Outfit';
        } else {
          // Default to date-based name
          final now = DateTime.now();
          outfitName = 'Outfit ${now.month}/${now.day}';
        }
      }

      // Determine parentOutfitId based on whether this is a variant
      String? parentOutfitId;
      if (widget.isCreatingVariant && widget.outfit != null) {
        // If creating a variant, the parent is either the outfit's parent or the outfit itself
        parentOutfitId = widget.outfit!.parentOutfitId ?? widget.outfit!.id;
      } else if (widget.outfit != null && !widget.isCreatingVariant) {
        // If editing, keep existing parentOutfitId
        parentOutfitId = widget.outfit!.parentOutfitId;
      }

      final outfit = Outfit(
        id: (widget.outfit != null && !widget.isCreatingVariant) ? widget.outfit!.id : _uuid.v4(),
        name: outfitName,
        clothingItemIds: _selectedItemIds,
        categories: widget.outfit?.categories ?? [], // Keep old categories for backward compatibility
        outfitStyles: _selectedOutfitStyles,
        seasons: _selectedSeason != null ? [_selectedSeason!] : [],
        weatherRanges: _selectedWeatherRanges,
        wearCount: widget.outfit?.wearCount ?? 0,
        lastWornDate: widget.outfit?.lastWornDate,
        createdAt: (widget.outfit != null && !widget.isCreatingVariant) ? widget.outfit!.createdAt : DateTime.now(),
        updatedAt: DateTime.now(),
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isFavorite: _isFavorite,
        parentOutfitId: parentOutfitId,
        variantCount: widget.outfit?.variantCount ?? 0,
      );

      final repository = ref.read(outfitRepositoryProvider);
      if (widget.outfit == null || widget.isCreatingVariant) {
        await repository.saveOutfit(outfit);

        // If creating a variant, update parent's variant count
        if (widget.isCreatingVariant && parentOutfitId != null) {
          final variants = await repository.getOutfitVariants(parentOutfitId);
          await repository.updateVariantCount(parentOutfitId, variants.length);
        }
      } else {
        await repository.updateOutfit(outfit);
      }

      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
      if (parentOutfitId != null) {
        ref.invalidate(outfitVariantsProvider(parentOutfitId));
      }

      if (mounted) {
        Navigator.pop(context);
        String message;
        if (widget.isCreatingVariant) {
          message = 'Variant created successfully!';
        } else if (widget.outfit == null) {
          message = 'Outfit created successfully!';
        } else {
          message = 'Outfit updated successfully!';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
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
  }

  void _createVariant() {
    if (widget.outfit == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateOutfitScreen(
          outfit: widget.outfit,
          isCreatingVariant: true,
        ),
      ),
    );
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
        if (mounted) {
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
  }

}