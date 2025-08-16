import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';
import '../../widgets/bottom_navigation.dart';

class MaleMatchesScreen extends StatefulWidget {
  const MaleMatchesScreen({super.key});

  @override
  State<MaleMatchesScreen> createState() => _MaleMatchesScreenState();
}

class _MaleMatchesScreenState extends State<MaleMatchesScreen> {
  int _currentIndex = 1;
  String _selectedFilter = 'All';
  
  final List<String> filters = ['All', 'Online', 'New', 'Favorites'];
  
  final List<Map<String, dynamic>> femaleProfiles = [
    {
      'name': 'Priya Sharma',
      'age': 24,
      'image': 'assets/images/profile1.jpg',
      'isOnline': true,
      'isNew': false,
      'isFavorite': true,
      'rating': 4.8,
      'callsCompleted': 156,
      'bio': 'Love to chat about life, dreams, and everything in between ✨',
      'interests': ['Music', 'Travel', 'Books'],
    },
    {
      'name': 'Ananya Gupta',
      'age': 26,
      'image': 'assets/images/profile2.jpg',
      'isOnline': false,
      'isNew': true,
      'isFavorite': false,
      'rating': 4.9,
      'callsCompleted': 89,
      'bio': 'Here to spread positivity and good vibes 🌟',
      'interests': ['Yoga', 'Cooking', 'Art'],
    },
    {
      'name': 'Kavya Patel',
      'age': 23,
      'image': 'assets/images/profile3.jpg',
      'isOnline': true,
      'isNew': false,
      'isFavorite': false,
      'rating': 4.7,
      'callsCompleted': 203,
      'bio': 'Professional listener and conversation enthusiast 💫',
      'interests': ['Psychology', 'Movies', 'Dancing'],
    },
    {
      'name': 'Riya Singh',
      'age': 25,
      'image': 'assets/images/profile4.jpg',
      'isOnline': true,
      'isNew': true,
      'isFavorite': true,
      'rating': 5.0,
      'callsCompleted': 67,
      'bio': 'New here! Excited to meet amazing people 🎉',
      'interests': ['Fitness', 'Technology', 'Photography'],
    },
    {
      'name': 'Meera Joshi',
      'age': 27,
      'image': 'assets/images/profile5.jpg',
      'isOnline': false,
      'isNew': false,
      'isFavorite': false,
      'rating': 4.6,
      'callsCompleted': 312,
      'bio': 'Experienced in meaningful conversations 💝',
      'interests': ['Literature', 'Philosophy', 'Nature'],
    },
    {
      'name': 'Sanya Kapoor',
      'age': 22,
      'image': 'assets/images/profile6.jpg',
      'isOnline': true,
      'isNew': false,
      'isFavorite': false,
      'rating': 4.8,
      'callsCompleted': 145,
      'bio': 'Fun conversations and genuine connections 🌈',
      'interests': ['Gaming', 'Anime', 'Music Production'],
    },
  ];

  List<Map<String, dynamic>> get filteredProfiles {
    switch (_selectedFilter) {
      case 'Online':
        return femaleProfiles.where((profile) => profile['isOnline']).toList();
      case 'New':
        return femaleProfiles.where((profile) => profile['isNew']).toList();
      case 'Favorites':
        return femaleProfiles.where((profile) => profile['isFavorite']).toList();
      default:
        return femaleProfiles;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTheme.gradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Filters
              _buildFilters(),
              
              // Profiles Grid
              Expanded(
                child: _buildProfilesGrid(),
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

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.overlayMedium,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Love',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dancing Script',
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'Beautiful souls waiting to meet you 💕',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle search
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.overlayMedium,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = _selectedFilter == filter;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.accent
                    : Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected 
                      ? AppColors.accent
                      : Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.secondaryText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfilesGrid() {
    final profiles = filteredProfiles;
    
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return _buildProfileCard(profiles[index]);
        },
      ),
    );
  }

  Widget _buildProfileCard(Map<String, dynamic> profile) {
    return GestureDetector(
      onTap: () {
        _showProfileDetails(profile);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(8),
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
                        profile['image'],
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
                                profile['name'][0],
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
                    
                    // Status indicators
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Row(
                        children: [
                          if (profile['isOnline'])
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Online',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (profile['isNew'])
                            Container(
                              margin: EdgeInsets.only(left: profile['isOnline'] ? 4 : 0),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'New',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    
                    // Favorite icon
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            profile['isFavorite'] = !profile['isFavorite'];
                          });
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            profile['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                            color: profile['isFavorite'] ? Colors.red : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Profile Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${profile['name']}, ${profile['age']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${profile['rating']}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${profile['callsCompleted']} calls',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      profile['bio'],
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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

  void _showProfileDetails(Map<String, dynamic> profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProfileDetailsSheet(profile: profile),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/male-home');
        break;
      case 1:
        // Already on matches
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

class _ProfileDetailsSheet extends StatelessWidget {
  final Map<String, dynamic> profile;

  const _ProfileDetailsSheet({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradient,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Profile content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Profile image and basic info
                  Row(
                    children: [
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
                            profile['image'],
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
                                    profile['name'][0],
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
                      
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${profile['name']}, ${profile['age']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            
                            const SizedBox(height: 4),
                            
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${profile['rating']} (${profile['callsCompleted']} calls)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 8),
                            
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: profile['isOnline'] 
                                    ? AppColors.success.withValues(alpha: 0.2)
                                    : Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                profile['isOnline'] ? 'Online' : 'Offline',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: profile['isOnline'] ? AppColors.success : AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Bio
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          profile['bio'],
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Interests
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Interests',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (profile['interests'] as List<String>).map((interest) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.accent.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                interest,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.accent,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Call buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/voice-call');
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Voice Call',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/video-call');
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.videocam,
                                  color: Color(0xFF2F0939),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Video Call',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2F0939),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}