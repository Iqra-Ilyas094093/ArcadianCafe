import 'package:arcadein_cafe/view/screens/cart/order_detail_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.creamBackground,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.softBrownGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Checkout',
            style: AppTextStyles.heading2,
          ),

          const SizedBox(height: 16),

          _sectionTitle('Order Summary'),
          _row('Items total', 'Rs. 1350'),
          _row('Delivery fee', 'Rs. 150'),

          const Divider(height: 32),

          _row(
            'Total',
            'Rs. 1500',
            isTotal: true,
          ),

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailsScreen()));
              },
              child: Text(
                'Confirm Order',
                style: AppTextStyles.buttonText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppTextStyles.bodyText1.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _row(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? AppTextStyles.bodyText1.copyWith(
              fontWeight: FontWeight.w600,
            )
                : AppTextStyles.bodyText2,
          ),
          Text(
            value,
            style: isTotal
                ? AppTextStyles.bodyText1.copyWith(
              fontWeight: FontWeight.w600,
            )
                : AppTextStyles.bodyText2,
          ),
        ],
      ),
    );
  }
}
