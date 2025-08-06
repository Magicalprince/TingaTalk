import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'design_system/theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const TingaTalkApp());
}

class TingaTalkApp extends StatelessWidget {
  const TingaTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for dark theme
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'TingaTalk',
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}