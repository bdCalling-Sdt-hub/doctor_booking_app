import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomPopupmenuButton extends StatelessWidget {
  const CustomPopupmenuButton({
    super.key,
    required this.onChanged,
    this.icons,
    required this.items,
  });

  final List<String> items;
  final ValueChanged<String> onChanged;
  final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.white,
      icon: Icon(
        icons ?? Icons.arrow_forward_ios,
        color: AppColors.blackNormal,
      ),
      itemBuilder: (context) => List.generate(items.length, (index) {
        return PopupMenuItem(
          onTap: () => onChanged(items[index]),
          child: CustomText(
            textAlign: TextAlign.center,
            text: items[index],
            color: AppColors.blackDarker,
          ),
        );
      }),
    );
  }
}
