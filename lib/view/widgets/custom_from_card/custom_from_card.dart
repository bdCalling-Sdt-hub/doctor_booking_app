import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormCard extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool? hasSuffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool hasBackgroundColor;
  final bool isMultiLine;
  final String? Function(dynamic)? validator;
  final bool? hintTextChangeColor;

  const CustomFormCard({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.hasSuffixIcon,
    this.readOnly = false,
    this.onTap,
    this.hasBackgroundColor = false,
    this.isMultiLine = false,
    this.validator,
    this.hintText,
    this.hintTextChangeColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: hintTextChangeColor!
              ? AppColors.whiteDarker
              : AppColors.grayNormal,
          fontWeight: hintTextChangeColor! ? FontWeight.w400 : FontWeight.w500,
          fontSize: 16.sp,
          bottom: 12.h,
          maxLines: 2,
        ),
        CustomTextField(
          validator: validator,
          readOnly: readOnly,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.whiteDarkHover),
          suffixIcon: hasSuffixIcon == null
              ? null
              : hasSuffixIcon!
                  ? const Icon(Icons.keyboard_arrow_down)
                  :
                  // ignore: unnecessary_null_comparison
                  const Icon(Icons.alarm),
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: GoogleFonts.poppins(color: AppColors.grayNormal),
          fillColor: hasBackgroundColor
              ? AppColors.whiteLightActive
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
