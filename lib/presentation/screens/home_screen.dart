import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'closet_screen.dart';
import 'outfits_screen.dart';
import 'generator_screen.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';
import '../providers/outfit_provider.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/shared_intent_service.dart';

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
              icon: const Icon(Icons.auto_awesome),
              onPressed: () => _showGenerateModal(context),
              tooltip: 'Generate Outfit',
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: _hasActiveFilters() ? AppTheme.pastelPink : null,
              ),
              onPressed: () {
                // This will trigger filter from OutfitsScreen
              },
            ),
          ] else ...[
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