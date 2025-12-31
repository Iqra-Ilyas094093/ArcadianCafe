import 'package:arcadein_cafe/utils/banners.dart';
import 'package:arcadein_cafe/utils/categories.dart';
import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/products.dart';
import 'featured_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        title: Text('Arcadian Cafe', style: AppTextStyles.appBarTitle),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.creamBeige,
                  size: 26,
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.latte,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.softBrownGray, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.mediumBrown),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: AppTextStyles.bodyText1,
                      decoration: InputDecoration(
                        hintStyle: AppTextStyles.bodyText2,
                        border: InputBorder.none,
                        hintText: 'Search Coffee, meals, drinks...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: AppColors.softBrownGray,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(category.icon, color: AppColors.darkBrown, size: 28),
                        const SizedBox(height: 8),
                        Text(
                          category.name,
                          style: AppTextStyles.bodyText2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              carouselController: _carouselController,
              items: banners.map((banner) {
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: banner.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: AppColors.softBrownGray,
                            highlightColor: AppColors.creamBeige,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.softBrownGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
        
                          errorWidget: (error, context, stackTrace) {
                            return Container(color: AppColors.softBrownGray);
                          },
                        ),
                        Container(color: Colors.black.withValues(alpha: 0.3)),
                        Positioned(
                          top: 8,
                          left: 10,
                          child:
                              banner.title.isNotEmpty ||
                                  banner.subtitle.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      banner.title,
                                      style: AppTextStyles.heading3.copyWith(
                                        color: AppColors.creamBeige,
                                      ),
                                    ),
                                    Text(
                                      banner.subtitle,
                                      style: AppTextStyles.bodyText2.copyWith(
                                        color: AppColors.creamBeige,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
                height: 180,
                enlargeCenterPage: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: banners.length,
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
              effect: JumpingDotEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.darkBrown,
                dotColor: AppColors.mediumBrown.withValues(alpha: 0.4),
                verticalOffset: 10,
                spacing: 6,
                jumpScale: 1.6,
              )
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(80),
                    color: AppColors.darkBrown,
                  ),
                  child: Center(child: Text('Seat\n Reservation',style: AppTextStyles.buttonText,textAlign: TextAlign.center,)),
                ),
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(80),
                    color: AppColors.creamBeige,
                  ),
                  child: Center(child: Text('Food\n Delivery',style: AppTextStyles.buttonText.copyWith(color: AppColors.darkBrown),textAlign: TextAlign.center,)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkBrown,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Curated for You',
                        style: AppTextStyles.heading2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Arcadian favorites you’ll love',
                        style: AppTextStyles.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68, // Perfect for image + text + button
              ),
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                return FeaturedProductCard(product: featuredProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
