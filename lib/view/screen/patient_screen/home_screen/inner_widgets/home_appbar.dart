import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_circle_container/custom_circle_container.dart';
import 'package:doctor_booking/view/widgets/custom_filter/custom_filter.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class HomeAppBar extends StatelessWidget {
   HomeAppBar({
    super.key,
    required this.scaffoldKey,
    required this.image,
    required this.name,
    required this.location,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String image;
  final String name;
  final String location;

  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.whiteLightActive,
      margin: EdgeInsets.only(
        top: 32.h,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          ///====================================Top Section================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///==================== Profile =====================
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: image,
                      height: 60,
                      width: 60),

                  SizedBox(
                    width: 16.w,
                  ),

                  ///==========================Welcome back======================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        color: AppColors.whiteDarker,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),

                      ///========================name=============================
                      Row(
                        children: [
                          const CustomImage(imageSrc: AppIcons.location),
                          CustomText(
                            text: location,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.whiteDarker,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ///<==================== notification ====================>
                  const CustomCircleContainer(
                    routeName: AppRoutes.notificationScreen,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),

                  ///<==================== Menu Bar ====================>
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackLight,
                    ),
                    child: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.blackNormal,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          ///====================================Search Section================================

          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: CustomTextField(
                  fillColor: AppColors.white,
                  onTap: () {
                    Get.toNamed(AppRoutes.searchScreen);
                  },
                  fieldBorderColor: AppColors.whiteDarkHover,
                  readOnly: true,
                  hintText: AppStrings.search,
                  hintStyle: const TextStyle(color: AppColors.whiteDarkActive),
                  isPrefixIcon: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.search,
                      color: AppColors.whiteDarkActive,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 14.h,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    Get.dialog(
                      CustomFilter(
                        locationController: _locationController,
                      ),
                    );
                    // Get.toNamed(AppRoute.filterSelectedGenresScreen);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15),
                      height: 55,
                      width: 54,
                      decoration: BoxDecoration(
                          color: AppColors.blackNormal,
                          borderRadius: BorderRadius.circular(10)),
                      child: const CustomImage(imageSrc: AppIcons.filterList)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
