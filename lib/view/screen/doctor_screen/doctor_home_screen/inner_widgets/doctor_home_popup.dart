import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorHomePopup extends StatelessWidget {
  DoctorHomePopup({super.key});

  final String availableTime = '07 pm';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
              SizedBox(
                width: 10.w,
              ),
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
    return Row(
      children: [
        InkWell(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
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
                color: AppColors.blackNormal,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
      ],
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
