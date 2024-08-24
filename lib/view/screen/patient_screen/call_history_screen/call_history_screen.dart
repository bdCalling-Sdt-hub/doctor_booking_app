import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_call_history/custom_call_history.dart';

import 'package:flutter/material.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///============================Call History Appbar==================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.callHistory,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: List.generate(10, (index) {
                  return CustomCallHistory(
                      image: AppConstants.userNtr,
                      name: 'Hasibur Rashid Mah',
                      date: 'Today 08 : 30 PM');
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
