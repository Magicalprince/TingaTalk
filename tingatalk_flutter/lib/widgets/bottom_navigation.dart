import 'package:flutter/material.dart';
import '../design_system/colors.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final String userType; // 'male' or 'female'

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryBackground.withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildNavItems(),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    if (userType == 'male') {
      return [
        _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
        _buildNavItem(1, Icons.search_outlined, Icons.search, 'Discover'),
        _buildNavItem(2, Icons.account_balance_wallet_outlined, Icons.account_balance_wallet, 'Wallet'),
        _buildNavItem(3, Icons.person_outline, Icons.person, 'Profile'),
      ];
    } else {
      return [
        _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
        _buildNavItem(1, Icons.trending_up_outlined, Icons.trending_up, 'Earnings'),
        _buildNavItem(2, Icons.person_outline, Icons.person, 'Profile'),
      ];
    }
  }

  Widget _buildNavItem(int index, IconData outlinedIcon, IconData filledIcon, String label) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.accent.withValues(alpha: 0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSelected ? filledIcon : outlinedIcon,
                color: isSelected ? AppColors.accent : Colors.white.withValues(alpha: 0.6),
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.accent : Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}