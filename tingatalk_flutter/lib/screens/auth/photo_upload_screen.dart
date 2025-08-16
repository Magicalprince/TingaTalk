import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design_system/colors.dart';
import '../../design_system/theme.dart';

class PhotoUploadScreen extends StatefulWidget {
  const PhotoUploadScreen({super.key});

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {
  bool _profilePhotoUploaded = false;
  bool _fullPhotoUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTheme.gradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
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
                
                const SizedBox(height: 40),
                
                // Title
                Text(
                  'Show Your Beautiful Self',
                  style: GoogleFonts.dancingScript(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  'Upload your photos to attract amazing connections',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Profile Photo Upload
                _buildPhotoUploadCard(
                  title: 'Profile Photo',
                  subtitle: 'Your main profile picture (round)',
                  isUploaded: _profilePhotoUploaded,
                  isRound: true,
                  onTap: () {
                    setState(() {
                      _profilePhotoUploaded = true;
                    });
                    HapticFeedback.lightImpact();
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Full Photo Upload
                _buildPhotoUploadCard(
                  title: 'Glamour Photo',
                  subtitle: 'Your full body/glamorous photo',
                  isUploaded: _fullPhotoUploaded,
                  isRound: false,
                  onTap: () {
                    setState(() {
                      _fullPhotoUploaded = true;
                    });
                    HapticFeedback.lightImpact();
                  },
                ),
                
                const SizedBox(height: 40),
                
                // Info card
                Container(
                  padding: const EdgeInsets.all(20),
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
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.info_outline,
                          color: AppColors.accent,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Photo Guidelines',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Clear, well-lit photos work best. Your verification photo is private and only used for safety.',
                              style: GoogleFonts.poppins(
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
                ),
                
                const Spacer(),
                
                // Continue button
                _AnimatedButton(
                  onTap: (_profilePhotoUploaded && _fullPhotoUploaded) ? () {
                    HapticFeedback.lightImpact();
                    Navigator.pushReplacementNamed(context, '/payment-setup');
                  } : () {},
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: (_profilePhotoUploaded && _fullPhotoUploaded) 
                          ? Colors.white 
                          : Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: (_profilePhotoUploaded && _fullPhotoUploaded) ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                      ] : [],
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: (_profilePhotoUploaded && _fullPhotoUploaded) 
                              ? const Color(0xFF2F0939)
                              : const Color(0xFF2F0939).withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadCard({
    required String title,
    required String subtitle,
    required bool isUploaded,
    required bool isRound,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isUploaded 
              ? AppColors.success.withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isUploaded 
                ? AppColors.success
                : Colors.white.withValues(alpha: 0.3),
            width: isUploaded ? 2 : 1,
          ),
          boxShadow: isUploaded ? [
            BoxShadow(
              color: AppColors.success.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ] : [],
        ),
        child: Row(
          children: [
            // Photo placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: isUploaded 
                    ? AppColors.success.withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(isRound ? 40 : 12),
                border: Border.all(
                  color: isUploaded ? AppColors.success : Colors.white.withValues(alpha: 0.3),
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: isUploaded 
                  ? Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 32,
                    )
                  : Icon(
                      Icons.add_a_photo,
                      color: Colors.white.withValues(alpha: 0.7),
                      size: 32,
                    ),
            ),
            
            const SizedBox(width: 20),
            
            // Photo info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (isUploaded) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Uploaded ✓',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Upload icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isUploaded 
                    ? AppColors.success.withValues(alpha: 0.2)
                    : AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                isUploaded ? Icons.check : Icons.camera_alt,
                color: isUploaded ? AppColors.success : AppColors.accent,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const _AnimatedButton({
    required this.onTap,
    required this.child,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}