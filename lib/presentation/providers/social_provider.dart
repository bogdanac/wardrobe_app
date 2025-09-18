import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/social_models.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/services/social_service.dart';
import '../../data/repositories/social_repository_impl.dart';

// Repository Provider
final socialRepositoryProvider = Provider<SocialRepositoryImpl>((ref) {
  return SocialRepositoryImpl();
});

// Service Provider
final socialServiceProvider = Provider<SocialService>((ref) {
  final repository = ref.read(socialRepositoryProvider);
  return SocialService(repository);
});

// Community Feed Provider
class CommunityFeedNotifier extends StateNotifier<AsyncValue<List<SharedOutfit>>> {
  CommunityFeedNotifier(this._socialService) : super(const AsyncValue.loading());

  final SocialService _socialService;
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  CommunityFilters _currentFilters = const CommunityFilters();

  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadFeed() async {
    try {
      state = const AsyncValue.loading();
      final outfits = await _socialService.getCommunityFeed(
        filters: _currentFilters,
        page: 0,
        limit: 20,
      );
      _currentPage = 0;
      _hasMore = outfits.length == 20;
      state = AsyncValue.data(outfits);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refreshFeed(CommunityFilters filters) async {
    _currentFilters = filters;
    _currentPage = 0;
    _hasMore = true;
    await loadFeed();
  }

  Future<void> loadMoreFeed() async {
    if (!_hasMore || _isLoadingMore || state.isLoading) return;

    try {
      _isLoadingMore = true;
      _currentPage++;
      
      final newOutfits = await _socialService.getCommunityFeed(
        filters: _currentFilters,
        page: _currentPage,
        limit: 20,
      );

      state.whenData((currentOutfits) {
        final updatedOutfits = [...currentOutfits, ...newOutfits];
        _hasMore = newOutfits.length == 20;
        state = AsyncValue.data(updatedOutfits);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      _currentPage--; // Rollback page increment on error
    } finally {
      _isLoadingMore = false;
    }
  }
}

final communityFeedProvider = StateNotifierProvider<CommunityFeedNotifier, AsyncValue<List<SharedOutfit>>>((ref) {
  final socialService = ref.read(socialServiceProvider);
  return CommunityFeedNotifier(socialService);
});

// Following Feed Provider
final followingFeedProvider = FutureProvider<List<SharedOutfit>>((ref) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getCommunityFeed(
    userId: 'current_user', // TODO: Get from auth
    filters: const CommunityFilters(onlyFollowing: true),
  );
});

// User Profile Provider
final userProfileProvider = FutureProvider.family<UserProfile?, String>((ref, userId) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getUserProfile(userId);
});

// User's Shared Outfits Provider
final userSharedOutfitsProvider = FutureProvider.family<List<SharedOutfit>, String>((ref, userId) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getUserSharedOutfits(userId);
});

// Outfit Like Status Provider
final isOutfitLikedProvider = FutureProvider.family<bool, String>((ref, sharedOutfitId) async {
  try {
    final repository = ref.read(socialRepositoryProvider);
    final like = await repository.getUserLike(sharedOutfitId, 'current_user'); // TODO: Get from auth
    return like != null;
  } catch (e) {
    return false;
  }
});

// Active Challenges Provider
final activeChallengesProvider = FutureProvider<List<CommunityChallenge>>((ref) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getActiveChallenges();
});

// Style Inspirations Provider
final styleInspirationsProvider = FutureProvider<List<StyleInspiration>>((ref) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getStyleInspirations(
    userId: 'current_user', // TODO: Get from auth
  );
});

// Social Activities Provider
final socialActivitiesProvider = FutureProvider<List<SocialActivity>>((ref) async {
  final socialService = ref.read(socialServiceProvider);
  return socialService.getSocialActivities(
    userId: 'current_user', // TODO: Get from auth
  );
});

// Outfit Comments Provider
final outfitCommentsProvider = FutureProvider.family<List<OutfitComment>, String>((ref, sharedOutfitId) async {
  final repository = ref.read(socialRepositoryProvider);
  return repository.getOutfitComments(sharedOutfitId);
});

// User Following Status Provider
final isFollowingUserProvider = FutureProvider.family<bool, String>((ref, userId) async {
  try {
    final repository = ref.read(socialRepositoryProvider);
    final follow = await repository.getUserFollow('current_user', userId); // TODO: Get from auth
    return follow != null;
  } catch (e) {
    return false;
  }
});

// User Followers Provider
final userFollowersProvider = FutureProvider.family<List<UserProfile>, String>((ref, userId) async {
  final repository = ref.read(socialRepositoryProvider);
  return repository.getFollowers(userId);
});

