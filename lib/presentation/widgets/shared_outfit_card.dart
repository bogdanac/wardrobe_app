import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/social_models.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../../core/themes/typography.dart';
import '../providers/outfit_provider.dart';
import '../providers/social_provider.dart';

class SharedOutfitCard extends ConsumerWidget {
  final SharedOutfit sharedOutfit;
  final VoidCallback? onTap;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final VoidCallback? onUserTap;

  const SharedOutfitCard({
    super.key,
    required this.sharedOutfit,
    this.onTap,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onUserTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outfitAsync = ref.watch(outfitByIdProvider(sharedOutfit.outfitId));
    final userProfileAsync = ref.watch(userProfileProvider(sharedOutfit.sharedByUserId));
    final isLikedAsync = ref.watch(isOutfitLikedProvider(sharedOutfit.id.toString()));

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onUserTap,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppTheme.lightGray,
                    backgroundImage: userProfileAsync.when(
                      data: (profile) => profile?.avatarPath != null
                          ? AssetImage(profile!.avatarPath!)
                          : null,
                      loading: () => null,
                      error: (_, __) => null,
                    ),
                    child: userProfileAsync.when(
                      data: (profile) => profile?.avatarPath == null
                          ? Text(
                              profile?.displayName?.substring(0, 1).toUpperCase() ??
                              profile?.username.substring(0, 1).toUpperCase() ?? 
                              '?',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.mediumGray,
                              ),
                            )
                          : null,
                      loading: () => const Icon(Icons.person, size: 16, color: AppTheme.mediumGray),
                      error: (_, __) => const Icon(Icons.person, size: 16, color: AppTheme.mediumGray),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: onUserTap,
                        child: Text(
                          userProfileAsync.when(
                            data: (profile) => profile?.displayName ?? profile?.username ?? 'Unknown User',
                            loading: () => 'Loading...',
                            error: (_, __) => 'Unknown User',
                          ),
                          style: AppTypography.labelMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        _formatTimeAgo(sharedOutfit.sharedAt),
                        style: AppTypography.bodySmall.copyWith(
                          color: AppTheme.mediumGray,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) => _handleMenuAction(context, value),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'share',
                      child: Row(
                        children: [
                          Icon(Icons.share, size: 18),
                          SizedBox(width: 8),
                          Text('Share'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'report',
                      child: Row(
                        children: [
                          Icon(Icons.flag, size: 18),
                          SizedBox(width: 8),
                          Text('Report'),
                        ],
                      ),
                    ),
                  ],
                  child: const Icon(Icons.more_vert, size: 18),
                ),
              ],
            ),
          ),

          // Outfit preview
          GestureDetector(
            onTap: onTap,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: outfitAsync.when(
                data: (outfit) => outfit != null
                    ? _buildOutfitPreview(outfit)
                    : Container(
                        color: AppTheme.lightGray,
                        child: const Center(
                          child: Text('Outfit not found'),
                        ),
                      ),
                loading: () => Container(
                  color: AppTheme.lightGray,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Container(
                  color: AppTheme.lightGray,
                  child: const Center(
                    child: Icon(Icons.error, color: AppTheme.mediumGray),
                  ),
                ),
              ),
            ),
          ),

          // Outfit info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sharedOutfit.title,
                  style: AppTypography.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (sharedOutfit.description != null && sharedOutfit.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    sharedOutfit.description!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppTheme.mediumGray,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (sharedOutfit.tags.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: sharedOutfit.tags.take(3).map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.pastelPink.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '#$tag',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppTheme.pastelPink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )).toList(),
                  ),
                ],
                const SizedBox(height: 12),
                
                // Action buttons
                Row(
                  children: [
                    GestureDetector(
                      onTap: onLike,
                      child: Row(
                        children: [
                          isLikedAsync.when(
                            data: (isLiked) => Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 20,
                              color: isLiked ? Colors.red : AppTheme.mediumGray,
                            ),
                            loading: () => const Icon(Icons.favorite_border, size: 20, color: AppTheme.mediumGray),
                            error: (_, __) => const Icon(Icons.favorite_border, size: 20, color: AppTheme.mediumGray),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${sharedOutfit.likesCount}',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: onComment,
                      child: Row(
                        children: [
                          const Icon(Icons.comment_outlined, size: 20, color: AppTheme.mediumGray),
                          const SizedBox(width: 4),
                          Text(
                            '${sharedOutfit.commentsCount}',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onShare ?? () => _shareOutfit(context),
                      child: const Icon(Icons.share_outlined, size: 20, color: AppTheme.mediumGray),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutfitPreview(Outfit outfit) {
    // Create a simple grid layout for outfit items
    return Container(
      padding: const EdgeInsets.all(8),
      child: outfit.clothingItemIds.isEmpty
          ? Container(
              color: AppTheme.lightGray,
              child: const Center(
                child: Icon(Icons.checkroom, size: 40, color: AppTheme.mediumGray),
              ),
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: outfit.clothingItemIds.length > 4 ? 3 : 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: outfit.clothingItemIds.length.clamp(0, 9), // Max 9 items
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.checkroom, color: AppTheme.mediumGray),
                  ),
                );
              },
            ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'share':
        _shareOutfit(context);
        break;
      case 'report':
        _reportOutfit(context);
        break;
    }
  }

  void _shareOutfit(BuildContext context) {
    // Implement external sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sharing outfit...')),
    );
  }

  void _reportOutfit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Outfit'),
        content: const Text('Are you sure you want to report this outfit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Outfit reported')),
              );
            },
            child: const Text('Report'),
          ),
        ],
      ),
    );
  }
}