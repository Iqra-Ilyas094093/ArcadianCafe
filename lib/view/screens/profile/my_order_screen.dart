import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/view/screens/profile/order_list.dart';
import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.creamBackground,
        appBar: AppBar(
          title: Text('My Orders', style: AppTextStyles.heading2.copyWith(color: AppColors.creamBeige)),
          backgroundColor: AppColors.darkBrown,
          bottom: TabBar(
            indicatorColor: AppColors.creamBeige,
            labelStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.creamBeige),
            unselectedLabelColor: AppColors.creamBackground,
            tabs: const [
              Tab(text: 'Ongoing'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrdersList(isOngoing: true),
            OrdersList(isOngoing: false),
          ],
        ),
      ),
    );
  }
}
