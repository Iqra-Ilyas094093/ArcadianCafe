import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: AppColors.mediumBrown,
            ),

            const SizedBox(height: 24),

            Text(
              'Your cart is empty',
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Looks like you haven’t added anything yet.\nExplore our menu and treat yourself',
              style: AppTextStyles.bodyText2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
                onPressed: () {
                  // Navigate to Menu screen later
                },
                child: Text(
                  'Browse Menu',
                  style: AppTextStyles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
