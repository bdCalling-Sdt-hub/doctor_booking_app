import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: CustomAppBar(
        appBarContent: AppStrings.search,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextField(
              isPrefixIcon: true,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.search,
                  color: AppColors.whiteDarkActive,
                ),
              ),
              hintText: AppStrings.whatAreYouLookingFor,
              hintStyle: TextStyle(color: AppColors.whiteDarkActive),
              fillColor: AppColors.white,
              fieldBorderColor: AppColors.grayLightHover,
            )
          ],
        ),
      ),
    );
  }
}
