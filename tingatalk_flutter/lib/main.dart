import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'design_system/theme.dart';
import 'design_system/colors.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/gender_selection_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/auth/payment_setup_screen.dart';
import 'screens/male/male_home_screen.dart';
import 'screens/male/male_matches_screen.dart';
import 'screens/male/male_wallet_screen.dart';
import 'screens/male/male_history_screen.dart';
import 'screens/female/female_home_screen.dart';
import 'screens/female/female_earnings_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/call/voice_call_screen.dart';
import 'screens/call/video_call_screen.dart';

void main() {
  runApp(const TingaTalkApp());
}

class TingaTalkApp extends StatelessWidget {
  const TingaTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.secondaryBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'TingaTalk',
      theme: AppTheme.darkTheme.copyWith(
        scaffoldBackgroundColor: AppColors.primaryBackground,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/gender-selection': (context) => const GenderSelectionScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/payment-setup': (context) => const PaymentSetupScreen(),
        '/male-home': (context) => const MaleHomeScreen(),
        '/male-matches': (context) => const MaleMatchesScreen(),
        '/male-wallet': (context) => const MaleWalletScreen(),
        '/male-history': (context) => const MaleHistoryScreen(),
        '/female-home': (context) => const FemaleHomeScreen(),
        '/female-earnings': (context) => const FemaleEarningsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/voice-call': (context) => const VoiceCallScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

