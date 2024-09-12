import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/inner_widget/appointments_history_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../doctor_payment_screen/payment_controller/doctor_payment_controller.dart';

class DoctorAppointmentsHistory extends StatelessWidget {
  DoctorAppointmentsHistory({super.key});

  final GeneralController generalController = Get.find<GeneralController>();
  final DoctorPaymentController paymentController =
      Get.find<DoctorPaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteNormal,
        //================== Appbar ===============//
        appBar: const CustomAppBar(
          appBarContent: AppStrings.appointmentHistory,
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            switch (paymentController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  paymentController.getMyAppoinmentHistory();
                });
              case Status.completed:
                return Column(
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
                                    paymentController.paymentHistoryList.length,
                                    (index) {
                                  var data = paymentController
                                      .paymentHistoryList[index];
                                  print(
                                      "==========Data=====================> $data");
                                  return AppointmentsHistoryCard(
                                    imageUrl:
                                        "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                                    patientName: data.userId?.name ?? '',
                                    appointmentDate: 'Date: 05-12-2024',
                                    appointmentTime: '12 : 00 AM',
                                    totalAmount: '\$320.00',
                                    amount: '-\$10.00',
                                    onTap: () {
                                      generalController
                                          .showAppintmentHistoryDialog(
                                              imageUrl: AppConstants.userNtr,
                                              patientName: 'Hasibur Rashid Mah',
                                              sickName: 'Heart Disease',
                                              appointmentFee: '\$650',
                                              contactNumber:
                                                  ' (00)+ 1205 125 12',
                                              appointmentTime:
                                                  '42 May, Sun  10 AM',
                                              rated: '4.5');
                                    },
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
            }
          }),
        ));
  }
}
