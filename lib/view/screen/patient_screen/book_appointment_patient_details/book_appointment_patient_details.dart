import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/inner_widget.dart/patient_card.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/popular_doctor.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookAppointmentPatientDetails extends StatelessWidget {
  BookAppointmentPatientDetails({super.key});

  // final controller = Get.find<GeneralController>();

  final PopularDoctorDatum data = Get.arguments;

  final GeneralController generalController = Get.find<GeneralController>();

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();

  //  final AppointmentController appointmentController = Get.find<AppointmentController>();

  final PatientAppointmentController appointmentController =
      Get.find<PatientAppointmentController>();

  @override
  Widget build(BuildContext context) {
    final data = profileController.profileData.value;

    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      //=================== app bar ===================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.patientDetails,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9.h,
                    ),
                    //===================== patient card ==================//
                    PatientCard(
                      imageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                      patientName: data.name ?? "",
                      patientAge: data.dateOfBirth ?? "",
                      // DateConverter.getAge(dOB: data.dateOfBirth ?? ""),
                      patientGender: 'Male',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      child: CustomText(
                        text: AppStrings.reasonOfVisit,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),

                    ///================= Reason Of Visit ===================

                    CustomTextField(
                      textEditingController:
                          appointmentController.resonOfVisitController.value,
                      isDense: true,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),

                    //================= Describe Problem =============//
                    SizedBox(
                      child: CustomText(
                        text: AppStrings.describeProblem,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    //================= Describe Problem =============//

                    CustomTextField(
                      textEditingController:
                          appointmentController.resonOfVisitController.value,
                      isDense: true,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    //=============== atach reports & previous ==============///
                    SizedBox(
                      child: CustomText(
                        text: AppStrings.attachReportsAndPrevious,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    CustomText(
                      text: 'JPG, PNG, PDF',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grayNormal,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    //================= Reports Image and remove Button ===============//

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                                generalController.selectedImagesMulti.length,
                                (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10.w),
                                height: 100.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(generalController
                                            .selectedImagesMulti[index].path))),

                                //========== Remove Img Button ==========

                                child: IconButton(
                                    onPressed: () {
                                      generalController.selectedImagesMulti
                                          .removeAt(index);

                                      generalController.selectedImagesMulti
                                          .refresh();
                                    },
                                    icon: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                      ),
                                    )),
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),

                          //============================= Add image container =======================//

                          InkWell(
                            onTap: () {
                              //generalController.selectedImagesMulti();
                              generalController.pickMultiImage();
                            },
                            child: Container(
                              height: 100.h,
                              width: 100.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.blackNormal,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 30.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 60.h,
                    ),

                    /// ======================= Book button ==============//
                    CustomButton(
                      title: AppStrings.bookAppointment,
                      onTap: () {
                        appointmentController.bookAppoinment(
                          doctorID: data.id ?? "",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CustomPateintDetailsImage extends StatelessWidget {
  const CustomPateintDetailsImage(
      {super.key, required this.imageUrl, this.onTap});

  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 70.h,
          width: 70.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomNetworkImage(
              imageUrl: imageUrl,
              height: 60.h,
              width: 60.w,
              borderRadius: BorderRadius.circular(4.h),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.blackNormal,
              child: CustomImage(
                imageSrc: AppIcons.close,
                imageColor: AppColors.white,
                size: 10.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
