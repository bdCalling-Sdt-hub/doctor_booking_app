import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/inner_widget/appointments_history_card.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
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
  final DoctorHomeController homeController = Get.find<DoctorHomeController>();
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
                                  text: homeController.doctorOverview.value
                                              .availableForReceive ==
                                          null
                                      ? '\$0'
                                      : "\$${homeController.doctorOverview.value.availableForReceive.toString()}",
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
                              text: homeController.doctorOverview.value
                                          .totalAppointment?.completed ==
                                      null
                                  ? '0'
                                  : "${AppStrings.totalAppointment2} : ${homeController.doctorOverview.value.totalAppointment!.completed.toString()}",
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

                                  return AppointmentsHistoryCard(
                                    imageUrl:
                                        "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                                    patientName: data.userId?.name ?? '',
                                    appointmentDate:
                                        "Date: ${data.createdAt != null ? DateConverter.formatDate(data.createdAt!) : ''}",
                                    appointmentTime: data.createdAt != null
                                        ? DateConverter.formatTime(
                                            data.createdAt!)
                                        : '',
                                    totalAmount:
                                        '\$${data.doctorAmount ?? '0'}',
                                    amount: data.amount != null &&
                                            data.doctorAmount != null
                                        ? '-\$${data.amount! - data.doctorAmount!}'
                                        : '0',
                                    onTap: () {
                                      generalController.showAppintmentHistoryDialog(
                                          imageUrl:
                                              "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                                          patientName: data.userId?.name ?? '',
                                          sickName: 'Heart Disease',
                                          appointmentFee:
                                              '\$${data.amount ?? '0'}',
                                          contactNumber:
                                              data.userId?.phone ?? '',
                                          appointmentTime:
                                              data.createdAt != null
                                                  ? DateConverter.formatDate(
                                                      data.createdAt!)
                                                  : '',
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
