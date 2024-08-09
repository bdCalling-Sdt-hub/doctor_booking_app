import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_row/custom_row.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'inner_widgets/home_appbar.dart';
import 'inner_widgets/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.whiteLightActive,

      ///===================================Side Drawer=============================
      drawer: const SideDrawer(),
      bottomNavigationBar: const PatientNavBar(currentIndex: 0),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///====================== Home AppBar and banner =======================
              HomeAppBar(
                scaffoldKey: scaffoldKey,
                image: AppConstants.userNtr,
                name: 'Hi, Robert Smith',
                location: 'California, USA',
              ),
              SizedBox(
                height: 12.h,
              ),

              ///============================This is banner=================
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.ease,
                        pageSnapping: false,
                        onPageChanged: (index, reason) {
                          homeController.bannerIndex.value = index;
                        },
                      ),
                      items: homeController.bannerImg.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    ///============================Dot indicator================
                    SmoothPageIndicator(
                      controller: homeController.pageController.value,
                      count: homeController.bannerImg.length,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                        expansionFactor: 3,
                        spacing: 8.0,
                        dotWidth: 10,
                        dotHeight: 6.0,
                        paintStyle: PaintingStyle.fill,
                        dotColor: AppColors.blackLight,
                        activeDotColor: AppColors.blackO,
                      ),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),

                     CustomRow(
                      onTap: (){
                        Get.toNamed(AppRoutes.categoriesScreen);
                      },
                      title: AppStrings.categories,
                      subtitle: AppStrings.viewAll,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(homeController.categoriesList.length, (index)

                        {
                          var data = homeController.categoriesList[index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Get.toNamed(AppRoutes.subCategoriesScreen,arguments: data);
                                },
                                child: CustomNetworkImage(
                                  boxShape: BoxShape.circle,
                                  imageUrl:homeController.categoriesList[index]['image']!,
                                  height: 54,
                                  width: 54,
                                ),
                              ),
                              const SizedBox(height: 6),
                               CustomText(
                                 left: 20,
                                text: homeController.categoriesList[index]['name']!,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          );

                        }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
