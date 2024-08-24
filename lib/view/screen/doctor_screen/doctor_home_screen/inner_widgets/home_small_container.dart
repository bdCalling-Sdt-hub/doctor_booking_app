import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeSmallContainer extends StatelessWidget {
//   const HomeSmallContainer({
//     super.key,
//     required this.bgColor,
//     required this.textColor,
//     required this.title,
//     required this.onTap,
//     required this.borderColor,
//   });

//   final Color bgColor;
//   final Color textColor;
//   final String title;
//   final VoidCallback onTap;
//   final Color borderColor;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 36.h,
//         width: 98.w,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: bgColor,
//             border: Border.all(
//               width: 2,
//               color: borderColor,
//             )),
//         child: CustomText(
//           text: title,
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           color: textColor,
//         ),
//       ),
//     );
//   }
// }

class HomeSmallContainer extends StatelessWidget {
  const HomeSmallContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  final String title;
  final VoidCallback onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36.h,
        width: 98.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isActive ? AppColors.blackNormal : AppColors.blackLight,
            border: Border.all(
              width: 2,
              color: isActive ? Colors.transparent : AppColors.grayLightHover,
            )),
        child: CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: isActive ? AppColors.whiteNormal : AppColors.blackNormal,
        ),
      ),
    );
  }
}
