import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isBorder;
  final double? height;  // Changed from bool to double
  final double? weight;  // Changed from bool to double

  const CustomContainer({
    super.key,
    required this.child,
    required this.color,
    this.isBorder = false, this.height, this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isBorder ? AppColors.white : AppColors.whiteDarkActive)),
      child: child,
    );
  }
}