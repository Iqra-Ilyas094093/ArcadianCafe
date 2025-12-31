import 'package:arcadein_cafe/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // 🔰 App Logo / AppBar Title (Branding)
  static TextStyle appBarTitle = GoogleFonts.lora(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.creamBeige,
  );

  // 🧾 Headings → Lora
  static TextStyle heading1 = GoogleFonts.lora(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkCharcoal,
  );

  static TextStyle heading2 = GoogleFonts.lora(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkCharcoal,
  );

  static TextStyle heading3 = GoogleFonts.lora(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.darkCharcoal,
  );

  // 📄 Body Text → Poppins
  static TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkCharcoal,
  );

  static TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.mediumBrown,
  );

  // 🏷 Small / Caption Text
  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.mediumBrown,
  );

  // 🔘 Buttons / Labels → Poppins
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.creamBeige,
  );
}
