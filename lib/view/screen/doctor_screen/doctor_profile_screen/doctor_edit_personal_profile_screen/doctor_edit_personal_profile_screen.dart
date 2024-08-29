import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/controller/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_edit_personal_profile_screen/inner_widget.dart/doctor_edit_profile_image.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorEditPersonalProfileScreen extends StatelessWidget {
  DoctorEditPersonalProfileScreen({super.key});

  final DoctorProfileController doctorProfileController =
      Get.find<DoctorProfileController>();
  final DoctorHomeController doctorHomeController =
      Get.find<DoctorHomeController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      /// =================== appbar ===============//
      appBar: CustomAppBar(
        buttonHare: true,
        onTap: () {
          Get.back();
          doctorProfileController.proImage.value = null;
        },
        appBarContent: AppStrings.editPersonalInformation,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              ////============== Profile image ===========///
              doctorProfileController.proImage.value == null
                  ? Center(
                      child: DoctorEditProfileImageNetwork(
                        imageSrc: doctorProfileController
                                .profileModel.value.img!
                                .startsWith('https')
                            ? doctorProfileController.profileModel.value.img ??
                                ""
                            : '${ApiUrl.imageBaseUrl}${doctorProfileController.profileModel.value.img ?? ""}',
                        onTap: () {
                          doctorProfileController.getDoctorProfileImage();
                        },
                      ),
                    )
                  : Center(
                      child: DoctorEditProfileImageFile(
                        imageSrc: doctorProfileController.proImage.value!.path,
                        onTap: () {
                          doctorProfileController.getDoctorProfileImage();
                        },
                      ),
                    ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //============== personal info =============//
                      const CustomText(
                        textAlign: TextAlign.start,
                        text: AppStrings.personalInfo,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteDarker,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 16.h,
                      ),

                      /// ============== doctor name ==========//
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.yourName,
                        controller:
                            doctorProfileController.doctorNameController.value,
                        hintTextChangeColor: true,
                        hintText: 'Dr. Hassan',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      //=============== doctor date of birth =========//
                      CustomFormCard(
                        readOnly: true,
                        hasBackgroundColor: true,
                        title: AppStrings.dateOfBirth,
                        controller: doctorProfileController
                            .doctorDateOfBirthController.value,
                        hintTextChangeColor: true,
                        hintText: '05-12-2001',
                        onTap: () async {
                          final DateTime? pickDate = await showDatePicker(
                              context: Get.context!,
                              firstDate: DateTime(1970),
                              lastDate: DateTime.now());

                          if (pickDate != null) {
                            final formatDate =
                                DateFormat.yMMMMd().format(pickDate);

                            doctorProfileController.doctorDateOfBirthController
                                .value.text = formatDate;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      // ================ doctor email ============//
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.email,
                        controller:
                            doctorProfileController.doctorEmailController.value,
                        hintTextChangeColor: true,
                        hintText: 'info@gmail.com',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),

                      /// ================== doctor phone number ==========//
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.phoneNumber,
                        controller:
                            doctorProfileController.doctorPhoneController.value,
                        hintTextChangeColor: true,
                        hintText: '(00)+5452 125 36',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),

                      /// ============== doctor loactions ==================//

                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.location,
                        controller: doctorProfileController
                            .doctorLoactionController.value,
                        hintTextChangeColor: true,
                        hintText: '775 Rolling Green Rd.',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //================ update button =============//
                      CustomButton(
                        title: AppStrings.update,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            doctorProfileController
                                .updateDoctorPersonalProfile();
                          }
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
