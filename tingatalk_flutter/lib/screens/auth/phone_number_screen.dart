import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';
import '../../widgets/common/flowing_background.dart';
import '../../widgets/common/tinga_logo.dart';
import '../signup/signup_page.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeSent = false;
  bool _isLoading = false;
  bool _isContinueLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _sendCode() async {
    if (_phoneController.text.isEmpty) {
      _showErrorMessage('Please enter your phone number');
      return;
    }
    
    setState(() {
      _isLoading = true;
    });
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _isCodeSent = true;
      _isLoading = false;
    });
    
    HapticFeedback.lightImpact();
    _showSuccessMessage('Verification code sent successfully!');
  }

  void _continue() async {
    if (!_isCodeSent) {
      _showErrorMessage('Please send the verification code first');
      return;
    }
    
    if (_codeController.text.isEmpty) {
      _showErrorMessage('Please enter the verification code');
      return;
    }
    
    setState(() {
      _isContinueLoading = true;
    });
    
    // Simulate verification
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _isContinueLoading = false;
    });
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.red.shade600,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green.shade600,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF6B9D), // Lighter bright pink - matches home screen
              Color(0xFFE91E63), // Bright pink
              Color(0xFFAD1457), // Medium pink
              Color(0xFF8E24AA), // Purple pink  
              Color(0xFF673AB7), // Deep purple
            ],
            stops: [0.0, 0.3, 0.6, 0.8, 1.0], // Same as home screen
          ),
        ),
        child: Stack(
          children: [
            // SUBTLE NEON GRADIENT OVERLAY - Same as home screen
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.0, -0.4),
                    radius: 1.8,
                    colors: [
                      // Much lighter neon center - matches home screen
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // iPhone-themed back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20), // Perfect circle like iPhone
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Correct logo with proper blending like landing page
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // Beautiful blending shadows like the reference
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.8),
                              blurRadius: 40,
                              spreadRadius: 0,
                              offset: const Offset(0, 0),
                            ),
                            BoxShadow(
                              color: AppColors.primaryBackground.withValues(alpha: 0.6),
                              blurRadius: 60,
                              spreadRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                            BoxShadow(
                              color: AppColors.secondaryBackground.withValues(alpha: 0.4),
                              blurRadius: 80,
                              spreadRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                            BoxShadow(
                              color: AppColors.tertiaryBackground.withValues(alpha: 0.3),
                              blurRadius: 25,
                              spreadRadius: 5,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Stack(
                            children: [
                              // Correct logo image
                              Image.asset(
                                'assets/images/logo.jpeg',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          AppColors.accent,
                                          AppColors.primaryBackground,
                                          AppColors.secondaryBackground,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'T',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          letterSpacing: -2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Perfect blending overlay like landing page
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // Neon pink tint at top
                                      AppColors.accent.withValues(alpha: 0.25),
                                      Colors.transparent,
                                      // Neon purple tint at bottom
                                      AppColors.tertiaryBackground.withValues(alpha: 0.3),
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              // Additional neon glow overlay
                              Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    center: const Alignment(0.0, 0.0),
                                    radius: 1.0,
                                    colors: [
                                      Colors.transparent,
                                      AppColors.primaryBackground.withValues(alpha: 0.15),
                                      AppColors.accent.withValues(alpha: 0.2),
                                    ],
                                    stops: const [0.0, 0.6, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Professional title
                    const Center(
                      child: Text(
                        'Verify Your Phone',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: AppColors.whiteText,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    const Center(
                      child: Text(
                        'Start connecting with people worldwide',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Phone number section
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Phone number input
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: '+91638114201',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.4),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.4),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Send code button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _phoneController.text.isNotEmpty && !_isLoading
                            ? _sendCode
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: Colors.white.withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                              )
                            : const Text(
                                'Send Code',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Verification code section - Always visible
                    Text(
                      'Verification Code',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _isCodeSent ? Colors.white : Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Verification code input - Always visible but disabled until code is sent
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        enabled: _isCodeSent,
                        style: TextStyle(
                          color: _isCodeSent ? Colors.white : Colors.white.withValues(alpha: 0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: _isCodeSent ? 'Enter 6-digit code' : 'Send code first',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: _isCodeSent 
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: _isCodeSent ? 0.4 : 0.2),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.4),
                              width: 1.5,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.2),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Resend code link - Always visible but only functional after first send
                    Center(
                      child: TextButton(
                        onPressed: _isCodeSent ? _sendCode : null,
                        child: Text(
                          'Didn\'t receive code? Send again',
                          style: TextStyle(
                            fontSize: 14,
                            color: _isCodeSent 
                                ? Colors.white.withValues(alpha: 0.8)
                                : Colors.white.withValues(alpha: 0.4),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Continue button - Always visible
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isCodeSent && _codeController.text.isNotEmpty && !_isContinueLoading
                            ? _continue
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: Colors.white.withValues(alpha: 0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: _isContinueLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                              )
                            : const Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Professional bottom text
                    Center(
                      child: Text(
                        'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryText.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: 40), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}