import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/model/appoinment_list_model.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_review_dialoge/custom_review_dialoge.dart';
import 'package:doctor_booking/view/widgets/customn_appointment_history/custom_appointment_history.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  State<AppointmentHistoryScreen> createState() =>
      _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  final PatientAppointmentController appointmentController =
      Get.find<PatientAppointmentController>();

  @override
  void initState() {
    appointmentController.getMyAppoinment(
        status: AppStrings.completed, isHistory: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      bottomNavigationBar: const PatientNavBar(currentIndex: 4),

      ///==================Appointment Appbar===============
      appBar: const CustomAppBar(
        appBarContent: AppStrings.appointmentHistory,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    children: List.generate(
                        appointmentController.appoinmentHistory.length,
                        (index) {
                  AppoinmentListModel data =
                      appointmentController.appoinmentHistory[index];
                  return CustomAppointmentHistory(
                    image: "${ApiUrl.baseUrl}/${data.doctorId?.img ?? ""}",
                    name: data.name ?? "",
                    date: DateConverter.timeFormetString(data.date ?? ""),
                    reviewButton: () {
                      showDialogBox(
                          docID: data.doctorId?.id ?? "",
                          appoinmentId: data.id ?? "");
                    },
                    profession: data.doctorId?.specialization ?? "",
                    time: data.time ?? "",
                  );
                }))
              ],
            ),
          ),
        );
      }),
    );
  }

  ///========================This is Accept Button Dialog box==============
  void showDialogBox({required String docID, required String appoinmentId}) {
    Get.dialog(CustomReviewDialog(
      appoinmentId: appoinmentId,
      docID: docID,
    ));
  }
}
