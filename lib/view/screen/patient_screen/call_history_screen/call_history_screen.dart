import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/call_history_screen/controller/call_history_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_call_history/custom_call_history.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHistoryScreen extends StatelessWidget {
  CallHistoryScreen({super.key});

  final CallHistoryController historyController =
      Get.find<CallHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///============================Call History Appbar==================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.callHistory,
      ),
      body: Obx(() {
        switch (historyController.loading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(onTap: () {
              historyController.getCallList();
            });
          case Status.completed:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                          historyController.callHistoryList.length, (index) {
                        var data =
                            historyController.callHistoryList[index].doctorId;
                        return CustomCallHistory(
                          image: "${ApiUrl.baseUrl}/${data?.img}",
                          name: data?.name ?? "",
                          date: DateConverter.estimatedDate(historyController
                                  .callHistoryList[index].createdAt ??
                              DateTime.now()),
                          moreButton: () {
                            historyController.removeCallHistory(
                                callID: historyController
                                        .callHistoryList[index].id ??
                                    "",
                                index: index);
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