// User Following Provider
final userFollowingProvider = FutureProvider.family<List<UserProfile>, String>((ref, userId) async {
  final repository = ref.read(socialRepositoryProvider);
  return repository.getFollowing(userId);
});

// Challenge Participants Provider
final challengeParticipantsProvider = FutureProvider.family<List<ChallengeParticipation>, String>((ref, challengeId) async {
  final repository = ref.read(socialRepositoryProvider);
  return repository.getChallengeParticipants(challengeId);
});

// Search Users Provider
final searchUsersProvider = FutureProvider.family<List<UserProfile>, String>((ref, query) async {
  if (query.isEmpty) return [];
  
  final repository = ref.read(socialRepositoryProvider);
  return repository.searchUsers(query);
});

// Social Sharing State Notifier
class SocialSharingNotifier extends StateNotifier<AsyncValue<String?>> {
  SocialSharingNotifier(this._socialService) : super(const AsyncValue.data(null));

  final SocialService _socialService;

  Future<void> shareOutfit(String outfitId, SocialShareOptions options) async {
    try {
      state = const AsyncValue.loading();
      
      // First get the outfit
      // final outfit = await _outfitRepository.getOutfitById(outfitId);
      // if (outfit == null) throw Exception('Outfit not found');
      
      // For now, create a dummy outfit
      final outfit = Outfit(
        id: outfitId,
        name: options.title,
        clothingItemIds: const [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      final sharedId = await _socialService.shareOutfitToSocial(outfit, options);
      state = AsyncValue.data(sharedId);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearSharing() {
    state = const AsyncValue.data(null);
  }
}

final socialSharingProvider = StateNotifierProvider<SocialSharingNotifier, AsyncValue<String?>>((ref) {
  final socialService = ref.read(socialServiceProvider);
  return SocialSharingNotifier(socialService);
});

// Like/Unlike Actions
class SocialActionsNotifier extends StateNotifier<Map<String, bool>> {
  SocialActionsNotifier(this._socialService) : super({});

  final SocialService _socialService;

  Future<void> toggleLike(String sharedOutfitId) async {
    try {
      await _socialService.likeOutfit(sharedOutfitId, 'current_user'); // TODO: Get from auth
      
      // Toggle local state
      state = {
        ...state,
        sharedOutfitId: !(state[sharedOutfitId] ?? false),
      };
    } catch (e) {
      // Handle error silently or show snackbar
    }
  }

  Future<void> followUser(String userId) async {
    try {
      await _socialService.followUser('current_user', userId); // TODO: Get from auth
    } catch (e) {
      // Handle error
    }
  }

  Future<void> commentOnOutfit(String sharedOutfitId, String comment) async {
    try {
      await _socialService.commentOnOutfit(
        sharedOutfitId,
        'current_user', // TODO: Get from auth
        comment,
      );
    } catch (e) {
      // Handle error
    }
  }
}

final socialActionsProvider = StateNotifierProvider<SocialActionsNotifier, Map<String, bool>>((ref) {
  final socialService = ref.read(socialServiceProvider);
  return SocialActionsNotifier(socialService);
});

// Style Inspiration Actions
class StyleInspirationNotifier extends StateNotifier<AsyncValue<List<StyleInspiration>>> {
  StyleInspirationNotifier(this._socialService) : super(const AsyncValue.loading());

  final SocialService _socialService;

  Future<void> loadInspirations({
    String? userId,
    List<String> tags = const [],
    Season? season,
  }) async {
    try {
      state = const AsyncValue.loading();
      final inspirations = await _socialService.getStyleInspirations(
        userId: userId,
        tags: tags,
        season: season,
      );
      state = AsyncValue.data(inspirations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> saveInspiration({
    required String title,
    String? description,
    String? imageUrl,
    String? sourceUrl,
    List<String> tags = const [],
    List<String> colors = const [],
    String? style,
    Season? season,
  }) async {
    try {
      await _socialService.saveStyleInspiration(
        userId: 'current_user', // TODO: Get from auth
        title: title,
        description: description,
        imageUrl: imageUrl,
        sourceUrl: sourceUrl,
        tags: tags,
        colors: colors,
        style: style,
        season: season,
      );
      
      // Reload inspirations
      await loadInspirations(userId: 'current_user');
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final styleInspirationNotifierProvider = StateNotifierProvider<StyleInspirationNotifier, AsyncValue<List<StyleInspiration>>>((ref) {
  final socialService = ref.read(socialServiceProvider);
  return StyleInspirationNotifier(socialService);
});

