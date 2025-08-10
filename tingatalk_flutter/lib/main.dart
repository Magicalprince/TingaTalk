import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'design_system/theme.dart';
import 'design_system/colors.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const TingaTalkApp());
}

// Updated with exact Figma design theme and gradient
class TingaTalkApp extends StatelessWidget {
  const TingaTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for dark gradient theme
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
      home: const WelcomeScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

