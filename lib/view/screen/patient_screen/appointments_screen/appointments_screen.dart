import 'package:doctor_booking/controller/patient_appointment_controller/patient_appointment_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_appointment_card/custom_appointment_card.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({super.key});

  final PatientAppointmentController patientAppointmentController =
      Get.find<PatientAppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.appointments,
      ),
      bottomNavigationBar: const PatientNavBar(currentIndex: 3),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///===========================3 Tab bar=======================
                CustomTabSelector(
                  tabs: patientAppointmentController.userList,
                  selectedIndex:
                      patientAppointmentController.selectedIndex.value,
                  onTabSelected: (index) {
                    patientAppointmentController.selectedIndex.value = index;
                    // Handle any additional actions here if needed
                  },
                  selectedColor: AppColors.blackNormal,
                  unselectedColor: AppColors.whiteDarkHover,
                ),

                ///=================================Upcoming Data==================
                patientAppointmentController.selectedIndex.value == 0
                    ? Column(
                        children: List.generate(4, (index) {
                          return CustomAppointmentCard(
                            imageUrl: AppConstants.userNtr,
                            name: 'Jenny Wilson',
                            profession: 'This is a subtitle',
                            trailing: IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {
                                // Handle trailing icon press
                              },
                            ),
                            onTap: () {
                              // Handle card tap
                            },
                            date: '02 Jun, Wed',
                            time: '10 AM',
                            location: 'Coronary Care Hospital',
                          );
                        }),
                      )
                    :

                    ///==================================Past Data=====================
                    patientAppointmentController.selectedIndex.value == 1
                        ? Column(
                            children: List.generate(4, (index) {
                              return CustomAppointmentCard(
                                imageUrl: AppConstants.userNtr,
                                name: 'Masum Raj',
                                profession: 'This is a subtitle',
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: () {
                                    // Handle trailing icon press
                                  },
                                ),
                                onTap: () {
                                  // Handle card tap
                                },
                                date: '02 Jun, Wed',
                                time: '10 AM',
                                location: 'Coronary Care Hospital',
                              );
                            }),
                          )
                        :

                        ///===============================Canceled Data=========================
                        patientAppointmentController.selectedIndex.value == 2
                            ? Column(
                                children: List.generate(4, (index) {
                                  return CustomAppointmentCard(
                                    imageUrl: AppConstants.userNtr,
                                    name: 'Rafsan Vai',
                                    profession: 'This is a subtitle',
                                    trailing: IconButton(
                                      icon: const Icon(Icons.more_vert),
                                      onPressed: () {
                                        // Handle trailing icon press
                                      },
                                    ),
                                    onTap: () {
                                      // Handle card tap
                                    },
                                    date: '02 Jun, Wed',
                                    time: '10 AM',
                                    location: 'Coronary Care Hospital',
                                  );
                                }),
                              )
                            : const SizedBox()
              ],
            ),
          ),
        );
      }),
    );
  }
}
