import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_card/custom_card.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_rating_card/custom_rating_card.dart';
import 'package:doctor_booking/view/widgets/custom_row/custom_row.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpecialistProfile extends StatefulWidget {
  const SpecialistProfile({super.key});

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<SpecialistProfile> {
  int _selectedDateIndex = 1;
  int _selectedDateIndex2 = 1;
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(onTap: (){
          Get.toNamed(AppRoutes.bookAppointmentPatientDetails);
        },title: AppStrings.bookAppointment,),
      ),
      backgroundColor: AppColors.whiteLightActive,
      ///================================Specialist Profile=====================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.specialistProfile,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    CustomNetworkImage(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        imageUrl: AppConstants.userNtr,
                        height: 256,
                        width: 243),
                    const SizedBox(height: 16),
                    const CustomText(
                      text: 'Ralph Edwards',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.grayNormal,
                      bottom: 8,
                    ),
                    const CustomText(
                      text: 'Cardiologist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.whiteDarker,
                      bottom: 8,
                    ),
                    const CustomText(
                      left: 10,
                      text: 'Heart Guard Hospital, New York',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.grayNormal,
                      bottom: 22,
                    ),
                    ///==========================Info card======================
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.blackLight,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _InfoCard(
                            label: AppStrings.experience,
                            value: '10+ years',
                          ),
                          _InfoCard(
                            label: AppStrings.patientsChecked,
                            value: '12,000+',
                          ),
                          _InfoCard(
                            label: AppStrings.overallRating,
                            value: '★ 4.6 ',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              ///========================== Appointment Fee Section================
       const CustomRow(title: AppStrings.appointmentFee, subtitle: '\$25.00'),
              const SizedBox(height: 8),
              const CustomText(
               top: 18,
                text: 'Schedule',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.grayNormal,
                  bottom: 8,
              ),
              const SizedBox(height: 8),
              ///==============================Schedule Section=====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  final isSelected = index == _selectedDateIndex;
                  final days = [
                    'Fri\n11',
                    'Sat\n12',
                    'Sun\n13',
                    'Mon\n14',
                    'Tue\n15',
                    'Wed\n16',
                  ];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 12.h,
              ),
             ///================================Available Time===================
             const CustomRow(title: AppStrings.appointmentTime, subtitle: ''),
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    final isSelected = index == _selectedDateIndex2;
                    final days = [
                      '10 Am',
                      '11 Am',
                      '12 Am',
                      '2 pm',
                      '4 pm',
                      '6 pm'
                    ];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateIndex2 = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          days[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 10.h,),

              const CustomRow(
                  title: AppStrings.availableFor,
                  subtitle: 'Online Appointment'),

              ///=================================Details===================
              const DetailsSection(title: AppStrings.details,
                details: 'Dr. Ralph is the top most Cardiologist in Care Hospital New York. He is available for private consultation.',),
              ///==================================Review And Rating =======================
              const CustomText(
                top: 24,
                text: AppStrings.reviewAndRating,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grayNormal,
                bottom: 10,
              ),
              Column(
                children: List.generate(_isExpanded ? 10 : 3, (index) {
                  return CustomRatingCard(
                      name: 'Masum raj',
                      date: '10/10/2023',
                      imageUrl: AppConstants.userNtr,
                      rating: 4,
                      review:
                          'Dr. Jane Smith is an exceptional doctor! She listened attentively to my concerns, provided clear explanations, and offered practical advice.');
                }),
              ),
           ///==================================View All Condition=================
              Center(
                child: GestureDetector(
                  onTap: _toggleExpanded,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: _isExpanded ? 'ViewLess' : AppStrings.viewAll,
                        color: AppColors.blackNormal,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.blackO,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ///==============================Similar Doctor=========================
              const CustomRow(
                  title: AppStrings.similarDoctors,
                  subtitle: AppStrings.viewAll),
              SizedBox(
                height: 12.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return CustomCard(
                        imageSrc: AppIcons.favoriteUnselected,
                        networkImageUrl: AppConstants.userNtr,
                        name: 'Bessie Cooper',
                        profession: 'Cardiologist',
                        rating: 4);
                  }),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}




class DetailsSection extends StatelessWidget {
  final String title;
  final String details;

  const DetailsSection({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          top: 27,
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
        CustomText(
          textAlign: TextAlign.start,
          top: 8,
          maxLines: 3,
          text: details,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteDarker,
        ),
      ],
    );
  }
}
