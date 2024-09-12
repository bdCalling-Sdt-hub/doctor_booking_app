import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String networkImageUrl;
  final String name;
  final String profession;
  final String rating;
  final bool isFavourite;
  final void Function() favouriteOntap;

  const CustomCard({
    super.key,
    required this.networkImageUrl,
    required this.name,
    required this.profession,
    required this.rating,
    this.isFavourite = false,
    required this.favouriteOntap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      width: 150.w, // Constrained width
      height: 230.h, // Constrained height
      decoration: BoxDecoration(
        color: AppColors.whiteNormal,
        border: Border.all(color: AppColors.grayLightHover),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () => favouriteOntap(),
                icon: CustomImage(
                  imageSrc: isFavourite
                      ? AppIcons.favoriteSelected
                      : AppIcons.favoriteUnselected,
                  imageType: ImageType.svg,
                )),
          ),
          //         CustomNetworkImage(
          //             imageUrl: imageSrc, height: 120, width: 120)),
          CustomNetworkImage(
            imageUrl: networkImageUrl,
            height: 114,
            width: 109,
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
                top: 3,
              ),
              CustomText(
                text: profession,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey.shade600,
                top: 3,
              ),
              // SizedBox(
              //   height: 5.h,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText(
                    text: '$rating/5',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                    top: 5,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
