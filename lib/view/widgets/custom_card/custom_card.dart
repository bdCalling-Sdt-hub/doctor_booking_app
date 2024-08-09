import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageSrc;
  final String networkImageUrl;
  final String name;
  final String profession;
  final double rating;

  const CustomCard({super.key,
    required this.imageSrc,
    required this.networkImageUrl,
    required this.name,
    required this.profession,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayLightHover,
        border: Border.all(color: AppColors.grayLightHover),
      ),
      child: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: CustomImage(imageSrc: imageSrc, imageType: ImageType.svg)),
            CustomNetworkImage(imageUrl: networkImageUrl, height: 114, width: 109),
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
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
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
    );
  }
}
