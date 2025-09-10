import 'package:flutter/material.dart';
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
      decoration: const BoxDecoration(
        color: AppTheme.primaryBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Container(
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
            icon: Icons.shuffle_outlined,
            activeIcon: Icons.shuffle,
            label: 'Generate',
            index: 1,
          ),
          _buildNavItem(
            context,
            icon: Icons.palette_outlined,
            activeIcon: Icons.palette,
            label: 'Outfits',
            index: 2,
            isCenter: true,
          ),
          _buildNavItem(
            context,
            icon: Icons.bar_chart_outlined,
            activeIcon: Icons.bar_chart,
            label: 'Stats',
            index: 3,
          ),
          _buildNavItem(
            context,
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: 'Settings',
            index: 4,
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
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
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
                  color: AppTheme.primaryBlack,
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