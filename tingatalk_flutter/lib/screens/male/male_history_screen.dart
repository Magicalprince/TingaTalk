import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';

class MaleHistoryScreen extends StatefulWidget {
  const MaleHistoryScreen({super.key});

  @override
  State<MaleHistoryScreen> createState() => _MaleHistoryScreenState();
}

class _MaleHistoryScreenState extends State<MaleHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> paymentHistory = [
    {
      'type': 'purchase',
      'amount': 499,
      'coins': 300,
      'date': '2024-01-15 14:30',
      'method': 'Google Pay',
      'status': 'completed',
      'transactionId': 'TXN123456789',
    },
    {
      'type': 'purchase',
      'amount': 199,
      'coins': 110,
      'date': '2024-01-10 09:15',
      'method': 'HDFC Bank',
      'status': 'completed',
      'transactionId': 'TXN123456788',
    },
    {
      'type': 'purchase',
      'amount': 99,
      'coins': 50,
      'date': '2024-01-05 16:45',
      'method': 'Google Pay',
      'status': 'completed',
      'transactionId': 'TXN123456787',
    },
  ];

  final List<Map<String, dynamic>> voiceCallHistory = [
    {
      'name': 'Priya Sharma',
      'image': 'assets/images/user1.jpg',
      'duration': '12:34',
      'coins': 13,
      'date': '2024-01-15 20:30',
      'rating': 5,
      'status': 'completed',
    },
    {
      'name': 'Ananya Gupta',
      'image': 'assets/images/user2.jpg',
      'duration': '08:15',
      'coins': 9,
      'date': '2024-01-14 18:45',
      'rating': 4,
      'status': 'completed',
    },
    {
      'name': 'Kavya Patel',
      'image': 'assets/images/user3.jpg',
      'duration': '15:22',
      'coins': 16,
      'date': '2024-01-13 21:15',
      'rating': 5,
      'status': 'completed',
    },
    {
      'name': 'Riya Singh',
      'image': 'assets/images/user4.jpg',
      'duration': '06:45',
      'coins': 7,
      'date': '2024-01-12 19:30',
      'rating': 4,
      'status': 'completed',
    },
  ];

  final List<Map<String, dynamic>> videoCallHistory = [
    {
      'name': 'Meera Joshi',
      'image': 'assets/images/user5.jpg',
      'duration': '18:45',
      'coins': 19,
      'date': '2024-01-15 22:00',
      'rating': 5,
      'status': 'completed',
    },
    {
      'name': 'Sanya Kapoor',
      'image': 'assets/images/user6.jpg',
      'duration': '11:30',
      'coins': 12,
      'date': '2024-01-14 20:15',
      'rating': 4,
      'status': 'completed',
    },
    {
      'name': 'Priya Sharma',
      'image': 'assets/images/user1.jpg',
      'duration': '25:15',
      'coins': 26,
      'date': '2024-01-13 19:45',
      'rating': 5,
      'status': 'completed',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              
              // Tab Bar
              _buildTabBar(),
              
              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPaymentHistoryTab(),
                    _buildVoiceCallHistoryTab(),
                    _buildVideoCallHistoryTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                  'History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'View your activity and transactions',
                  style: TextStyle(
                    fontSize: 14,
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

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(4),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.secondaryText,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        tabs: const [
          Tab(text: 'Payments'),
          Tab(text: 'Voice Calls'),
          Tab(text: 'Video Calls'),
        ],
      ),
    );
  }

  Widget _buildPaymentHistoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: paymentHistory.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildPaymentHistoryCard(paymentHistory[index]),
        );
      },
    );
  }

  Widget _buildVoiceCallHistoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: voiceCallHistory.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildCallHistoryCard(voiceCallHistory[index], isVideo: false),
        );
      },
    );
  }

  Widget _buildVideoCallHistoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: videoCallHistory.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildCallHistoryCard(videoCallHistory[index], isVideo: true),
        );
      },
    );
  }

  Widget _buildPaymentHistoryCard(Map<String, dynamic> payment) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.success,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Coin Purchase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'via ${payment['method']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+${payment['coins']} coins',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.success,
                    ),
                  ),
                  Text(
                    '₹${payment['amount']}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction ID',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      payment['transactionId'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date & Time',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      payment['date'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
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

  Widget _buildCallHistoryCard(Map<String, dynamic> call, {required bool isVideo}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
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
                        Expanded(
                          child: Text(
                            call['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Icon(
                          isVideo ? Icons.videocam : Icons.call,
                          color: AppColors.accent,
                          size: 16,
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.secondaryText,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          call['duration'],
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/images/coin.png',
                          width: 14,
                          height: 14,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                              size: 14,
                            );
                          },
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${call['coins']} coins',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Rating
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < call['rating'] ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${call['rating']}/5',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Call Info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Time',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      call['date'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Call Type',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isVideo ? 'Video' : 'Voice',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Call again
                    Navigator.pushNamed(
                      context, 
                      isVideo ? '/video-call' : '/voice-call',
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isVideo ? Icons.videocam : Icons.call,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Call Again',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 12),
              
              GestureDetector(
                onTap: () {
                  // View profile
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppColors.accent,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}