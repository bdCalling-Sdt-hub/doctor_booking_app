import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      appBar: CustomAppBar(appBarContent: AppStrings.notifications,),
      body: Column(
        children: [
          Column(
            children: [
              Container(

              )
            ],
          )
        ],
      ),
    );
  }
}
