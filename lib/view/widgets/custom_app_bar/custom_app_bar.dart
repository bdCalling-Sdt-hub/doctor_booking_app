import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final String? appBarContent;
  final IconData? iconData;
  final bool? buttonHare;
  final bool showBackButton;

  final VoidCallback? onTap;

  const CustomAppBar({
    this.showBackButton = true,
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = Colors.white,
    this.appBarContent,
    super.key,
    this.iconData,
    this.buttonHare = false,
    this.onTap,
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
        padding: EdgeInsetsDirectional.only(top: 24.h, end: 20.h),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: widget.appBarBgColor),
        child: Row(
          children: [
            if (widget.showBackButton)
              IconButton(
                icon: const CustomImage(imageSrc: AppIcons.arrowLeft),
                color: AppColors.grayNormal,
                onPressed: widget.buttonHare!
                    ? widget.onTap
                    : () {
                        Navigator.of(context).pop();
                      },
              ),
            if (widget.appBarContent != null)
              CustomText(
                left: widget.showBackButton ? 0 : 20,
                text: widget.appBarContent!,
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: AppColors.grayNormal,
              ),
          ],
        ),
      ),
    );
  }
}
