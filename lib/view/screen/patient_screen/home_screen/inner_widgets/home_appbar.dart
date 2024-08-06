
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  // final HomeController homeController = Get.find<HomeController>();

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
                      imageUrl: AppConstants.userNtr,
                      height: 60,
                      width: 60),


                  SizedBox(
                    width: 16.w,
                  ),
                  ///==========================Welcome back======================
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Hi, Robert Smith',
                        color: AppColors.whiteDarker,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      ///========================name=============================
                      CustomText(
                        text: 'California, USA',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.whiteDarker,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ///<==================== notification ====================>
                  IconButton(
                      onPressed: () {
                        // Get.toNamed(AppRoute.notificationScreen);
                      },
                      icon: const CustomImage(imageSrc: AppIcons.notification,imageColor: AppColors.blackNormal,)),

                  ///<==================== Menu Bar ====================>
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.blackNormal,
                      ))
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
                  onTap: (){
                    // Get.toNamed(AppRoute.searchScreen);
                  },
                  fieldBorderColor: AppColors.whiteDarkHover,
                  readOnly: true,
                  hintText: AppStrings.search,
                  hintStyle:  TextStyle(color: AppColors.white),
                  isPrefixIcon: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(Icons.search,color: AppColors.whiteDarkActive,),
                  ),
                ),
              ),
              SizedBox(
                width: 14.h,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoute.filterSelectedGenresScreen);
                  },
                  child: Container(
                    height: 55,
                    width: 54,
                    decoration: BoxDecoration(
                        color: AppColors.whiteNormal,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.filter_alt,size:35,color: AppColors.whiteDarkActive,),
                  ),
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
}