import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.softBrownGray.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cappuccino',
                  style: AppTextStyles.bodyText1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Rs. 450',
                  style: AppTextStyles.bodyText2,
                ),

                const SizedBox(height: 8),

                // Quantity Control
                Row(
                  children: [
                    _qtyButton(Icons.remove),
                    const SizedBox(width: 8),
                    Text(
                      '1',
                      style: AppTextStyles.bodyText1,
                    ),
                    const SizedBox(width: 8),
                    _qtyButton(Icons.add),
                  ],
                ),
              ],
            ),
          ),

          // Remove Button
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_outline,
              color: AppColors.mediumBrown,
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: AppColors.creamBeige,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 16,
        color: AppColors.darkBrown,
      ),
    );
  }
}
