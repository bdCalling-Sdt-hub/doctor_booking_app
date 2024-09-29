import 'package:doctor_booking/controller/general_controller/general_controller.dart';
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

  final String title = Get.arguments[0];
  final bool isPopular = Get.arguments[1];

  final GeneralController generalController = Get.find<GeneralController>();

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
            itemCount: isPopular
                ? homeController.popularDoctorList.length
                : homeController.recomemdedDoctorList.length,
            itemBuilder: (context, index) {
              var data = isPopular
                  ? homeController.popularDoctorList[index]
                  : homeController.recomemdedDoctorList[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.specialistProfile, arguments: data);
                },
                child: Obx(() {
                  return CustomCard(
                    isFavourite: isPopular
                        ? homeController.popuDocFavouList[index]
                        : homeController.recomemdedDocFavouList[index],
                    favouriteOntap: () {
                      generalController
                          .makeFavourite(docID: data.id ?? "")
                          .then((value) {
                        if (value) {
                          if (isPopular) {
                            homeController.popuDocFavouList[index] =
                                !homeController.popuDocFavouList[index];
                          } else {
                            homeController.recomemdedDocFavouList[index] =
                                !homeController.recomemdedDocFavouList[index];
                          }
                        }
                      });
                    },
                    networkImageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                    name: data.name ?? "",
                    profession: data.specialization ?? "",
                    rating: data.rating.toString(),
                  );
                }),
              );
            },
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
          );
        }));
  }
}
