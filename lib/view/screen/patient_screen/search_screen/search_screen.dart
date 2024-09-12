import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final PaitentHomeController homeController =
      Get.find<PaitentHomeController>();
  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.search,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///====================== Search Box ======================

              CustomTextField(
                textEditingController: homeController.searchController.value,
                onFieldSubmitted: (query) {
                  homeController.getAllDoc(query: query, isSearch: true);
                  homeController.isSearch.value = true;
                },
                isPrefixIcon: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Icon(
                    Icons.search,
                    color: AppColors.whiteDarkActive,
                  ),
                ),
                hintText: AppStrings.whatAreYouLookingFor,
                hintStyle: const TextStyle(color: AppColors.whiteDarkActive),
                fillColor: AppColors.white,
                fieldBorderColor: AppColors.grayLightHover,
              ),

              if (homeController.isSearch.value &&
                  homeController.allDoctorList.isNotEmpty)
                TextButton(
                    onPressed: () {
                      homeController.searchController.value.clear();
                      homeController.allDoctorList.clear();
                    },
                    child: const CustomText(text: AppStrings.clear)),

              ///====================== Results =========================
              Expanded(
                  child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18.0,
                    mainAxisExtent: 260),
                itemCount: homeController.allDoctorList.length,
                itemBuilder: (context, index) {
                  var data = homeController.allDoctorList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.specialistProfile, arguments: data);
                    },
                    child: CustomCard(
                      favouriteOntap: () {
                        generalController
                            .makeFavourite(docID: data.id ?? "")
                            .then((value) {
                          if (value) {
                            homeController.allDocFavouList[index] =
                                !homeController.allDocFavouList[index];

                            homeController.allDocFavouList.refresh();
                          }
                        });
                      },
                      isFavourite: homeController.allDocFavouList[index],
                      networkImageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                      name: data.name ?? "",
                      profession: data.specialization ?? "",
                      rating: data.rating.toString(),
                    ),
                  );
                },
              ))
            ],
          );
        }),
      ),
    );
  }
}
