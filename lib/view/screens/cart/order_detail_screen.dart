import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import 'order_place_dialogue_box.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        title: Text(
          'Order Details',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.creamBeige,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Information',
              style: AppTextStyles.heading3,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: _inputField('First Name')),
                const SizedBox(width: 12),
                Expanded(child: _inputField('Last Name')),
              ],
            ),

            const SizedBox(height: 12),
            _inputField('Phone Number'),

            const SizedBox(height: 12),
            _inputField('Address'),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _inputField('City')),
                const SizedBox(width: 12),
                Expanded(child: _inputField('Postal Code')),
              ],
            ),

            const SizedBox(height: 12),
            _inputField(
              'Additional Notes',
              maxLines: 4,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
                onPressed: () {
                  showOrderPlacedDialog(context);
                },
                child: Text(
                  'Place Order',
                  style: AppTextStyles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _inputField(
      String label, {
        int maxLines = 1,
      }) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.bodyText2,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.softBrownGray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.softBrownGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.darkBrown,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
