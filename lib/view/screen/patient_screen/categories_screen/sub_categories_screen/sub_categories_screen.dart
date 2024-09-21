import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/category_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/popular_doctor.dart';

import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  CategoryDatum data = Get.arguments;

  PaitentHomeController homeController = Get.find<PaitentHomeController>();
  final GeneralController generalController = Get.find<GeneralController>();

  @override
  void initState() {
    homeController.getAllDoc(query: data.name ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteLightActive,
        appBar: CustomAppBar(
          appBarContent: data.name ?? "",
        ),
        body: Obx(() {
          switch (homeController.allDocLoading.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(onTap: () {
                homeController.getAllDoc(query: data.name ?? "");
              });
            case Status.completed:
              return GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18.0,
                    mainAxisExtent: 250),
                itemCount: homeController.allDoctorList.length,
                itemBuilder: (context, index) {
                  PopularDoctorDatum docData =
                      homeController.allDoctorList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.specialistProfile,
                          arguments: docData);
                    },
                    child: CustomCard(
                      favouriteOntap: () {
                        generalController
                            .makeFavourite(docID: docData.id ?? "")
                            .then((value) {
                          if (value) {
                            homeController.allDocFavouList[index] =
                                !homeController.allDocFavouList[index];
                          }
                        });
                      },
                      isFavourite: true,
                      networkImageUrl: "${ApiUrl.baseUrl}/${docData.img ?? ""}",
                      name: docData.name ?? "",
                      profession: docData.specialization ?? "",
                      rating: docData.rating.toString(),
                    ),
                  );
                },
                shrinkWrap: true,
                padding: const EdgeInsets.all(10.0),
              );
          }
        }));
  }
}
