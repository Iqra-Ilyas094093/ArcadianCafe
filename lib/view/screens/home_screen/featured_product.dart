import 'package:arcadein_cafe/view/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;

  const FeaturedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamBeige,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.network(
              product.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.heading3,
            ),
          ),

          const SizedBox(height: 4),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Rs ${product.price.toStringAsFixed(0)}',
              style: AppTextStyles.bodyText2,
            ),
          ),

          const Spacer(),

          // Add to cart button
          Padding(
            padding: const EdgeInsets.all(16),
            child: AddToCartButton(onTap: (){}),
          )
        ],
      ),
    );
  }
}
