import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppointmentCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String profession;
  final String date;
  final String time;
  final String type;
  final String appoinmentStatus;
  final bool paymentStatus;
  final String appoinmentType;

  final String location;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomAppointmentCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.profession,
    this.trailing,
    this.onTap,
    required this.date,
    required this.time,
    required this.location,
    required this.type,
    required this.appoinmentStatus,
    required this.paymentStatus,
    required this.appoinmentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteNormal,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grayLightHover,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomNetworkImage(
                  boxShape: BoxShape.circle,
                  imageUrl: imageUrl,
                  height: 48,
                  width: 48),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grayNormal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profession,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteDarker,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          Row(
            children: [
              const CustomText(
                top: 7,
                text: AppStrings.appointmentTime,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.whiteDarker,
              ),
              CustomText(
                left: 10,
                top: 7,
                text: date,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.grayNormal,
              ),
              SizedBox(
                width: 7.w,
              ),
              const CustomText(
                text: '.',
                fontSize: 20,
                color: AppColors.blackDarker,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                left: 10,
                top: 7,
                text: time,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.grayNormal,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              const CustomImage(imageSrc: AppIcons.location),
              CustomText(
                left: 5,
                text: location,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grayNormal,
              ),
              CustomText(
                left: 5,
                text: "Type: $type",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.grayNormal,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),

          //====================== Calling/Payment Button ========================
          if (appoinmentStatus == AppStrings.accepted &&
              appoinmentType == "ONLINE" &&
              paymentStatus)
            CustomButton(
              onTap: () {
                onTap!();
              },
              // fillColor: AppColors.bluNormalHover.withOpacity(.7),
              title: AppStrings.videoCall,
            ),

          if (!paymentStatus && appoinmentStatus == AppStrings.accepted)
            CustomButton(
              onTap: () {
                onTap!();
              },
              // fillColor: AppColors.bluNormalHover.withOpacity(.7),
              title:
                  paymentStatus ? AppStrings.videoCall : AppStrings.makePayment,
            ),
        ],
      ),
    );
  }
}
