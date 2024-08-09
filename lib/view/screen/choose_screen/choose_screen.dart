import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/custom_radio_button/custom_radio_button.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  String _selectedOption = 'Health Professional';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const CustomImage(
              imageSrc: AppImages.ilera,
              imageType: ImageType.png,
            ),
            const CustomText(
              top: 32,
                bottom: 98,
                text: AppStrings.choseYourRole,
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColors.grayNormal),
            CustomRadioButton(
              value: 'Patient',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            SizedBox(
              height: 10.h
            ),
            CustomRadioButton(
              value: 'Health Professional',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            SizedBox(
                height: 30.h
            ),
            CustomButton(
              title: AppStrings.continues,
                onTap: (){
              Get.toNamed(AppRoutes.signInScreen);

            })
          ],
        ),
      ),
    );
  }
}
