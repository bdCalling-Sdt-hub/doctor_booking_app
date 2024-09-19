import 'package:doctor_booking/controller/calls_controller.dart/calls_controller.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/model/calls_history_model/calls_history_model.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';

import 'package:doctor_booking/view/screen/doctor_screen/call_screen/inner_widget/scearch_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_call_history/custom_call_history.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../service/api_url.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  final CallsController callsController = Get.find<CallsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 2),
      appBar: const CustomAppBar(
        appBarContent: AppStrings.callHistory,
      ),
      body: Obx(() {
        return RefreshIndicator(
          backgroundColor: AppColors.blackNormal,
          color: AppColors.white,
          onRefresh: () => callsController.getDoctorCallHistory(),
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
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    // reverse: true,
                    controller: callsController.callsScrollControloler.value,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: callsController.doctorCallHistoryList.length,
                    itemBuilder: (context, index) {
                      DoctorCallHistoryModel model =
                          callsController.doctorCallHistoryList[index];
                      return callsController.isLoadMoreRunning.value == false
                          ? CustomCallHistory(
                              image:
                                  "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                              name: model.userId?.name ?? '',
                              date: model.createdAt == null
                                  ? ""
                                  : DateConverter.formatCallsDateTime(
                                      model.createdAt!),
                              moreButton: () {
                                if (model.id != null) {
                                  callsController.deleteSingalCallHistory(
                                      id: model.id!);
                                }
                              },
                            )
                          : const CustomLoader();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
