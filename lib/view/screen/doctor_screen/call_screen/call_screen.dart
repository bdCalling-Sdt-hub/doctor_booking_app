import 'package:doctor_booking/controller/calls_controller.dart/calls_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';

import 'package:doctor_booking/view/screen/doctor_screen/call_screen/inner_widget/scearch_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_call_history/custom_call_history.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  final CallsController callsController = Get.find<CallsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 2),
      appBar: const CustomAppBar(
        appBarContent: AppStrings.todaysCalls,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  ScearchCard(
                    controller: TextEditingController(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.whiteDarker,
                    ),
                    hintText: AppStrings.searchHere,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                    child: Obx(() {
                      return CustomTabSelector(
                        tabs: callsController.callsTabList,
                        selectedIndex: callsController.callsTabIndex.value,
                        onTabSelected: (value) {
                          callsController.callsTabIndex.value = value;
                        },
                        selectedColor: AppColors.grayNormal,
                        unselectedColor: AppColors.whiteNormalHover,
                        isTextColorActive: true,
                        textColor: AppColors.grayNormal,
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: List.generate(
                        10,
                        (index) => CustomCallHistory(
                              image: AppConstants.userNtr,
                              name: 'Hasibul Hasan Santo',
                              date: 'Today 08 : 30 PM',
                              moreButton: () {},
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
