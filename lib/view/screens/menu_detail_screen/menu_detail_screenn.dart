import 'package:flutter/material.dart';

import '../../../utils/text_styles.dart';
import '../menu_screen/grid items.dart';
import '../menu_screen/menu_top_section.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuTopSection(),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Asian Food',style: AppTextStyles.heading1,)
              ],),
            CategoriesGrid(),
          ],
        ),
      ),
    );
  }
}
