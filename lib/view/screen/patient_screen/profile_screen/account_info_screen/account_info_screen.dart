import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_circle_container/custom_circle_container.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountInfoScreen extends StatelessWidget {
  AccountInfoScreen({super.key});

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const PatientNavBar(currentIndex: 4),
        backgroundColor: AppColors.whiteLightActive,
        appBar: const CustomAppBar(
          appBarContent: AppStrings.accountInfo,
        ),
        body: Obx(() {
          switch (profileController.profileLoading.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  profileController.getProfile();
                },
              );

            case Status.completed:
              var data = profileController.profileData.value;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(),
                        Spacer(),
                        CustomCircleContainer(
                          routeName: AppRoutes.accountEditScreen,
                          iconSrc: AppIcons.borderColor,
                        ),
                      ],
                    ),

                    ///====================Image=================
                    CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl: "${ApiUrl.baseUrl}/${data.img}",
                        height: 100,
                        width: 100),

                    ///=========================name==================
                    CustomText(
                      top: 14,
                      text: data.name ?? "",
                      color: AppColors.grayNormal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      bottom: 5,
                    ),

                    ///=========================Email==================
                    CustomText(
                      text: data.email ?? "",
                      color: AppColors.whiteDarker,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      bottom: 34,
                    ),

                    ///===========================Phone number================
                    customAccountInfo(
                        label: AppStrings.phoneNumber, value: data.phone ?? ""),

                    ///===========================Date Of birth================
                    customAccountInfo(
                        label: AppStrings.dateOfBirth,
                        value: data.dateOfBirth ?? ""),

                    ///===========================Gander================
                    customAccountInfo(
                        label: AppStrings.gender, value: data.gender ?? ""),

                    ///===========================Location================
                    customAccountInfo(
                        label: AppStrings.location, value: data.location ?? ""),
                  ],
                ),
              );
          }
        }));
  }

  Widget customAccountInfo({
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: label,
              color: AppColors.grayNormal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            const Spacer(),
            CustomText(
              text: value,
              color: AppColors.whiteDarker,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
