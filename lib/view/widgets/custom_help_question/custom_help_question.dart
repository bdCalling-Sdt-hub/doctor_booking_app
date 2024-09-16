import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_expanded_section/custom_expanded_section.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomHelpQuestion extends StatelessWidget {
  CustomHelpQuestion({
    super.key,
  });

  final RxInt selectedFqw = 100000.obs;

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: List.generate(profileController.faqList.length, (index) {
          var data = profileController.faqList[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              children: [
                ///==================== Question Design =====================
                GestureDetector(
                  onTap: () {
                    if (selectedFqw.value == index) {
                      selectedFqw.value = 100000;
                    } else {
                      selectedFqw.value = index;
                    }

                    selectedFqw.refresh();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteNormal,
                        border: Border.all(color: AppColors.grayLightHover)),
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomText(
                          textAlign: TextAlign.left,
                          text: data.question ?? "",
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        )),
                        IconButton(
                            onPressed: () {
                              if (selectedFqw.value == index) {
                                selectedFqw.value = 100000;
                              } else {
                                selectedFqw.value = index;
                              }

                              selectedFqw.refresh();
                            },
                            icon: selectedFqw.value == index
                                ? const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.grayNormal,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: AppColors.grayNormal,
                                  ))
                      ],
                    ),
                  ),
                ),

                ///==================== Ans Design =====================

                index == selectedFqw.value
                    ? CustomExpandedSection(
                        expand: index == selectedFqw.value ? true : false,
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(8.r),
                          alignment: Alignment.center,
                          height: 100.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.whiteNormal,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomText(
                            textAlign: TextAlign.left,
                            text: data.answer ?? "",
                            maxLines: 6,
                          ),
                        ))
                    : const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}
