import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/user_feedback.dart';
import '../../core/services/ml_feedback_service.dart';

class FeedbackButton extends StatefulWidget {
  final String? outfitId;
  final String? itemId;
  final FeedbackContext context;
  final VoidCallback? onFeedbackGiven;
  final bool showLabel;

  const FeedbackButton({
    super.key,
    this.outfitId,
    this.itemId,
    required this.context,
    this.onFeedbackGiven,
    this.showLabel = true,
  });

  @override
  State<FeedbackButton> createState() => _FeedbackButtonState();
}

class _FeedbackButtonState extends State<FeedbackButton> {
  final MLFeedbackService _feedbackService = MLFeedbackService();
  FeedbackType? _currentFeedback;
  bool _isLoading = false;

  Future<void> _giveFeedback(FeedbackType type) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _feedbackService.recordFeedback(
        type: type,
        context: widget.context,
        outfitId: widget.outfitId,
        itemId: widget.itemId,
      );

      setState(() {
        _currentFeedback = type;
      });

      widget.onFeedbackGiven?.call();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getFeedbackMessage(type)),
            duration: const Duration(seconds: 2),
            backgroundColor: type == FeedbackType.like || type == FeedbackType.love
                ? Colors.green
                : type == FeedbackType.dislike
                    ? Colors.red
                    : Colors.blue,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to record feedback: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _getFeedbackMessage(FeedbackType type) {
    switch (type) {
      case FeedbackType.love:
        return 'Love it! 💕 This will help us learn your style';
      case FeedbackType.like:
        return 'Liked! 👍 We\'ll recommend similar items';
      case FeedbackType.dislike:
        return 'Got it 👎 We\'ll avoid similar suggestions';
      case FeedbackType.worn:
        return 'Great choice! 👔 Marked as worn';
      case FeedbackType.skipped:
        return 'Skipped ⏭️ We\'ll note your preference';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFeedbackIconButton(
          icon: Icons.favorite_border,
          selectedIcon: Icons.favorite,
          type: FeedbackType.love,
          color: Colors.red,
          tooltip: 'Love it',
        ),
        SizedBox(width: 8.w),
        _buildFeedbackIconButton(
          icon: Icons.thumb_up_outlined,
          selectedIcon: Icons.thumb_up,
          type: FeedbackType.like,
          color: Colors.green,
          tooltip: 'Like it',
        ),
        SizedBox(width: 8.w),
        _buildFeedbackIconButton(
          icon: Icons.thumb_down_outlined,
          selectedIcon: Icons.thumb_down,
          type: FeedbackType.dislike,
          color: Colors.orange,
          tooltip: 'Don\'t like it',
        ),
        if (widget.showLabel) ...[
          SizedBox(width: 12.w),
          Text(
            'Help us learn your style',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFeedbackIconButton({
    required IconData icon,
    required IconData selectedIcon,
    required FeedbackType type,
    required Color color,
    required String tooltip,
  }) {
    final isSelected = _currentFeedback == type;
    
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: _isLoading ? null : () => _giveFeedback(type),
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? color.withValues(alpha: 0.2) : Colors.transparent,
            border: isSelected 
                ? Border.all(color: color, width: 2)
                : Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
          child: _isLoading && _currentFeedback == type
              ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                )
              : Icon(
                  isSelected ? selectedIcon : icon,
                  size: 16.sp,
                  color: isSelected ? color : Colors.grey[600],
                ),
        ),
      ),
    );
  }
}

class QuickFeedbackDialog extends StatelessWidget {
  final String? outfitId;
  final String? itemId;
  final FeedbackContext context;
  final VoidCallback? onComplete;

  const QuickFeedbackDialog({
    super.key,
    this.outfitId,
    this.itemId,
    required this.context,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How do you like this?'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(
            'Your feedback helps us learn your style and make better recommendations.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildQuickFeedbackButton(
                context,
                'Love it! 💕',
                FeedbackType.love,
                Colors.red,
              ),
              _buildQuickFeedbackButton(
                context,
                'Like it 👍',
                FeedbackType.like,
                Colors.green,
              ),
              _buildQuickFeedbackButton(
                context,
                'Not for me 👎',
                FeedbackType.dislike,
                Colors.orange,
              ),
            ],
          ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Skip'),
        ),
      ],
    );
  }

  Widget _buildQuickFeedbackButton(
    BuildContext context,
    String label,
    FeedbackType type,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final feedbackService = MLFeedbackService();
          await feedbackService.recordFeedback(
            type: type,
            context: this.context,
            outfitId: outfitId,
            itemId: itemId,
          );
          
          Navigator.of(context).pop();
          onComplete?.call();
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Thanks for your feedback! 🎉'),
              backgroundColor: color,
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to record feedback'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.1),
        foregroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}