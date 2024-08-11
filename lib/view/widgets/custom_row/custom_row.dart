import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_spacer_widget/custom_spacer_widget.dart';
import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap; // Made onTap optional with a nullable type
  const CustomRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap, // Optional onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.grayNormal,
        ),
        const SpacerWidget(),
        GestureDetector(
          onTap: onTap ??
              () {}, // Provide a default no-op function if onTap is null
          child: CustomText(
            text: subtitle,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.blackNormal,
          ),
        ),
      ],
    );
  }
}
