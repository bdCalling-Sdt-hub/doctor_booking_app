import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomReviewDialog extends StatelessWidget {
  CustomReviewDialog(
      {super.key, required this.docID, required this.appoinmentId});

  final String docID;
  final String appoinmentId;

  final PatientAppointmentController appointmentController =
      Get.find<PatientAppointmentController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: AppColors.whiteNormal,
      content: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const CustomImage(
                      imageSrc: AppIcons.close,
                      imageType: ImageType.svg,
                    ),
                  ),
                ],
              ),
              const Center(
                child: Column(
                  children: [
                    CustomText(
                      text: AppStrings.review,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.grayNormal,
                      bottom: 15,
                      top: 12,
                    ),
                  ],
                ),
              ),
              const CustomText(
                text: AppStrings.rating,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.grayNormal,
                bottom: 15,
                top: 12,
              ),
              RatingBar.builder(
                itemSize: 30,
                initialRating: 5.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 10.w,
                ),
                onRatingUpdate: (value) {
                  appointmentController.rattingvalue.value = value;
                  appointmentController.rattingvalue.refresh();
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: const CustomText(
                  text: 'Comments',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.grayNormal,
                  bottom: 15,
                  top: 12,
                ),
              ),
              CustomTextField(
                textEditingController:
                    appointmentController.commentController.value,
                //  hintText: 'Write Your Review Here',
                hintStyle: const TextStyle(fontSize: 10),
                fillColor: Colors.white,
                maxLines: 3,
              ),

              ///====================Submit Button===========
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomButton(
                  onTap: () {
                    appointmentController.makeRatting(
                        docID: docID, appointmentId: appoinmentId);
                  },
                  title: AppStrings.review,
                ),
              ),

              if (appointmentController.rattingvalue.value == 200.0)
                const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}
