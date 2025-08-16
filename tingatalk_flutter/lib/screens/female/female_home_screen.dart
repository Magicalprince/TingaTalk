import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';
import '../../widgets/bottom_navigation.dart';

class FemaleHomeScreen extends StatefulWidget {
  const FemaleHomeScreen({super.key});

  @override
  State<FemaleHomeScreen> createState() => _FemaleHomeScreenState();
}

class _FemaleHomeScreenState extends State<FemaleHomeScreen> {
  int _currentIndex = 0;
  bool _isAvailable = true;
  double _totalEarnings = 12450.0;
  double _todayEarnings = 850.0;
  int _currentRanking = 12;
  int _totalCalls = 156;

  final List<Map<String, dynamic>> incomingCalls = [
    {
      'name': 'Rahul',
      'image': 'assets/images/male1.jpg',
      'callType': 'video',
      'timeAgo': '2 min ago',
      'isActive': true,
    },
    {
      'name': 'Arjun',
      'image': 'assets/images/male2.jpg',
      'callType': 'voice',
      'timeAgo': '5 min ago',
      'isActive': true,
    },
    {
      'name': 'Vikram',
      'image': 'assets/images/male3.jpg',
      'callType': 'video',
      'timeAgo': '8 min ago',
      'isActive': false,
    },
  ];

  final List<Map<String, dynamic>> recentEarnings = [
    {
      'amount': 125.0,
      'duration': '12:30',
      'callType': 'video',
      'time': '2 hours ago',
    },
    {
      'amount': 85.0,
      'duration': '8:30',
      'callType': 'voice',
      'time': '4 hours ago',
    },
    {
      'amount': 200.0,
      'duration': '20:00',
      'callType': 'video',
      'time': '6 hours ago',
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
                      
                      // Welcome message with romantic touch
                      const Text(
                        'Hello Beautiful!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dancing Script',
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      Text(
                        'Share your time and brighten someone\'s day 💖',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Availability Toggle
                      _buildAvailabilityToggle(),
                      
                      const SizedBox(height: 32),
                      
                      // Earnings Summary
                      _buildEarningsSummary(),
                      
                      const SizedBox(height: 32),
                      
                      // Incoming Calls Section
                      _buildSectionHeader('Incoming Calls', 'View All'),
                      
                      const SizedBox(height: 16),
                      
                      _buildIncomingCalls(),
                      
                      const SizedBox(height: 32),
                      
                      // Recent Activity
                      _buildSectionHeader('Recent Activity', ''),
                      
                      const SizedBox(height: 16),
                      
                      _buildRecentActivity(),
                      
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
        userType: 'female',
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
          
          // Status indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _isAvailable 
                  ? AppColors.success.withValues(alpha: 0.2)
                  : Colors.red.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isAvailable ? AppColors.success : Colors.red,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isAvailable ? AppColors.success : Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _isAvailable ? 'Available' : 'Offline',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _isAvailable ? AppColors.success : Colors.red,
                  ),
                ),
              ],
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

  Widget _buildAvailabilityToggle() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withValues(alpha: 0.3),
            AppColors.accentDark.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available for Calls',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Toggle to start receiving calls',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              
              // Toggle Switch
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isAvailable = !_isAvailable;
                  });
                  HapticFeedback.lightImpact();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 60,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _isAvailable ? AppColors.success : Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: _isAvailable ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 28,
                      height: 28,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          if (_isAvailable) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'You\'re now visible to users and can receive calls',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEarningsSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          const Text(
            'Earnings Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          
          const SizedBox(height: 20),
          
          Row(
            children: [
              Expanded(
                child: _buildEarningCard(
                  title: 'Total Earnings',
                  amount: '₹${_totalEarnings.toStringAsFixed(0)}',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildEarningCard(
                  title: 'Today\'s Earnings',
                  amount: '₹${_todayEarnings.toStringAsFixed(0)}',
                  icon: Icons.today,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildEarningCard(
                  title: 'Current Ranking',
                  amount: '#$_currentRanking',
                  icon: Icons.trending_up,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildEarningCard(
                  title: 'Total Calls',
                  amount: _totalCalls.toString(),
                  icon: Icons.call,
                  color: AppColors.accentLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarningCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
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
        if (actionText.isNotEmpty)
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

  Widget _buildIncomingCalls() {
    if (incomingCalls.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              Icons.call_received,
              color: AppColors.secondaryText,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No incoming calls',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Make sure you\'re available to receive calls',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: incomingCalls.map((call) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: _buildIncomingCallCard(call),
        );
      }).toList(),
    );
  }

  Widget _buildIncomingCallCard(Map<String, dynamic> call) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: call['isActive'] 
              ? AppColors.accent
              : Colors.white.withValues(alpha: 0.2),
          width: call['isActive'] ? 2 : 1,
        ),
        boxShadow: call['isActive'] ? [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ] : [],
      ),
      child: Row(
        children: [
          // Profile Image
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
                call['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.logoGradient,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        call['name'][0],
                        style: const TextStyle(
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
          
          // Call Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      call['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        call['callType'] == 'video' ? 'Video' : 'Voice',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  call['timeAgo'],
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          // Action Buttons
          if (call['isActive']) ...[
            GestureDetector(
              onTap: () {
                // Decline call
                setState(() {
                  call['isActive'] = false;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.call_end,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                // Accept call
                Navigator.pushNamed(
                  context,
                  call['callType'] == 'video' ? '/video-call' : '/voice-call',
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  call['callType'] == 'video' ? Icons.videocam : Icons.call,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      children: recentEarnings.map((earning) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: _buildActivityCard(earning),
        );
      }).toList(),
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> earning) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              earning['callType'] == 'video' ? Icons.videocam : Icons.call,
              color: AppColors.success,
              size: 20,
            ),
          ),
          
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${earning['callType'] == 'video' ? 'Video' : 'Voice'} Call',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${earning['duration']} • ${earning['time']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          Text(
            '+₹${earning['amount'].toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.success,
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
        Navigator.pushNamed(context, '/female-earnings');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}