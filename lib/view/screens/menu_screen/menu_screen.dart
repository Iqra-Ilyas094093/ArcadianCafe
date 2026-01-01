import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:arcadein_cafe/view/screens/menu_detail_screen/menu_detail_screenn.dart';
import 'package:arcadein_cafe/view/screens/menu_screen/grid%20items.dart';
import 'package:arcadein_cafe/view/screens/menu_screen/menu_top_section.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0),
            //   child: Image.asset('assets/lofoCafe.png',color: AppColors.darkBrown,),
            // ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuDetailScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1622643944007-450264a5f9a9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXNpYW4lMjBmb29kfGVufDB8fDB8fHww',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                          ),
                        ),
                        child: Center(child: Text('Asian Food\n ( 12 Items )', style: AppTextStyles.heading1.copyWith(color: AppColors.creamBeige))),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
