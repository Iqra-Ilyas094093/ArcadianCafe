import 'package:flutter/material.dart';
import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTopSection extends StatelessWidget {
  const MenuTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Semi-circle container
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: AppColors.creamBeige,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(250),
              bottomRight: Radius.circular(250),
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FmZXxlbnwwfHwwfHx8MA%3D%3D',
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),

        // Rating box overlay
        Positioned(
          bottom: -20, // overlap semi-circle
          left: MediaQuery.of(context).size.width / 2 - 90, // center horizontally, width 180
          child: Container(
            width: 180,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkBrown.withValues(alpha: 0.7),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stars
                for (int i = 0; i < 5; i++)
                  Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: i < 3 ? AppColors.darkBrown : AppColors.creamBeige,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
