import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/social_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/themes/typography.dart';
import '../widgets/shared_outfit_card.dart';
import '../providers/social_provider.dart';
// import 'outfit_details_screen.dart'; // Commented out until screen is created
// import 'user_profile_screen.dart'; // Commented out until screen is created

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  @override
  ConsumerState<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  
  CommunityFilters _filters = const CommunityFilters();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    
    // Load initial community feed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(communityFeedProvider.notifier).loadFeed();
    });

    // Setup infinite scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      // Load more content when near bottom
      ref.read(communityFeedProvider.notifier).loadMoreFeed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Community'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Discover'),
            Tab(text: 'Following'),
            Tab(text: 'Challenges'),
            Tab(text: 'Inspiration'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _showSearchDialog,
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: _showFiltersSheet,
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDiscoverTab(),
          _buildFollowingTab(),
          _buildChallengesTab(),
          _buildInspirationTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shareOutfit,
        tooltip: 'Share Outfit',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiscoverTab() {
    final feedState = ref.watch(communityFeedProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(communityFeedProvider.notifier).refreshFeed(_filters);
      },
      child: feedState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppTheme.mediumGray),
              const SizedBox(height: 16),
              Text(
                'Failed to load community feed',
                style: AppTypography.bodyLarge.copyWith(color: AppTheme.mediumGray),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.refresh(communityFeedProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (outfits) => outfits.isEmpty
            ? _buildEmptyState()
            : _buildOutfitFeed(outfits),
      ),
    );
  }

  Widget _buildFollowingTab() {
    final followingFeed = ref.watch(followingFeedProvider);

    return followingFeed.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading following feed: $error'),
      ),
      data: (outfits) => outfits.isEmpty
          ? _buildFollowingEmptyState()
          : _buildOutfitFeed(outfits),
    );
  }

  Widget _buildChallengesTab() {
    final challenges = ref.watch(activeChallengesProvider);

    return challenges.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading challenges: $error'),
      ),
      data: (challengeList) => _buildChallengesList(challengeList),
    );
  }

  Widget _buildInspirationTab() {
    final inspirations = ref.watch(styleInspirationsProvider);

    return inspirations.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading inspirations: $error'),
      ),
      data: (inspirationList) => _buildInspirationGrid(inspirationList),
    );
  }

  Widget _buildOutfitFeed(List<SharedOutfit> outfits) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= outfits.length) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SharedOutfitCard(
                    sharedOutfit: outfits[index],
                    onTap: () => _viewOutfitDetails(outfits[index]),
                    onLike: () => _likeOutfit(outfits[index]),
                    onComment: () => _commentOnOutfit(outfits[index]),
                    onUserTap: () => _viewUserProfile(outfits[index].sharedByUserId),
                  ),
                );
              },
              childCount: outfits.length,
            ),
          ),
        ),
        // Loading indicator for pagination
        SliverToBoxAdapter(
          child: Consumer(
            builder: (context, ref, child) {
              final isLoadingMore = ref.watch(communityFeedProvider.notifier).isLoadingMore;
              if (!isLoadingMore) return const SizedBox.shrink();
              
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.people_outline, size: 80, color: AppTheme.mediumGray),
          const SizedBox(height: 24),
          Text(
            'Welcome to the Community!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Discover amazing outfits shared by\nfashion enthusiasts around the world',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Text(
            'Be the first to share an outfit! 👗✨',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.pastelPink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite_outline, size: 80, color: AppTheme.mediumGray),
          const SizedBox(height: 24),
          const Text(
            'No Posts from Following',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Follow other users to see their\nlatest outfit posts here',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () => _tabController.animateTo(0),
            icon: const Icon(Icons.explore),
            label: const Text('Discover Users'),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesList(List<CommunityChallenge> challenges) {
    if (challenges.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events_outlined, size: 80, color: AppTheme.mediumGray),
            SizedBox(height: 24),
            Text(
              'No Active Challenges',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlack,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Check back soon for exciting\nstyling challenges!',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        final challenge = challenges[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (challenge.isFeatured)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.pastelPink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'FEATURED',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                Text(
                  challenge.title,
                  style: AppTypography.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  challenge.description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppTheme.mediumGray,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.people, size: 16, color: AppTheme.mediumGray),
                    const SizedBox(width: 4),
                    Text(
                      '${challenge.participantsCount} participants',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppTheme.mediumGray,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => _participateInChallenge(challenge),
                      child: const Text('Join Challenge'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInspirationGrid(List<StyleInspiration> inspirations) {
    if (inspirations.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lightbulb_outline, size: 80, color: AppTheme.mediumGray),
            SizedBox(height: 24),
            Text(
              'No Style Inspiration Yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlack,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Save inspiring looks and styles\nto reference later',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: inspirations.length,
      itemBuilder: (context, index) {
        final inspiration = inspirations[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (inspiration.imageUrl != null)
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      image: DecorationImage(
                        image: NetworkImage(inspiration.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  flex: 3,
                  child: Container(
                    color: AppTheme.lightGray,
                    child: const Center(
                      child: Icon(Icons.image, size: 40, color: AppTheme.mediumGray),
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inspiration.title,
                        style: AppTypography.labelLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (inspiration.tags.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 4,
                          children: inspiration.tags.take(2).map((tag) =>
                            Text(
                              '#$tag',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppTheme.pastelPink,
                              ),
                            ),
                          ).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Community'),
        content: TextField(
          onChanged: (value) => _searchQuery = value,
          decoration: const InputDecoration(
            hintText: 'Search outfits, users, tags...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _applySearch();
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showFiltersSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.mediumGray,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Filter Community',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      // Add filter options here
                      SwitchListTile(
                        title: const Text('Only Following'),
                        value: _filters.onlyFollowing,
                        onChanged: (value) {
                          setState(() {
                            _filters = _filters.copyWith(onlyFollowing: value);
                          });
                        },
                      ),
                      // More filter options...
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _filters = const CommunityFilters();
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Clear'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _applyFilters();
                      },
                      child: const Text('Apply'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applySearch() {
    _filters = _filters.copyWith(searchQuery: _searchQuery);
    ref.read(communityFeedProvider.notifier).refreshFeed(_filters);
  }

  void _applyFilters() {
    ref.read(communityFeedProvider.notifier).refreshFeed(_filters);
  }

  void _shareOutfit() {
    // Navigate to outfit selection screen for sharing
    Navigator.of(context).pushNamed('/share-outfit');
  }

  void _viewOutfitDetails(SharedOutfit sharedOutfit) {
    Navigator.of(context).pushNamed(
      '/outfit-details',
      arguments: sharedOutfit.outfitId,
    );
  }

  void _likeOutfit(SharedOutfit sharedOutfit) {
    ref.read(socialServiceProvider).likeOutfit(
      sharedOutfit.id.toString(),
      'current_user', // TODO: Get from auth
    );
  }

  void _commentOnOutfit(SharedOutfit sharedOutfit) {
    // Show comment dialog or navigate to comments screen
    Navigator.of(context).pushNamed(
      '/outfit-comments',
      arguments: sharedOutfit.id.toString(),
    );
  }

  void _viewUserProfile(String userId) {
    Navigator.of(context).pushNamed(
      '/user-profile',
      arguments: userId,
    );
  }

  void _participateInChallenge(CommunityChallenge challenge) {
    // Navigate to challenge participation screen
    Navigator.of(context).pushNamed(
      '/participate-challenge',
      arguments: challenge.id.toString(),
    );
  }
}

extension on CommunityFilters {
  CommunityFilters copyWith({
    List<String>? tags,
    Season? season,
    String? occasion,
    bool? onlyFollowing,
    String? searchQuery,
    SortBy? sortBy,
  }) {
    return CommunityFilters(
      tags: tags ?? this.tags,
      season: season ?? this.season,
      occasion: occasion ?? this.occasion,
      onlyFollowing: onlyFollowing ?? this.onlyFollowing,
      searchQuery: searchQuery ?? this.searchQuery,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}