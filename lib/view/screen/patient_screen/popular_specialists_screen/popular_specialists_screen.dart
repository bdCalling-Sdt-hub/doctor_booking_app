import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularSpecialistsScreen extends StatelessWidget {
  PopularSpecialistsScreen({super.key});

  final PaitentHomeController homeController =
      Get.find<PaitentHomeController>();

  final String title = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteLightActive,
        appBar: CustomAppBar(
          appBarContent: title,
        ),
        body: Obx(() {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 18.0, mainAxisExtent: 250),
            itemCount: homeController.popularDoctorList.length,
            itemBuilder: (context, index) {
              var data = homeController.popularDoctorList[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.specialistProfile, arguments: data);
                },
                child: CustomCard(
                  imageSrc: "",
                  networkImageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                  name: data.name ?? "",
                  profession: data.specialization ?? "",
                  rating: data.rating.toString(),
                ),
              );
            },
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
          );
        }));
  }
}
