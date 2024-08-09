import 'package:doctor_booking/controller/hospital_controller/hospital_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalScreen extends StatelessWidget {
   HospitalScreen({super.key});

final HospitalController hospitalController = Get.find<HospitalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.hospitals,
      ),
      bottomNavigationBar: const PatientNavBar(currentIndex: 2),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
        ),
        itemCount: hospitalController.hospitals.length,
        itemBuilder: (context, index) {
          return customHospital(
            image:hospitalController. hospitals[index]['image']!,
            name: hospitalController.hospitals[index]['name']!,
          );
        },
      ),
    );
  }

   Widget customHospital({
     required String image,
     required String name,
   }) =>
       Column(
         children: [
           CustomNetworkImage(
             borderRadius: const BorderRadius.all(Radius.circular(12)),
             imageUrl: image,
             height: 160,
             width: 162,
           ),
           Expanded(
             child: CustomText(
               text: name,
               fontWeight: FontWeight.w400,
               fontSize: 16,
               color: AppColors.grayNormal,
               top: 10,
             ),
           ),
         ],
       );
}
