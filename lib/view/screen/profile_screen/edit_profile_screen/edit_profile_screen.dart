import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/profile_screen/profile_controller/profile_controller.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,


    );
  }
}
