import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';

import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
        backgroundColor: AppColors.whiteLightActive,
        appBar: CustomAppBar(
          appBarContent: data['name'],
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
                favouriteOntap: () {
                                
                              },
            
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
