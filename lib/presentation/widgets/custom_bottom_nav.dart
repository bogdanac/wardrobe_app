import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/themes/app_theme.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        height: 90,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context,
            icon: Icons.checkroom_outlined,
            activeIcon: Icons.checkroom,
            label: 'Closet',
            index: 0,
          ),
          _buildNavItem(
            context,
            icon: Icons.palette_outlined,
            activeIcon: Icons.palette,
            label: 'Outfits',
            index: 1,
            isCenter: true,
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    bool isCenter = false,
  }) {
    final isActive = currentIndex == index;

    return InkWell(
      onTap: () {
        // Add haptic feedback for better user experience
        HapticFeedback.lightImpact();
        onTap(index);
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 60,
          minHeight: 60,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCenter)
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.gold : AppTheme.pastelPink,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.pastelPink.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  isActive ? activeIcon : icon,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 28,
                ),
              )
            else
              Icon(
                isActive ? activeIcon : icon,
                color: isActive ? AppTheme.primaryWhite : AppTheme.mediumGray,
                size: 28,
              ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? AppTheme.primaryWhite : AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}