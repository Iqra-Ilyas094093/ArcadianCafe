import 'package:arcadein_cafe/view/screens/dish_details_screen/dish_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import '../../../utils/category_arcadian.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // add top padding to avoid overlapping rating box
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoriess.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 4,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final category = categoriess[index];
          return SizedBox(
            height: 160,
            child: Column(
              children: [
                // Circle image
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DishDetailsScreen(imageUrl: category.imageUrl)));
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(category.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: AppColors.darkBrown, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.name,
                  style: AppTextStyles.bodyText1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
