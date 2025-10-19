import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'closet_screen.dart';
import 'outfits_screen.dart';
import 'generator_screen.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';
import 'create_outfit_screen.dart';
import 'add_clothing_item_screen.dart';
import 'simple_bulk_add_screen.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/shared_intent_service.dart';
import '../../core/utils/category_colors.dart';
import '../widgets/maximalist_outfit_filters.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _outfitCategories = [];

  final List<Widget> _screens = [
    const ClosetScreen(),
    const OutfitsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    // Add listener to rebuild when tab changes
    _tabController.addListener(() {
      setState(() {});
    });

    // Load categories
    _loadCategories();

    // Initialize shared intent listeners
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sharedIntentService = ref.read(sharedIntentServiceProvider);
      sharedIntentService.initializeSharedIntentListeners(context);
    });
  }

  Future<void> _loadCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCategories = prefs.getStringList('custom_style_categories');

    // Default categories if none are saved
    final defaultCategories = [
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

    if (mounted) {
      setState(() {
        _outfitCategories = savedCategories ?? defaultCategories;
      });
    }
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GeneratorScreen(),
        fullscreenDialog: true,
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
                child: Consumer(
                  builder: (context, ref, child) {
                    final filter = ref.watch(outfitFilterProvider);

                    return ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                      children: [
                        _buildCategoryFilter(),
                        const SizedBox(height: 24),
                        MaximalistOutfitFilters(
                          selectedSeason: filter.season,
                          selectedWeatherRanges: filter.weatherRanges,
                      onSeasonChanged: (season) {
                        ref.read(outfitFilterProvider.notifier).updateSeason(season);
                      },
                      onWeatherRangesChanged: (ranges) {
                        ref.read(outfitFilterProvider.notifier).updateWeatherRanges(ranges);
                      },
                    ),
                        const SizedBox(height: 24),
                        _buildFavoriteFilter(),
                      ],
                    );
                  },
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
          runSpacing: 4,
          children: _outfitCategories.map((category) {
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

  @override
  Widget build(BuildContext context) {
    final isOutfitsTab = _tabController.index == 1;
    final outfitFilter = ref.watch(outfitFilterProvider);
    final clothingFilter = ref.watch(clothingFilterProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: isDesktop,
        actions: [
          if (isOutfitsTab) ...[
            IconButton(
              icon: Icon(
                Icons.archive_outlined,
                color: outfitFilter.showArchived ? Colors.orange : AppTheme.mediumGray,
              ),
              onPressed: () {
                ref.read(outfitFilterProvider.notifier).updateShowArchived(!outfitFilter.showArchived);
              },
              tooltip: outfitFilter.showArchived ? 'Show Active Outfits' : 'Show Archived Outfits',
            ),
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
              icon: Icon(
                Icons.archive_outlined,
                color: clothingFilter.showArchived ? Colors.orange : AppTheme.mediumGray,
              ),
              onPressed: () {
                ref.read(clothingFilterProvider.notifier).updateShowArchived(!clothingFilter.showArchived);
              },
              tooltip: clothingFilter.showArchived ? 'Show Active Items' : 'Show Archived Items',
            ),
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
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 600 : double.infinity,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: isDesktop ? 32 : 16,
                vertical: 8,
              ),
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