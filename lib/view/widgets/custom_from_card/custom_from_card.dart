import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormCard extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool hasSuffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool hasBackgroundColor;
  final bool isMultiLine;
  final String? Function(dynamic)? validator;

  const CustomFormCard({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.hasSuffixIcon = false,
    this.readOnly = false,
    this.onTap,
    this.hasBackgroundColor = false,
    this.isMultiLine = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          bottom: 12.h,
          maxLines: 2,
        ),
        CustomTextField(
          validator: validator,
          readOnly: readOnly,
          suffixIcon:
              hasSuffixIcon ? const Icon(Icons.keyboard_arrow_down) : null,
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black),
          fillColor: hasBackgroundColor
              ? AppColors.whiteNormal
              : AppColors.whiteNormal,
          fieldBorderColor: AppColors.grayLightHover,
          keyboardType:
              isPassword ? TextInputType.visiblePassword : TextInputType.text,
          onTap: onTap,
          maxLines: isMultiLine ? 8 : 1,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
