import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../navigation.dart';

class LoginOptionsScreen extends StatelessWidget {
  const LoginOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkBrown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            Text(
              'Welcome to Arcadian Café',
              style: AppTextStyles.heading1,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Sign in to continue',
              style: AppTextStyles.bodyText2,
            ),

            const SizedBox(height: 32),

            _SocialLoginButton(
              text: 'Continue with Google',
              icon: Icons.g_mobiledata,
              onTap: () => _handleLogin(context),
            ),

            const SizedBox(height: 16),

            _SocialLoginButton(
              text: 'Continue with Apple',
              icon: Icons.apple,
              onTap: () => _handleLogin(context),
            ),

            const Spacer(),

            Text(
              'By continuing, you agree to our Terms & Privacy Policy',
              style: AppTextStyles.bodyText2.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    // TEMP: simulate login success
    // AuthService.isLoggedIn = true;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const Navigation()),
          (route) => false,
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialLoginButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBrown.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: AppColors.darkBrown),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTextStyles.bodyText1.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

