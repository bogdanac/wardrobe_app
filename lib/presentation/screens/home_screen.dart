import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'closet_screen.dart';
import 'outfits_screen.dart';
import 'generator_screen.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';
import 'create_outfit_screen.dart';
import 'add_clothing_item_screen.dart';
import 'simple_bulk_add_screen.dart';
import '../providers/outfit_provider.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/shared_intent_service.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/utils/category_colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _screens = [
    const ClosetScreen(),
    const OutfitsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);

    // Add listener to rebuild when tab changes
    _tabController.addListener(() {
      setState(() {});
    });

    // Initialize shared intent listeners
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sharedIntentService = ref.read(sharedIntentServiceProvider);
      sharedIntentService.initializeSharedIntentListeners(context);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Clean up shared intent service
    final sharedIntentService = ref.read(sharedIntentServiceProvider);
    sharedIntentService.dispose();
    super.dispose();
  }

  void _showGenerateModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Generate Outfit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: GeneratorScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _hasActiveFilters() {
    final filter = ref.read(outfitFilterProvider);
    return filter.categories.isNotEmpty ||
        filter.season != null ||
        filter.weatherRanges.isNotEmpty ||
        filter.isFavorite != null;
  }

  void _showOutfitFiltersModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter Outfits',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            ref.read(outfitFilterProvider.notifier).clearFilters();
                          },
                          child: const Text('Clear All'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  children: [
                    _buildCategoryFilter(),
                    const SizedBox(height: 24),
                    _buildSeasonFilter(),
                    const SizedBox(height: 24),
                    _buildWeatherFilter(),
                    const SizedBox(height: 24),
                    _buildFavoriteFilter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final filter = ref.watch(outfitFilterProvider);
    final outfitCategories = [
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
          children: outfitCategories.map((category) {
            final isSelected = filter.categories.contains(category);
            final baseColor = CategoryColors.getCategoryColor(category);
            return FilterChip(
              label: Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
              selected: isSelected,
              selectedColor: baseColor,
              backgroundColor: baseColor.withValues(alpha: 0.9),
              side: BorderSide.none,
              onSelected: (selected) {
                final currentCategories = List<String>.from(filter.categories);
                if (selected) {
                  currentCategories.add(category);
                } else {
                  currentCategories.remove(category);
                }
                ref.read(outfitFilterProvider.notifier).updateCategories(currentCategories);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeasonFilter() {
    final filter = ref.watch(outfitFilterProvider);

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
              label: const Text('All', style: TextStyle(color: Colors.white)),
              selected: filter.season == null,
              selectedColor: AppTheme.darkerPink,
              backgroundColor: AppTheme.darkerPink.withValues(alpha: 0.9),
              side: BorderSide.none,
              onSelected: (selected) {
                ref.read(outfitFilterProvider.notifier).updateSeason(null);
              },
            ),
            ...Season.values.map((season) {
              final isSelected = filter.season == season;
              return ChoiceChip(
                label: Text(_getSeasonLabel(season), style: const TextStyle(color: Colors.white)),
                selected: isSelected,
                selectedColor: _getSeasonColor(season),
                backgroundColor: _getSeasonColor(season).withValues(alpha: 0.9),
                side: BorderSide.none,
                onSelected: (selected) {
                  ref.read(outfitFilterProvider.notifier).updateSeason(selected ? season : null);
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherFilter() {
    final filter = ref.watch(outfitFilterProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weather',
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
            final isSelected = filter.weatherRanges.contains(range);
            return FilterChip(
              label: Text(
                _getWeatherRangeLabel(range),
                style: const TextStyle(color: Colors.white),
              ),
              selected: isSelected,
              selectedColor: _getWeatherColor(range),
              backgroundColor: _getWeatherColor(range).withValues(alpha: 0.9),
              side: BorderSide.none,
              onSelected: (selected) {
                final currentRanges = List<WeatherRange>.from(filter.weatherRanges);
                if (selected) {
                  currentRanges.add(range);
                } else {
                  currentRanges.remove(range);
                }
                ref.read(outfitFilterProvider.notifier).updateWeatherRanges(currentRanges);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFavoriteFilter() {
    final filter = ref.watch(outfitFilterProvider);

    return Row(
      children: [
        const Text(
          'Favorites Only',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Switch(
          value: filter.isFavorite ?? false,
          onChanged: (value) {
            ref.read(outfitFilterProvider.notifier).updateFavoriteFilter(value ? true : null);
          },
          activeThumbColor: AppTheme.pastelPink,
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

  @override
  Widget build(BuildContext context) {
    final isOutfitsTab = _tabController.index == 1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          if (isOutfitsTab) ...[
            IconButton(
              icon: const Icon(Icons.auto_awesome, color: AppTheme.gold),
              onPressed: () => _showGenerateModal(context),
              tooltip: 'Generate Outfit',
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: _hasActiveFilters() ? AppTheme.pastelPink : AppTheme.mediumGray,
              ),
              onPressed: () => _showOutfitFiltersModal(context),
              tooltip: 'Filter Outfits',
            ),
            IconButton(
              icon: const Icon(Icons.add, color: AppTheme.pastelPink),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateOutfitScreen(),
                ),
              ),
              tooltip: 'Create Outfit',
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.photo_library, color: AppTheme.gold),
              tooltip: 'Bulk Add',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleBulkAddScreen(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: AppTheme.pastelPink),
              tooltip: 'Add Item',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddClothingItemScreen(),
                ),
              ),
            ),
          ],
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'stats') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatsScreen()),
                );
              } else if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'stats',
                child: Row(
                  children: [
                    Icon(Icons.bar_chart),
                    SizedBox(width: 8),
                    Text('Stats'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.lightGray.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.pastelPink,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.pastelPink.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: AppTheme.primaryBlack,
              unselectedLabelColor: AppTheme.mediumGray,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              tabs: const [
                Tab(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.checkroom_outlined, size: 20),
                      SizedBox(width: 8),
                      Text('Closet'),
                    ],
                  ),
                ),
                Tab(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.palette_outlined, size: 20),
                      SizedBox(width: 8),
                      Text('Outfits'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: _screens,
        ),
      ),
    );
  }
}