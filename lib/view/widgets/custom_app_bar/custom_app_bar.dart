
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final String? appBarContent;
  final IconData? iconData;


  const CustomAppBar({
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = Colors.white,
    this.appBarContent,
    super.key,
    this.iconData,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(appBarWidth ?? double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsetsDirectional.only(start: 20, top: 24, end: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: widget.appBarBgColor),
        child: Row(
          children: [
            IconButton(
              icon: const CustomImage(imageSrc: AppIcons.arrowLeft),
              color: AppColors.grayNormal,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            if (widget.appBarContent != null)
              CustomText(
                text: widget.appBarContent!,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.grayNormal,
              ),

          ],
        ),
      ),
    );
  }
}