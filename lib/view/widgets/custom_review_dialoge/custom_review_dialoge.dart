import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomReviewDialog extends StatefulWidget {
  final VoidCallback onSubmit;
  final double initialRating;
  final TextEditingController commentController;

  const CustomReviewDialog(
      {super.key,
      required this.onSubmit,
      required this.initialRating,
      required this.commentController});

  @override
  _CustomReviewDialogState createState() => _CustomReviewDialogState();
}

class _CustomReviewDialogState extends State<CustomReviewDialog> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CustomImage(
                    imageSrc: AppIcons.close,
                    imageType: ImageType.svg,
                  ),
                ),
              ],
            ),
            const Center(
              child: Column(
                children: [
                  CustomText(
                    text: AppStrings.review,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.grayNormal,
                    bottom: 15,
                    top: 12,
                  ),
                ],
              ),
            ),
            const CustomText(
              text: AppStrings.rating,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.grayNormal,
              bottom: 15,
              top: 12,
            ),
            RatingBar.builder(
              itemSize: 30,
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                  print(_rating);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: const CustomText(
                text: 'Comments',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.grayNormal,
                bottom: 15,
                top: 12,
              ),
            ),
            CustomTextField(
              textEditingController: TextEditingController(),
              hintText: 'Write Your Review Here',
              hintStyle: const TextStyle(fontSize: 10),
              fillColor: Colors.white,
              maxLines: 4,
            ),

            ///====================Submit Button===========
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomButton(
                onTap: widget.onSubmit,
                title: AppStrings.review,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
