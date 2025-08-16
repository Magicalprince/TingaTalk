import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';
import '../../widgets/bottom_navigation.dart';

class MaleWalletScreen extends StatefulWidget {
  const MaleWalletScreen({super.key});

  @override
  State<MaleWalletScreen> createState() => _MaleWalletScreenState();
}

class _MaleWalletScreenState extends State<MaleWalletScreen> {
  int _currentIndex = 2;
  int _currentBalance = 250;
  
  final List<Map<String, dynamic>> coinPackages = [
    {
      'coins': 50,
      'price': 99,
      'bonus': 0,
      'popular': false,
    },
    {
      'coins': 100,
      'price': 199,
      'bonus': 10,
      'popular': false,
    },
    {
      'coins': 250,
      'price': 499,
      'bonus': 50,
      'popular': true,
    },
    {
      'coins': 500,
      'price': 999,
      'bonus': 150,
      'popular': false,
    },
    {
      'coins': 1000,
      'price': 1999,
      'bonus': 400,
      'popular': false,
    },
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'type': 'UPI',
      'name': 'Google Pay',
      'identifier': 'user@oksbi',
      'icon': Icons.account_balance_wallet,
      'isDefault': true,
    },
    {
      'type': 'Card',
      'name': 'HDFC Bank',
      'identifier': '**** 1234',
      'icon': Icons.credit_card,
      'isDefault': false,
    },
  ];

  final List<Map<String, dynamic>> purchaseHistory = [
    {
      'type': 'purchase',
      'amount': 250,
      'coins': 250,
      'date': '2024-01-15',
      'method': 'Google Pay',
      'status': 'completed',
    },
    {
      'type': 'usage',
      'amount': -15,
      'coins': 15,
      'date': '2024-01-14',
      'description': 'Video call with Priya',
      'duration': '12 min',
    },
    {
      'type': 'usage',
      'amount': -8,
      'coins': 8,
      'date': '2024-01-13',
      'description': 'Voice call with Ananya',
      'duration': '8 min',
    },
    {
      'type': 'purchase',
      'amount': 100,
      'coins': 100,
      'date': '2024-01-10',
      'method': 'HDFC Bank',
      'status': 'completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTheme.gradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Wallet Balance Card
                      _buildWalletBalanceCard(),
                      
                      const SizedBox(height: 32),
                      
                      // Coin Packages Section
                      _buildSectionHeader('Buy Coins'),
                      
                      const SizedBox(height: 16),
                      
                      _buildCoinPackages(),
                      
                      const SizedBox(height: 32),
                      
                      // Payment Methods Section
                      _buildSectionHeader('Payment Methods'),
                      
                      const SizedBox(height: 16),
                      
                      _buildPaymentMethods(),
                      
                      const SizedBox(height: 32),
                      
                      // Transaction History Section
                      _buildSectionHeader('Transaction History'),
                      
                      const SizedBox(height: 16),
                      
                      _buildTransactionHistory(),
                      
                      const SizedBox(height: 100), // Bottom padding
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
                  'My Wallet',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Manage your coins and payments',
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

  Widget _buildWalletBalanceCard() {
    return Container(
      width: double.infinity,
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
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(
                'assets/images/coin.png',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 16,
                    ),
                  );
                },
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _currentBalance.toString(),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'coins',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Text(
            '1 coin = 1 minute of call time',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCoinPackages() {
    return Column(
      children: coinPackages.map((package) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: _buildCoinPackageCard(package),
        );
      }).toList(),
    );
  }

  Widget _buildCoinPackageCard(Map<String, dynamic> package) {
    final totalCoins = package['coins'] + package['bonus'];
    
    return GestureDetector(
      onTap: () {
        _showPurchaseConfirmation(package);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: package['popular'] 
                ? AppColors.accent
                : Colors.white.withValues(alpha: 0.2),
            width: package['popular'] ? 2 : 1,
          ),
          boxShadow: package['popular'] ? [
            BoxShadow(
              color: AppColors.accent.withValues(alpha: 0.2),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ] : [],
        ),
        child: Row(
          children: [
            // Coin icon and amount
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: package['popular'] 
                    ? AppColors.accent.withValues(alpha: 0.2)
                    : Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/coin.png',
                      width: 32,
                      height: 32,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                            size: 20,
                          ),
                        );
                      },
                    ),
                  ),
                  if (package['popular'])
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Package details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${package['coins']} Coins',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      if (package['bonus'] > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+${package['bonus']} Bonus',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.success,
                            ),
                          ),
                        ),
                      ],
                      if (package['popular']) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  if (package['bonus'] > 0)
                    Text(
                      'Total: $totalCoins coins',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            
            // Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹${package['price']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '₹${(package['price'] / totalCoins).toStringAsFixed(1)}/coin',
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
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      children: [
        ...paymentMethods.map((method) => _buildPaymentMethodCard(method)),
        
        const SizedBox(height: 12),
        
        // Add payment method button
        GestureDetector(
          onTap: () {
            _showAddPaymentMethod();
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.accent,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard(Map<String, dynamic> method) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: method['isDefault'] 
              ? AppColors.accent
              : Colors.white.withValues(alpha: 0.2),
          width: method['isDefault'] ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              method['icon'],
              color: Colors.white,
              size: 20,
            ),
          ),
          
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  method['identifier'],
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          if (method['isDefault'])
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Default',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      children: purchaseHistory.map((transaction) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: _buildTransactionCard(transaction),
        );
      }).toList(),
    );
  }

  Widget _buildTransactionCard(Map<String, dynamic> transaction) {
    final isUsage = transaction['type'] == 'usage';
    
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
              color: isUsage 
                  ? Colors.red.withValues(alpha: 0.2)
                  : AppColors.success.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              isUsage ? Icons.call_made : Icons.add,
              color: isUsage ? Colors.red : AppColors.success,
              size: 20,
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isUsage 
                      ? transaction['description']
                      : 'Coin Purchase',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isUsage 
                      ? transaction['duration']
                      : 'via ${transaction['method']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${transaction['amount'] > 0 ? '+' : ''}${transaction['coins']} coins',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isUsage ? Colors.red : AppColors.success,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                transaction['date'],
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
    );
  }

  void _showPurchaseConfirmation(Map<String, dynamic> package) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.primaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Confirm Purchase',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are about to purchase ${package['coins']} coins${package['bonus'] > 0 ? ' + ${package['bonus']} bonus coins' : ''} for ₹${package['price']}.',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total coins:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${package['coins'] + package['bonus']}',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.secondaryText,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _processPurchase(package);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Purchase',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _processPurchase(Map<String, dynamic> package) {
    // Simulate purchase processing
    HapticFeedback.lightImpact();
    
    setState(() {
      _currentBalance += (package['coins'] as int) + (package['bonus'] as int);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Successfully purchased ${package['coins'] + package['bonus']} coins!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _showAddPaymentMethod() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text(
                'Add Payment Method',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // UPI Option
              _buildPaymentOption(
                icon: Icons.account_balance_wallet,
                title: 'UPI',
                subtitle: 'Google Pay, PhonePe, Paytm',
                onTap: () {
                  Navigator.pop(context);
                  // Handle UPI setup
                },
              ),
              
              const SizedBox(height: 16),
              
              // Card Option
              _buildPaymentOption(
                icon: Icons.credit_card,
                title: 'Credit/Debit Card',
                subtitle: 'Visa, Mastercard, RuPay',
                onTap: () {
                  Navigator.pop(context);
                  // Handle card setup
                },
              ),
              
              const SizedBox(height: 16),
              
              // Net Banking Option
              _buildPaymentOption(
                icon: Icons.account_balance,
                title: 'Net Banking',
                subtitle: 'All major banks supported',
                onTap: () {
                  Navigator.pop(context);
                  // Handle net banking setup
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                color: AppColors.accent,
                size: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondaryText,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/male-home');
        break;
      case 1:
        Navigator.pushNamed(context, '/male-matches');
        break;
      case 2:
        // Already on wallet
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}