import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class PatientDetailsContainer extends StatelessWidget {
  const PatientDetailsContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
