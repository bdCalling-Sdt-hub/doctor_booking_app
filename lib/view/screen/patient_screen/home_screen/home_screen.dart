import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
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
  final PaitentHomeController homeController =
      Get.find<PaitentHomeController>();
  final GeneralController generalController = Get.find<GeneralController>();

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
                image: generalController.userImg.value,
                name: generalController.userName.value,
                location: generalController.userLocation.value,
              ),
              SizedBox(
                height: 12.h,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                child: Column(
                  children: [
                    ///============================This is banner=================

                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.ease,
                        pageSnapping: false,
                        onPageChanged: (index, reason) {
                          homeController.bannerIndex.value = index;
                        },
                      ),
                      items: homeController.bannerList.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      "${ApiUrl.baseUrl}/${imagePath.img}"),

                                  // AssetImage(
                                  //     "${ApiUrl.baseUrl}/${imagePath.img}"),
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

                    ///================================Categories Section==========================
                    CustomRow(
                      onTap: () {
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
                        children: List.generate(
                            homeController.categoryList.length, (index) {
                          var data = homeController.categoryList[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.subCategoriesScreen,
                                        arguments: data);
                                  },
                                  child: CustomNetworkImage(
                                    boxShape: BoxShape.circle,
                                    imageUrl:
                                        "${ApiUrl.baseUrl}/${homeController.categoryList[index].img ?? ""}",
                                    height: 54,
                                    width: 54,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                CustomText(
                                  left: 0,
                                  text: data.name ?? "",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///=================================PopularSpecialist Section==================
                    CustomRow(
                      onTap: () {
                        Get.toNamed(AppRoutes.popularSpecialistsScreen);
                      },
                      title: AppStrings.popularSpecialist,
                      subtitle: AppStrings.viewAll,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.specialistProfile);
                            },
                            child: CustomCard(
                              imageSrc: AppIcons.favoriteUnselected,
                              networkImageUrl: AppConstants.userNtr,
                              name: 'Jenny Wilson',
                              profession: 'Gynecologists',
                              rating: 4.7,
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),

                    ///=================================recommendedSpecialist Section==================
                    CustomRow(
                      onTap: () {
                        Get.toNamed(AppRoutes.popularSpecialistsScreen);
                      },
                      title: AppStrings.recommendedSpecialist,
                      subtitle: AppStrings.viewAll,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.specialistProfile);
                            },
                            child: CustomCard(
                              imageSrc: AppIcons.favoriteUnselected,
                              networkImageUrl: AppConstants.userNtr,
                              name: 'Jenny Wilson',
                              profession: 'Gynecologists',
                              rating: 4.7,
                            ),
                          );
                        }),
                      ),
                    ),
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
