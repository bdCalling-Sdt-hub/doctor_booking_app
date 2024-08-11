import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String imageSrc;
  final String networkImageUrl;
  final String name;
  final String profession;
  final double rating;

  const CustomCard({
    super.key,
    required this.imageSrc,
    required this.networkImageUrl,
    required this.name,
    required this.profession,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      width: 150.w, // Constrained width
      height: 250.h, // Constrained height
      decoration: BoxDecoration(
        color: AppColors.whiteNormal,
        border: Border.all(color: AppColors.grayLightHover),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10.h, // Positioning from the top
            left: 120.w, // Positioning from the left
            right: 0.w, // Positioning from the right
            child: CustomImage(
              imageSrc: imageSrc,
              imageType: ImageType.svg,
            ),
          ),
          Positioned(
            top: 40.h, // Adjust based on your layout
            left: 25.w,
            child: CustomNetworkImage(
              imageUrl: networkImageUrl,
              height: 114,
              width: 109,
            ),
          ),
          Positioned(
            top: 165.h, // Adjust based on your layout
            left: 25.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                  top: 5,
                ),
                CustomText(
                  text: profession,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  top: 5,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: '$rating/5.0',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                      top: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
