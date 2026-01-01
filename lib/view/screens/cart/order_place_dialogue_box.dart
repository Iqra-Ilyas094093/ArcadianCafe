import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/view/screens/navigation.dart';
import 'package:flutter/material.dart';

import '../../../utils/text_styles.dart';

void showOrderPlacedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Column(
          children: [
            Icon(Icons.check_circle_outline,color: Colors.green,size: 70,),
            Text(
              'Order Placed Successfully ',
              style: AppTextStyles.heading3,
            ),
          ],
        ),
        content: Text(
          'Your order has been placed and will be delivered soon.\n\n'
              'For more convenience, you can contact us at:\n'
              '+92 345 678 9123',
          style: AppTextStyles.bodyText2,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
              onPressed: () {
                Navigator.pop(context); // close dialog

                // Navigate back to Home
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Navigation()));
              },
              child: Text(
                'Back to Home',
                style: AppTextStyles.buttonText,
              ),
            ),
          ),
        ],
      );
    },
  );
}
