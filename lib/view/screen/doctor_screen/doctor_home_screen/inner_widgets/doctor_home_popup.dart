import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorHomePopup extends StatelessWidget {
  DoctorHomePopup({super.key});

  final DoctorHomeController doctorHomeController =
  Get.find<DoctorHomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: AppStrings.rescheduleDate,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grayNormal,
          ),
          SizedBox(
            height: 14.h,
          ),
          //====================== Reschudule Date ===================//
          Obx(() {
            return CustomReschuduleDate(
              currentIndex:
              doctorHomeController.popupReschuduleCurrentIndex.value,
              onChanged: (value) {
                doctorHomeController.popupReschuduleCurrentIndex.value = value;
              },
              dateName: 'Sat',
              dateNumber: '07',
            );
          }),
          SizedBox(
            height: 14.h,
          ),
          CustomText(
            text: AppStrings.availAbleTime,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grayNormal,
          ),
          SizedBox(
            height: 12.h,
          ),
          //================================== Available Time ============================//
          Obx(() {
            return AvailableTimeContainer(
              time: '9 PM',
              currentIndex:
              doctorHomeController.popupAvailableTimeCurrentIndex.value,
              onChanged: (value) {
                doctorHomeController.popupAvailableTimeCurrentIndex.value =
                    value;
              },
            );
          }),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PopupButton(
                  buttonName: AppStrings.cancel,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: PopupButton(
                  buttonName: 'Confirm',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//==================== ========================///
class AvailableTimeContainer extends StatelessWidget {
  const AvailableTimeContainer({
    super.key,
    required this.time,
    this.onChanged,
    required this.currentIndex,
    this.selectedTime,
  });

  final String time;

  final ValueChanged<int>? onChanged;
  final int currentIndex;
  final List<int>? selectedTime;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onChanged!(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: currentIndex == index
                      ? AppColors.blackNormal
                      : AppColors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.grayLightHover,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: time,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: currentIndex == index
                      ? AppColors.white
                      : AppColors.blackNormal,
                ),
              ),
            ),
          );
        });
  }
}

class CustomReschuduleDate extends StatelessWidget {
  const CustomReschuduleDate(
      {super.key,
        required this.currentIndex,
        required this.onChanged,
        required this.dateName,
        required this.dateNumber});

  final int currentIndex;
  final ValueChanged<int> onChanged;
  final String dateName;
  final String dateNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: List.generate(7, (index) {
              return InkWell(
                onTap: () => onChanged(index),
                child: Row(
                  children: [
                    Container(
                      height: 58.h,
                      width: 42.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: currentIndex == index
                            ? AppColors.blackNormal
                            : AppColors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: dateName,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: currentIndex == index
                                  ? AppColors.white
                                  : AppColors.grayNormal,
                            ),
                            CustomText(
                              text: dateNumber,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: currentIndex == index
                                  ? AppColors.white
                                  : AppColors.grayNormal,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class PopupButton extends StatelessWidget {
  const PopupButton({super.key, required this.buttonName, required this.onTap});

  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 129.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.blackNormal,
        ),
        child: CustomText(
          text: buttonName,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteNormal,
        ),
      ),
    );
  }
}