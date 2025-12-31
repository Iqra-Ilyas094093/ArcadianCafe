import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.darkBrown,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_shopping_cart,
              size: 18,
              color: AppColors.creamBeige,
            ),
            const SizedBox(width: 6),
            Text(
              'Add to Cart',
              style: AppTextStyles.buttonText.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
