import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final PaitentHomeController homeController =
      Get.find<PaitentHomeController>();

  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const PatientNavBar(currentIndex: 1),
        backgroundColor: AppColors.whiteLightActive,
        appBar: const CustomAppBar(
          appBarContent: AppStrings.favorites,
        ),
        body: Obx(() {
          switch (homeController.favouriteLoading.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  homeController.getFavouriteDocList();
                },
              );

            case Status.completed:
              return RefreshIndicator(
                onRefresh: () {
                  return homeController.getFavouriteDocList();
                },
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18.0,
                      mainAxisExtent: 250),
                  itemCount: homeController.getFavDoc.length,
                  itemBuilder: (context, index) {
                    var data = homeController.getFavDoc[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.specialistProfile,
                            arguments: homeController.getFavDoc[index]);
                      },
                      child: CustomCard(
                        isFavourite: true,
                        favouriteOntap: () {
                          generalController
                              .makeFavourite(docID: data.id ?? "")
                              .then((value) {
                            homeController.favouriteDocList.removeAt(index);
                            homeController.favouriteDocList.refresh();
                          });
                        },
                        networkImageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                        name: data.name ?? "",
                        profession: data.specialization ?? "",
                        rating: "${data.rating}",
                      ),
                    );
                  },
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10.0),
                ),
              );
          }
        }));
  }
}
