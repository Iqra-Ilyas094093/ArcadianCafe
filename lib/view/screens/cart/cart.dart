import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'cart_bottom_sheet.dart';
import 'cart_item_card.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
        elevation: 0,
        title: Text('Your Cart',style: AppTextStyles.appBarTitle,),
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding(padding: EdgeInsetsGeometry.all(16),child: ListView(
              children: [
                CartItemCard(),
                CartItemCard(),
                CartItemCard(),
                CartItemCard(),
              ],
            ),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const CheckoutBottomSheet(),
              );
            },
            child: Text(
              'Proceed to Checkout',
              style: AppTextStyles.buttonText,
            ),
          ),

        ],
      ),

    );
  }
}
