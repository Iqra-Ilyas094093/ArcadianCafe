import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class DishDetailsScreen extends StatefulWidget {
  final String imageUrl;
  const DishDetailsScreen({super.key,required this.imageUrl});

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  final int price = 345;
  final bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top image with Hero
          SizedBox(
            height: screenHeight * 0.4,
            width: double.infinity,
            child: Hero(
              tag: 1,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable section for details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dish name + favorite icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Latte",
                            style: AppTextStyles.heading2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: AppColors.darkBrown,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${price.toStringAsFixed(0)}',
                          style: AppTextStyles.heading3.copyWith(
                            color: AppColors.darkBrown,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isAvailable
                                ? Colors.green.withValues(alpha: 0.15)
                                : Colors.red.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isAvailable ? 'In Stock' : 'Out of Stock',
                            style: AppTextStyles.bodyText2.copyWith(
                              color: isAvailable ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    // Description
                    Text(
                      "Minced chicken and crushed sweet corn cooked in chicken broth and seasoned with Chinese spices corn cooked in chicken broth and seasoned with Chinese spices",
                      style: AppTextStyles.bodyText1,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),

                    // Reviews Section (example)
                    Text("Reviews", style: AppTextStyles.heading3),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 130, // horizontal list of reviews
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // number of reviews
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.creamBeige,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                        (starIndex) => Icon(
                                      Icons.star,
                                      size: 16,
                                      color: starIndex < 4
                                          ? AppColors.darkBrown
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Great taste, loved it!. Not only the taste Arcadian Cafe gives a good care over their presentation",
                                  style: AppTextStyles.bodyText2,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Add to cart button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: isAvailable ? () {} : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAvailable
                              ? AppColors.darkBrown
                              : AppColors.softBrownGray,
                          foregroundColor: AppColors.creamBeige,
                          elevation: isAvailable ? 3 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: AppTextStyles.buttonText,
                        ),
                        child: Text(
                          isAvailable ? 'Add to Cart' : 'Out of Stock',
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
