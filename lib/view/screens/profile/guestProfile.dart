import 'package:arcadein_cafe/view/screens/login/login_options_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Avatar(),
            const SizedBox(height: 20),

            Text(
              'Welcome to Arcadian Café',
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            Text(
              'Login to track orders, save favorites\nand enjoy faster checkout',
              style: AppTextStyles.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            _LoginButton(),
            const SizedBox(height: 12),

            _CreateAccountButton(),
            const SizedBox(height: 32),

          ],
        ),
      ),
    );
  }
}
class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 96,
      decoration: BoxDecoration(
        color: AppColors.creamBeige,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBrown.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(
        Icons.person,
        size: 42,
        color: AppColors.darkBrown,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
        onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginOptionsScreen()));
        },
        child:  Text('Login',style: AppTextStyles.buttonText,),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Navigate to Register
        },
        child:  Text('Create Account',style: AppTextStyles.buttonText.copyWith(color: AppColors.darkBrown),),
      ),
    );
  }
}


