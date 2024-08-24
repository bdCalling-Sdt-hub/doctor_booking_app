import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class ScearchCard extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool hasSuffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool hasBackgroundColor;
  final bool isMultiLine;
  final String? Function(dynamic)? validator;
  final bool? hintTextChangeColor;
  final Widget? prefixIcon;

  const ScearchCard({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.hasSuffixIcon = false,
    this.readOnly = false,
    this.onTap,
    this.hasBackgroundColor = false,
    this.isMultiLine = false,
    this.validator,
    this.hintText,
    this.hintTextChangeColor = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: validator,
      readOnly: readOnly,
      hintText: hintText,
      hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.whiteDarkHover),
      prefixIcon: prefixIcon,
      suffixIcon: hasSuffixIcon ? const Icon(Icons.keyboard_arrow_down) : null,
      isPassword: isPassword,
      textEditingController: controller,
      inputTextStyle: const TextStyle(color: AppColors.grayNormal),
      fillColor: hasBackgroundColor
          ? AppColors.whiteLightActive
          : AppColors.whiteNormal,
      fieldBorderColor: AppColors.grayLightHover,
      keyboardType:
          isPassword ? TextInputType.visiblePassword : TextInputType.text,
      onTap: onTap,
      maxLines: isMultiLine ? 8 : 1,
    );
  }
}
