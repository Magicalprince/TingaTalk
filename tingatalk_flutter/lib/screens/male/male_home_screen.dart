import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';
import '../../widgets/bottom_navigation.dart';

class MaleHomeScreen extends StatefulWidget {
  const MaleHomeScreen({super.key});

  @override
  State<MaleHomeScreen> createState() => _MaleHomeScreenState();
}

class _MaleHomeScreenState extends State<MaleHomeScreen> {
  int _currentIndex = 0;
  final PageController _recentCallsController = PageController(viewportFraction: 0.8);
  final PageController _favoritesController = PageController(viewportFraction: 0.6);

  // Mock data
  final List<Map<String, dynamic>> recentCalls = [
    {
      'name': 'Priya',
      'image': 'assets/images/user1.jpg',
      'serviceType': 'Video Call',
      'duration': '12 min',
      'lastCall': '2 hours ago',
    },
    {
      'name': 'Ananya',
      'image': 'assets/images/user2.jpg',
      'serviceType': 'Voice Call',
      'duration': '8 min',
      'lastCall': '1 day ago',
    },
    {
      'name': 'Kavya',
      'image': 'assets/images/user3.jpg',
      'serviceType': 'Video Call',
      'duration': '15 min',
      'lastCall': '3 days ago',
    },
  ];

  final List<Map<String, dynamic>> favoriteUsers = [
    {
      'name': 'Riya',
      'image': 'assets/images/fav1.jpg',
      'lastSpoke': '5 hours ago',
      'isOnline': true,
    },
    {
      'name': 'Meera',
      'image': 'assets/images/fav2.jpg',
      'lastSpoke': '1 day ago',
      'isOnline': false,
    },
    {
      'name': 'Sanya',
      'image': 'assets/images/fav3.jpg',
      'lastSpoke': '2 days ago',
      'isOnline': true,
    },
    {
      'name': 'Ishita',
      'image': 'assets/images/fav4.jpg',
      'lastSpoke': '1 week ago',
      'isOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTheme.gradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation Bar
              _buildTopNavigation(),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Modern header
                      Text(
                        'Home',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Recent section header
                      const SizedBox(height: 20),
                      
                      Text(
                        'Recent',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      const SizedBox(height: 16),
                      
                      // Modern Recent Call Card
                      _buildModernRecentCallCard(),
                      
                      const SizedBox(height: 32),
                      
                      const SizedBox(height: 32),
                      
                      // Favorites section
                      Text(
                        'Favourites',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      _buildModernFavoritesGrid(),
                      
                      const SizedBox(height: 32),
                      
                      const SizedBox(height: 32),
                      
                      // Suggested section
                      Text(
                        'Suggested',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      _buildSuggestedCard(),
                      
                      const SizedBox(height: 100), // Bottom padding for navigation
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _handleNavigation(index);
        },
        userType: 'male',
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // App Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentLight.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/logo3.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.logoGradient,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'T',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Modern Coin Balance
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/male-wallet'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.amber.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Notification Icon
          GestureDetector(
            onTap: () {
              // Handle notifications
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle action
          },
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentCallsCarousel() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _recentCallsController,
        itemCount: recentCalls.length,
        itemBuilder: (context, index) {
          final call = recentCalls[index];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: _buildRecentCallCard(call),
          );
        },
      ),
    );
  }

  Widget _buildRecentCallCard(Map<String, dynamic> call) {
    return GestureDetector(
      onTap: () {
        // Navigate to profile or initiate call
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: AppColors.logoGradient,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  call['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.logoGradient,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          call['name'][0],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Name
            Text(
              call['name'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 4),
            
            // Service Type
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                call['serviceType'],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Duration and Last Call
            Text(
              '${call['duration']} • ${call['lastCall']}',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesCarousel() {
    return SizedBox(
      height: 280,
      child: PageView.builder(
        controller: _favoritesController,
        itemCount: favoriteUsers.length,
        itemBuilder: (context, index) {
          final user = favoriteUsers[index];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: _buildFavoriteCard(user),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteCard(Map<String, dynamic> user) {
    return GestureDetector(
      onTap: () {
        // Navigate to profile
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Profile Image
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: AppColors.logoGradient,
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        user['image'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: AppColors.logoGradient,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                user['name'][0],
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (user['isOnline'])
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.success,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            
            // User Info
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      user['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Last spoke ${user['lastSpoke']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.search,
                title: 'Discover',
                subtitle: 'Find new connections',
                onTap: () => Navigator.pushNamed(context, '/male-matches'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                icon: Icons.history,
                title: 'History',
                subtitle: 'View past calls',
                onTap: () => Navigator.pushNamed(context, '/male-history'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: AppColors.accent,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Profile placeholder
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.image,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          const SizedBox(width: 16),
          
          // User details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '***Name***',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Video Calls - 21',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Voice Calls - 20',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                    const SizedBox(width: 8),
                    Text(
                      '9/10',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
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

  Widget _buildModernFavoritesGrid() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.2,
          mainAxisSpacing: 12,
        ),
        itemCount: favoriteUsers.length,
        itemBuilder: (context, index) {
          final user = favoriteUsers[index];
          return Container(
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: AppColors.logoGradient,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                user['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.logoGradient,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        user['name'][0],
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildModernRecentCallCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Profile image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: AppColors.logoGradient,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/user1.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.logoGradient,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Call details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '***Priya***',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Video call - 15 Mins',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '12/10/2020  01:20 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        Navigator.pushNamed(context, '/male-matches');
        break;
      case 2:
        Navigator.pushNamed(context, '/male-wallet');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}