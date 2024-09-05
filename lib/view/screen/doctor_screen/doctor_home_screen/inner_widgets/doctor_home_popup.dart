import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/controller/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_calender/custom_calender.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorHomePopup extends StatelessWidget {
  DoctorHomePopup({super.key, required this.id});

  final String id;

  final DoctorHomeController doctorHomeController =
      Get.find<DoctorHomeController>();

  final DoctorProfileController doctorProfileController =
      Get.find<DoctorProfileController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomImage(
                    imageSrc: AppIcons.close,
                    size: 16,
                  ),
                ),
              ),
              Center(
                child: CustomText(
                  text: AppStrings.reschedule,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackNormal,
                  bottom: 10.h,
                ),
              ),
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
              CustomCalender(
                minDate: DateTime.now(),
                maxDate: DateTime(2090),
                initialDate: DateTime.now(),
                onDateChange: (date) {
                  doctorHomeController.doctorRescheduleDate.value =
                      DateFormat('yMd').format(date).toLowerCase();
                  doctorHomeController.doctorRescheduleDay.value =
                      DateFormat('EEEE').format(date).toLowerCase();

                  debugPrint(
                      "==============${doctorHomeController.doctorRescheduleDate.value}===============");
                  debugPrint(
                      "==============${doctorHomeController.doctorRescheduleDay.value}===============");
                },
                activeBackgroundColor: AppColors.blackNormal,
                monthColor: AppColors.blackNormal,
                showNavigationButtons: false,
                inactiveBackgroundColor: AppColors.grayLightHover,
                inactiveTextColor: AppColors.blackNormal,
                weekStartFrom: WeekStartFrom.sunday,
                horizontalPadding: 6.w,
                disabledBackgroundColor: AppColors.red.withOpacity(.3),
              ),
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
              //================================ Fri Day ===========================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.friday)
                doctorProfileController.fridayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.fridayAvailableList,
                        time: '9 PM',
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .fridayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),
              //================================ Tues Day ===========================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.tuesday)
                doctorProfileController.tuesdayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.tuedayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController.tuedayAvailableList[
                                  doctorHomeController
                                      .popupAvailableTimeCurrentIndex.value];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),
              //================================ Satar Day ================================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.saturday)
                doctorProfileController.saturdayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.satdayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .satdayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),

              //================================ Sun Day ================================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.sunday)
                doctorProfileController.sundayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.sundayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .sundayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),

              //================================ Mon Day ================================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.monday)
                doctorProfileController.mondayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.mondayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .mondayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),

              //================================ Wed Day ================================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.wednesday)
                doctorProfileController.weddayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.weddayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .weddayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),

              //================================ Thurs Day ================================
              if (doctorHomeController.doctorRescheduleDay.value ==
                  AppStrings.thursday)
                doctorProfileController.thursdayTypeController.value.text !=
                        AppStrings.weekend
                    ? AvailableTimeContainer(
                        selectedTime:
                            doctorProfileController.thudayAvailableList,
                        currentIndex: doctorHomeController
                            .popupAvailableTimeCurrentIndex.value,
                        onChanged: (index) {
                          doctorHomeController
                              .popupAvailableTimeCurrentIndex.value = index;
                          //======================== Reschedule Time =============//
                          doctorHomeController.doctorRescheduleTime.value =
                              doctorProfileController
                                  .thudayAvailableList[index];
                        },
                      )
                    : Center(
                        child: Text(
                            'No Time Avaible for ${doctorHomeController.doctorRescheduleDay.value}')),

              SizedBox(
                height: 18.w,
              ),
              CustomFormCard(
                title: 'Note',
                controller:
                    doctorHomeController.appointmentRescheduleNote.value,
                hintText: 'Why change the schedule?',
                // isMultiLine: true,
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //======================== Cancel button =================//
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
                  //=========================== Confirm buttons ========================//
                  Expanded(
                    child: PopupButton(
                      buttonName: 'Confirm',
                      onTap: () {
                        if (doctorHomeController
                            .doctorRescheduleTime.value.isNotEmpty) {
                          doctorHomeController.doctorRescheduleAppointment(
                              appointmentId: id);
                        } else {
                          Navigator.pop(context);
                          showCustomSnackBar(
                            "Select your available time",
                            getXSnackBar: false,
                            isError: true,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

//==================== ========================///
class AvailableTimeContainer extends StatelessWidget {
  const AvailableTimeContainer({
    super.key,
    this.time,
    this.onChanged,
    this.currentIndex,
    this.selectedTime,
  });

  final String? time;

  final ValueChanged<int>? onChanged;
  final int? currentIndex;
  final List<String>? selectedTime;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: selectedTime?.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8.w,
            crossAxisSpacing: 12.w,
            childAspectRatio: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onChanged!(index),
            child: Container(
              //height: 30.h,
              // width: 48.w,
              // margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: currentIndex == null
                      ? AppColors.white
                      : currentIndex == index
                          ? AppColors.blackNormal
                          : AppColors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.grayLightHover,
                  )),
              child: CustomText(
                text: selectedTime?[index] ?? '',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: currentIndex == null
                    ? AppColors.blackNormal
                    : currentIndex == index
                        ? AppColors.white
                        : AppColors.blackNormal,
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
