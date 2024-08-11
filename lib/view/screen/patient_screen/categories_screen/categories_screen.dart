import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      bottomNavigationBar: const PatientNavBar(currentIndex: 0),

      ///======================================Categories Appbar==================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.categories,
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
          childAspectRatio: 0.8, // Adjust this ratio to fit the height
        ),
        itemCount: homeController.categoriesList.length,
        itemBuilder: (context, index) {
          var data = homeController.categoriesList[index];
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  ///================================Image===================
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.subCategoriesScreen,
                          arguments: data);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12), // Adjusted padding
                      decoration: const BoxDecoration(
                        color: AppColors.blackLight,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: CustomNetworkImage(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        imageUrl: homeController.categoriesList[index]
                            ['image']!,
                        height: constraints.maxHeight *
                            0.5, // Adjusted height to fit within grid
                        width: constraints.maxHeight * 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  ///===============================name================
                  CustomText(
                    text: homeController.categoriesList[index]['name']!,
                    color: AppColors.grayNormal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 8.h, // Adjusted bottom space
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
