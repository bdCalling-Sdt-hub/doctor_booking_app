import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomFilter extends StatelessWidget {
  final TextEditingController locationController;

  const CustomFilter({
    super.key,
    required this.locationController,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController searchListController =
    Get.find<HomeController>();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CustomText(
                  text: 'Filter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackO,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Obx(() => _buildDropdown(
              label: AppStrings.categories.tr,
              value: searchListController.selectedCategory.value,
              items: searchListController.categories,
              onChanged: searchListController.updateCategory,
            )),

            SizedBox(height: 20.h),
            _buildTextField(
              label: 'Location',
              controller: locationController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
                title: AppStrings.search,
                onTap: (){
                  Get.back();
                })
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: (newValue) => onChanged(newValue ?? value),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
      ],
    );
  }
}
