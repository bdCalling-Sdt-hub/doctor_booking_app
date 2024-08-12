import 'package:doctor_booking/global/general_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/inner_widget/appointments_history_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorAppointmentsHistory extends StatelessWidget {
  DoctorAppointmentsHistory({super.key});

  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteNormal,
        //================== Appbar ===============//
        appBar: const CustomAppBar(
          appBarContent: AppStrings.appointmentHistory,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.h),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //================== Date ===================//
                              CustomText(
                                text: 'February 2024',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.bluNormalHover,
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              CustomImage(
                                imageSrc: AppIcons.calendarClock,
                                sizeWidth: 20.h,
                                imageColor: AppColors.bluNormalHover,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),

                          ///===================== Total Blance ===================//
                          CustomText(
                            text: AppStrings.totalBalance2,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayNormal,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          //=================== Amount===========//
                          CustomText(
                            text: '\$ 10,000',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayNormal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    //================= Total Appointment card ===========//
                    Container(
                      height: 70.h,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.blackDarker,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomText(
                        text: '${AppStrings.totalAppointment2}: 12,258 ',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: Column(
                          children: List.generate(
                            7,
                            (index) => AppointmentsHistoryCard(
                              onTap: () {
                                generalController.showAppintmentHistoryDialog(
                                    imageUrl: AppConstants.userNtr,
                                    patientName: 'Hasibur Rashid Mah',
                                    sickName: 'Heart Disease',
                                    appointmentFee: '\$650',
                                    contactNumber: ' (00)+ 1205 125 12',
                                    appointmentTime: '42 May, Sun  10 AM',
                                    rated: '4.5');
                              },
                              imageUrl: AppConstants.userNtr,
                              patientName: 'Heart Disease',
                              appointmentDate: 'Date: 05-12-2024',
                              appointmentTime: '12 : 00 AM',
                              totalAmount: '\$320.00',
                              amount: '-\$10.00',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
