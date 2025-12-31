import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.creamBackground,

  // 🔰 AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkBrown,
    titleTextStyle: AppTextStyles.appBarTitle,
    iconTheme: IconThemeData(color: AppColors.creamBeige),
    elevation: 2,
    centerTitle: false, // Android-first (set true for iOS feel)
  ),

  // 🔻 Bottom Navigation Bar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.creamBackground,
    selectedItemColor: AppColors.darkBrown,
    unselectedItemColor: AppColors.mediumBrown,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),

  // 🅰 Global Text Theme
  textTheme: TextTheme(
    displayLarge: AppTextStyles.heading1,
    displayMedium: AppTextStyles.heading2,
    displaySmall: AppTextStyles.heading3,
    bodyLarge: AppTextStyles.bodyText1,
    bodyMedium: AppTextStyles.bodyText2,
    labelLarge: AppTextStyles.buttonText,
  ),

  // 🔘 Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkBrown,
      foregroundColor: AppColors.creamBeige,
      textStyle: AppTextStyles.buttonText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
