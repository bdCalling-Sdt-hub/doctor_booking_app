import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingCard extends StatelessWidget {
  final String name;
  final String date;
  final String imageUrl;
  final double rating;
  final String review;

  const CustomRatingCard({
    super.key,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: AppColors.whiteNormal,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayLightHover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                boxShape: BoxShape.circle,
                imageUrl: imageUrl,
                height: 36.h,
                width: 36.h,
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grayNormal,
                    ),
                    SizedBox(height: 2.h),
                    // Row(
                    //   children: List.generate(5, (index) {
                    //     return Icon(
                    //       index < rating ? Icons.star : Icons.star_border,
                    //       color: Colors.amber,
                    //       size: 16.h,
                    //     );
                    //   }),
                    // ),
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 0,
                      ignoreGestures: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 16.h,
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      maxLines: 10,
                      text: review,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.blackO,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width:
                      10.w), // Add some space between the review and the date
              CustomText(
                text: date,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.blackO,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
