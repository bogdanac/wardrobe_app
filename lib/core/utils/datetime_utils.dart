class DateTimeUtils {
  static String getLastWornText(DateTime? date) {
    if (date == null) return 'Never worn';
    
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Worn today';
    } else if (difference.inDays == 1) {
      return 'Worn yesterday';
    } else if (difference.inDays < 7) {
      return 'Worn ${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return 'Worn $weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return 'Worn $months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return 'Worn $years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  static String getRelativeTimeText(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  static String formatWearFrequency(int wearCount, DateTime createdAt) {
    final daysSinceCreation = DateTime.now().difference(createdAt).inDays;
    if (daysSinceCreation < 7) {
      return '$wearCount times this week';
    } else if (daysSinceCreation < 30) {
      final weeksOwned = (daysSinceCreation / 7).ceil();
      final avgPerWeek = (wearCount / weeksOwned).toStringAsFixed(1);
      return '$avgPerWeek times/week avg';
    } else {
      final monthsOwned = (daysSinceCreation / 30).ceil();
      final avgPerMonth = (wearCount / monthsOwned).toStringAsFixed(1);
      return '$avgPerMonth times/month avg';
    }
  }

  static bool isRecentlyWorn(DateTime? lastWornDate, {int dayThreshold = 7}) {
    if (lastWornDate == null) return false;
    return DateTime.now().difference(lastWornDate).inDays <= dayThreshold;
  }
}