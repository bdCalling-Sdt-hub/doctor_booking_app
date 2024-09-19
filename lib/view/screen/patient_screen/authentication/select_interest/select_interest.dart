import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/patient_auth_controller/patient_auth_controller.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SelectInterest extends StatelessWidget {
  SelectInterest({super.key});

  final PatientAuthController controller = Get.find<PatientAuthController>();
  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
          title: AppStrings.continues,
          marginVerticel: 24.h,
          marginHorizontal: 20.w,
          onTap: () {
            controller.updateInterest();
          }),
      body: Column(
        children: [
          CustomText(
            top: 64.h,
            text: AppStrings.chooseOneOrMore,
            maxLines: 3,
            bottom: 10.h,
          ),
          Expanded(child: Obx(() {
            return GridView.custom(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              gridDelegate: SliverStairedGridDelegate(
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                startCrossAxisDirectionReversed: true,
                pattern: [
                  const StairedGridTile(0.5, 3),
                  const StairedGridTile(0.5, 10 / 4),
                  const StairedGridTile(1.0, 20 / 4),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  childCount: generalController.categoryList.length,
                  (context, index) {
                var data = generalController.categoryList[index];
                return GestureDetector(
                  onTap: () {
                    // controller.updateInterest(index: index);
                    // controller.isSelectedList.refresh();

                    generalController.updateInterest(
                        interest: data.name ?? "", index: index);
                  },
                  child: Obx(() {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: generalController.categoryBool[index]
                              ? AppColors.grayNormal
                              : AppColors.eyeColor,
                          borderRadius: BorderRadius.circular(24.r)),
                      child: CustomText(
                        text: data.name ?? "",
                        color: generalController.categoryBool[index]
                            ? AppColors.white
                            : AppColors.grayNormal,
                      ),
                    );
                  }),
                );
              }),
            );
          })),
        ],
      ),
    );
  }
}
