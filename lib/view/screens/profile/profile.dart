import 'package:arcadein_cafe/view/screens/profile/loginProfile.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import 'guestProfile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

     bool isLoggedIn = true;

    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        title: Text(
          'Profile',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: isLoggedIn
          ? LoggedInProfile()
          : const GuestProfile(),
    );
  }
}
