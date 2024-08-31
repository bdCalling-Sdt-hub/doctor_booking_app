import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';

import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const PatientNavBar(currentIndex: 1),
        backgroundColor: AppColors.whiteLightActive,
        appBar: const CustomAppBar(
          appBarContent: AppStrings.favorites,
        ),
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 18.0, mainAxisExtent: 250),
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.specialistProfile);
              },
              child: CustomCard(
                imageSrc: AppIcons.favoriteUnselected,
                networkImageUrl: AppConstants.userNtr,
                name: 'Jenny Wilson',
                profession: 'Gynecologists',
                rating: "4.7",
              ),
            );
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
        ));
  }
}
