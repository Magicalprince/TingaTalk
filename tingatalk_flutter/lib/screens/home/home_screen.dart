import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF6B9D), // Lighter bright pink - matches reference
              Color(0xFFE91E63), // Bright pink
              Color(0xFFAD1457), // Medium pink
              Color(0xFF8E24AA), // Purple pink  
              Color(0xFF673AB7), // Deep purple
            ],
            stops: [0.0, 0.3, 0.6, 0.8, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // SUBTLE NEON GRADIENT OVERLAY - Lighter like reference
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.0, -0.4),
                    radius: 1.8,
                    colors: [
                      // Much lighter neon center - matches reference brightness
                      Colors.white.withValues(alpha: 0.15),
                      AppColors.accent.withValues(alpha: 0.25),
                      AppColors.primaryBackground.withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            
            SafeArea(
              child: Column(
                children: [
                  // Modern header - matches reference design
                  _buildModernHeader(),
                  
                  // Main content with proper padding
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Quick connect cards - like reference
                          _buildQuickConnectCards(),
                          
                          const SizedBox(height: 24),
                          
                          // Daily wellness section - modern design
                          _buildModernWellnessSection(),
                          
                          const SizedBox(height: 24),
                          
                          // Recent connections - matches reference
                          _buildModernRecentConnections(),
                          
                          const SizedBox(height: 100), // Space for bottom nav
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildModernBottomNavigation(),
    );
  }

  Widget _buildModernHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          // iPhone-themed profile avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20), // Perfect circle
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 22,
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Greeting text - matches reference style
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, Friend',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          
          // iPhone-themed notification icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20), // Perfect circle
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickConnectCards() {
    return Row(
      children: [
        Expanded(
          child: _buildModernActionCard(
            title: 'Video\nsupport',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildModernActionCard(
            title: 'Anonymous\nchat',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildModernActionCard({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2), // More visible like iPhone
          borderRadius: BorderRadius.circular(24), // More iPhone-like rounded corners
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.4),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildModernWellnessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Wellness',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2), // More visible
            borderRadius: BorderRadius.circular(20), // iPhone-style rounded corners
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(25), // Perfect circle
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mood Check-in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Track your emotional journey',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModernRecentConnections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Connections',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18), // More visible
                borderRadius: BorderRadius.circular(18), // iPhone-style rounded corners
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.35),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.06),
                    blurRadius: 6,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4081), // Bright pink like reference
                      borderRadius: BorderRadius.circular(20), // Perfect circle
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF4081).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anonymous Friend ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Last conversation: ${index + 1}h ago',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildModernBottomNavigation() {
    return Container(
      height: 85, // iPhone-like height with proper padding
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4), // More iPhone-like
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.15),
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(25), // iPhone-style pill shape
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildModernNavItem(Icons.home_filled, 'Home', 0),
              _buildModernNavItem(Icons.chat_bubble, 'Chats', 1),
              _buildModernNavItem(Icons.people, 'Connect', 2),
              _buildModernNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16), // iPhone-style selection
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}