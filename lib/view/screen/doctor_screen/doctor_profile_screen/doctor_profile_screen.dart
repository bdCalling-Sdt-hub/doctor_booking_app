import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/widget/custom_appointment_info.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});

  final DoctorProfileController doctorProfileController =
      Get.find<DoctorProfileController>();

  final String imageBaseUrl = "http://192.168.10.6:5000/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      ///================== AppBar ============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.profile,
      ),
      //=================== body ==============//
      body: Obx(() {
        switch (doctorProfileController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader(); // Consider adding an error message here
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                doctorProfileController.getDoctorProfile();
              },
            );
          case Status.completed:
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    //=========================== Doctor profile image ====================//
                    CustomNetworkImage(
                      imageUrl: doctorProfileController.profileModel.value.img!
                              .startsWith('http')
                          ? doctorProfileController.profileModel.value.img ?? ""
                          : '$imageBaseUrl${doctorProfileController.profileModel.value.img ?? ""}',
                      height: 90.h,
                      width: 90.w,
                      boxShape: BoxShape.circle,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: AppStrings.personalInfo,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteDarker,
                              ),
                              // ================= personal info screen button ==========//
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.doctorEditPersonalProfileScreen,
                                  );
                                },
                                child: const CustomImage(
                                  imageSrc: AppIcons.edit,
                                  imageType: ImageType.png,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: Container(
                              width: 335.w,
                              height: 2,
                              color: AppColors.whiteNormalHover,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          // ============== doctor name ===============//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.yourName,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.name ??
                                '',
                          ),
                          //============== doctor date of birth =============\\
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.dateOfBirth,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.dateOfBirth ??
                                '',
                          ),
                          //============ doctor email ==============//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.email,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                .profileModel.value.email,
                          ),
                          //============ doctor phnoe number ===========//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.phoneNumber,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                .profileModel.value.phone,
                          ),

                          ///=============== doctor loaction ============//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.location,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                .profileModel.value.location,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //===========professional info ==========//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: AppStrings.professionalInfo,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteDarker,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes
                                      .doctorEditProfessinalProfileScreen);
                                },
                                child: const CustomImage(
                                  imageSrc: AppIcons.edit,
                                  imageType: ImageType.png,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: Container(
                              width: 335.w,
                              height: 2,
                              color: AppColors.whiteNormalHover,
                            ),
                          ),
                          //=============== doctor medical licence image =============//
                          CustomText(
                            top: 8.h,
                            bottom: 8.h,
                            text: AppStrings.medicalLicenceImage,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteDarker,
                          ),

                          CustomNetworkImage(
                            imageUrl: doctorProfileController
                                    .profileModel.value.img!
                                    .startsWith('http')
                                ? doctorProfileController
                                        .profileModel.value.license ??
                                    ""
                                : '$imageBaseUrl${doctorProfileController.profileModel.value.license ?? ""}',
                            height: 120.h,
                            width: 335.w,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          //============ doctor specilization ============//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.specialization,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.specialization ??
                                '',
                          ),
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.yearsOfExperience,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.experience ??
                                '',
                          ),

                          ///============================= Education Background ===============================

                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.educationalBackground,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.educationalBackground ??
                                '',
                          ),
                          //================= doctor currentAffiliation =============//
                          CustomFormCard(
                            hasBackgroundColor: true,
                            title: AppStrings.currentAffiliation,
                            controller: TextEditingController(),
                            hintTextChangeColor: true,
                            readOnly: true,
                            hintText: doctorProfileController
                                    .profileModel.value.currentAffiliation ??
                                '',
                          ),
                          //========================= Appointment info ===============================
                          SizedBox(
                            height: 12.h,
                          ),
                          //=========== Appointment info ==========//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: AppStrings.appointmentInfo,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteDarker,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.appointmentEditInfoScreen);
                                },
                                child: const CustomImage(
                                  imageSrc: AppIcons.edit,
                                  imageType: ImageType.png,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: Container(
                              width: 335.w,
                              height: 2,
                              color: AppColors.whiteNormalHover,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),

                          ///================================= Sunday =============================
                          doctorProfileController
                                      .sundayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Sunday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.sunday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.sunday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .sunday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.sunday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Monday =============================
                          doctorProfileController
                                      .mondayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Monday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.monday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.monday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .monday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.monday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Tuesday =============================
                          doctorProfileController
                                      .tuesdayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Tuesday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.tuesday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.tuesday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .tuesday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.tuesday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Wednesday =============================
                          doctorProfileController
                                      .weddayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Wednesday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.wednesday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.wednesday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .wednesday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.wednesday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Thursday =============================
                          doctorProfileController
                                      .thursdayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Thursday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.thursday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.thursday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .thursday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.thursday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Friday =============================
                          doctorProfileController
                                      .fridayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Friday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.friday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.friday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .friday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.friday ?? ''}",
                                )
                              : const SizedBox(),

                          ///================================= Saturday =============================
                          doctorProfileController
                                      .saturdayTypeController.value.text !=
                                  AppStrings.weekend
                              ? CustomAppointmentInfo(
                                  dayName: 'Saturday',
                                  startTimeTap: () async {},
                                  endTimeTap: () async {},
                                  availableTab: (value) {},
                                  startController: TextEditingController(),
                                  endController: TextEditingController(),
                                  readOnly: true,
                                  startTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.saturday?[0] ??
                                      '',
                                  endTimeHintText: doctorProfileController
                                          .profileModel
                                          .value
                                          .availableDays
                                          ?.saturday?[doctorProfileController
                                              .profileModel
                                              .value
                                              .availableDays!
                                              .saturday!
                                              .length -
                                          1] ??
                                      '',
                                  typeHintText:
                                      "Appointment type: ${doctorProfileController.profileModel.value.availableFor?.saturday ?? ''}",
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      }),
      bottomNavigationBar: const DoctorNavBar(currentIndex: 4),
    );
  }
}
