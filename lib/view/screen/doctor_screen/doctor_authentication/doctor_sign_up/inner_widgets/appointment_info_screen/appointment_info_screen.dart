import 'package:doctor_booking/global/general_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentInfoScreen extends StatelessWidget {
  AppointmentInfoScreen({super.key});

  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppointmentInfoWidget(
              dayName: 'Sunday',
              startTimeTap: () async {
                await generalController.pickTime(context: context);
              },
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Monday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Wednesday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Thursday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Friday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Saturday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
            AppointmentInfoWidget(
              dayName: 'Sunday',
              startTimeTap: () {},
              endTimeTap: () {},
              availableTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}
