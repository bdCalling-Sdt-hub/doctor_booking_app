import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_row/custom_row.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RescheduleAppoinmentScreen extends StatefulWidget {
  const RescheduleAppoinmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RescheduleAppoinmentScreenState createState() =>
      _RescheduleAppoinmentScreenState();
}

class _RescheduleAppoinmentScreenState
    extends State<RescheduleAppoinmentScreen> {
  int _selectedDateIndex = 1;
  int _selectedDateIndex2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          onTap: () {
            Get.toNamed(AppRoutes.bookAppointmentPatientDetails);
          },
          title: AppStrings.bookAppointment,
        ),
      ),
      backgroundColor: AppColors.whiteLightActive,

      ///================================Specialist Profile=====================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.rescheduleAppointment,
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
                  ],
                ),
              ),
              SizedBox(height: 18.h),

              ///========================== Appointment Fee Section================
              // const CustomRow(
              //     title: AppStrings.appointmentFee, subtitle: '\$25.00'),
              const SizedBox(height: 8),
              const CustomText(
                top: 18,
                text: 'Reschedule Date',
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
              const CustomRow(title: AppStrings.availAbleTime, subtitle: ''),
              SizedBox(
                height: 10.h,
              ),
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
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              const CustomRow(
                  title: AppStrings.availableFor,
                  subtitle: 'Online Appointment'),

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
