import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppointmentInfo extends StatelessWidget {
  CustomAppointmentInfo({
    super.key,
    required this.dayName,
    required this.startTimeTap,
    required this.endTimeTap,
    required this.availableTab,
    this.startTimeHintText,
    this.endTimeHintText,
    this.startController,
    this.endController,
    this.isClosed = false,
    this.readOnly = false,
  });

  final String dayName;
  final VoidCallback startTimeTap;
  final VoidCallback endTimeTap;
  final Function(String?)? availableTab;
  final String? startTimeHintText;
  final String? endTimeHintText;
  final TextEditingController? startController;
  final TextEditingController? endController;
  final bool isClosed;
  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();

  final bool? readOnly;

  final List<String> genderItems = ['OFFLINE', 'ONLINE', "WEEKEND"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '${AppStrings.daysOfWeek} $dayName',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.grayNormal,
        ),
        SizedBox(
          height: 16.h,
        ),

        ////============================ Available For =============================

        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // Add more decoration..
          ),
          hint: const Text(
            'Select Your Appointment Type',
            style: TextStyle(fontSize: 14),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: !readOnly! ? availableTab : (value) {},
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),

        SizedBox(
          height: 12.h,
        ),

        ////============================ Available Time =============================

        if (!isClosed)
          Row(
            children: [
              Flexible(
                child: CustomFormCard(
                  hasSuffixIcon: false,
                  readOnly: true,
                  hintText: startTimeHintText ?? 'Input time',
                  hasBackgroundColor: true,
                  title: 'Start Time',
                  controller: startController ?? TextEditingController(),
                  onTap: startTimeTap,
                ),
              ),
              SizedBox(
                width: 5.h,
              ),
              Flexible(
                child: CustomFormCard(
                  hintText: endTimeHintText ?? 'Input time',
                  hasBackgroundColor: true,
                  title: 'End Time',
                  controller: endController ?? TextEditingController(),
                  readOnly: true,
                  hasSuffixIcon: false,
                  onTap: endTimeTap,
                ),
              ),
            ],
          ),

        const Divider(),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
