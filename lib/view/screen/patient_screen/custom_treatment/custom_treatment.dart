import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/controller/payment_controller/payment_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/model/appoinment_list_model.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTreatment extends StatelessWidget {
  CustomTreatment({super.key});

  final AppoinmentListModel data = Get.arguments;

  final PaitentPaymentController paitentPaymentController =
      Get.find<PaitentPaymentController>();

  final GeneralController generalController = Get.find<GeneralController>();

  final PatientAppointmentController patientAppointmentController =
      Get.find<PatientAppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: CustomButton(
            fillColor: AppColors.white,
            textColor: AppColors.blackDarker,
            marginHorizontal: 20.w,
            onTap: () async {
              bool complete = await generalController.updateAppoinment(
                  appoinmentID: data.id ?? "", status: AppStrings.rejected);
              if (complete) {
                patientAppointmentController.refreshScreen(index: 1);
              }
            },
            title: AppStrings.reject,
          )),
          Expanded(
              child: CustomButton(
            marginVerticel: 44.h,
            marginHorizontal: 20.w,
            onTap: () {
              paitentPaymentController.makePayment(
                  appoinmentDate: data.date ?? "",
                  amount: data.additionalTreatmentList!.isEmpty
                      ? data.appointmentFee ?? 0
                      : data.additionalFee ?? 0,
                  userID: data.userId ?? "",
                  doctorID: data.doctorId?.id ?? "",
                  appoinmentId: data.id ?? "");
            },
            title: "Pay",
          )),
        ],
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Custom Treatment List",
              fontSize: 16.w,
              //top: 24.h,
              bottom: 10.h,
            ),

            ///=================== Treatment List =================

            ...List.generate(
              data.additionalTreatmentList?.length ?? 0,
              (index) {
                return CustomText(
                    text: data.additionalTreatmentList?[index] ?? "");
              },
            ),

            ///=================== Additional Price ==================
            CustomText(
              text: "Total price:  ${data.additionalFee}\$",
              top: 10.h,
              fontSize: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
