import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/popular_doctor.dart';
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
  // ignore: library_private_types_in_public_api
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<SpecialistProfile> {
  GeneralController generalController = Get.find<GeneralController>();
  PaitentHomeController homeController = Get.find<PaitentHomeController>();
  PatientAppointmentController patientAppointmentController =
      Get.find<PatientAppointmentController>();

  int _selectedDateIndex = 0;
  int _selectedDateIndex2 = 0;
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  PopularDoctorDatum data = Get.arguments;

  @override
  void initState() {
    homeController.getAllDoc(query: data.specialization ?? "");
    generalController.getAvailableTimesForSelectedDay(
        selectedDay:
            generalController.next7Days[_selectedDateIndex]["Day"] ?? "",
        availableDays: data.availableDays!,
        selectedDateIndex: _selectedDateIndex2);

    homeController.getReview(id: "66cbf796bbca6f1b088cdf6f");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.r),
        child: CustomButton(
          onTap: () {
            Get.toNamed(AppRoutes.bookAppointmentPatientDetails,
                arguments: data);
          },
          title: AppStrings.bookAppointment,
        ),
      ),
      backgroundColor: AppColors.whiteLightActive,

      ///================================Specialist Profile=====================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.specialistProfile,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Center(
                  child: Column(
                    children: [
                      ///==================== Doctor Image ====================

                      CustomNetworkImage(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          imageUrl: "${ApiUrl.baseUrl}/${data.img ?? ""}",
                          height: 256,
                          width: 243),
                      const SizedBox(height: 16),

                      ///==================== Doctor Name ====================

                      CustomText(
                        text: data.name ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: AppColors.grayNormal,
                        bottom: 8,
                      ),

                      ///==================== Doctor Specialization ====================

                      CustomText(
                        text: data.specialization ?? "",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.whiteDarker,
                        bottom: 8,
                      ),

                      ///==================== Doctor Location ====================

                      CustomText(
                        left: 10,
                        text: data.location ?? "",
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///===================== Experience ===================

                            InfoCard(
                              label: AppStrings.experience,
                              value: data.experience ?? "",
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 3.w,
                                  color: AppColors.white,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),

                                ///================= Total Checked Paitients =================

                                const InfoCard(
                                  label: AppStrings.patientsChecked,
                                  value: '12,000+',
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 60,
                                  width: 3.w,
                                  color: AppColors.white,
                                ),
                              ],
                            ),

                            ///================= Rattings =================

                            InfoCard(
                              label: AppStrings.overallRating,
                              value: "${data.rating}/5",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),

                ///========================== Appointment Fee Section================
                const CustomRow(
                    title: AppStrings.appointmentFee, subtitle: '\$25.00'),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(generalController.next7Days.length,
                        (index) {
                      final isSelected = index == _selectedDateIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDateIndex = index;

                            //===== Get Selected Day =======
                            patientAppointmentController.selectedDay.value =
                                generalController.next7Days[index]["Day"]
                                        ?.toLowerCase() ??
                                    "";

                            //===== Get Selected Date =======
                            patientAppointmentController.selectedDate.value =
                                "${generalController.next7Days[index]["Date"] ?? ""}-${DateTime.now().month}-${DateTime.now().year} ";

                            //
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            "${generalController.next7Days[index]["Day"]} ${generalController.next7Days[index]["Date"]}",
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
                  height: 12.h,
                ),

                ///================================Available Time===================
                const CustomRow(
                    title: AppStrings.appointmentTime, subtitle: ''),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        generalController
                            .getAvailableTimesForSelectedDay(
                                selectedDay: generalController
                                        .next7Days[_selectedDateIndex]["Day"] ??
                                    "",
                                availableDays: data.availableDays,
                                selectedDateIndex: _selectedDateIndex2)
                            .length, (index) {
                      final isSelected = index == _selectedDateIndex2;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDateIndex2 = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            generalController.getAvailableTimesForSelectedDay(
                                selectedDay: generalController
                                        .next7Days[_selectedDateIndex]["Day"] ??
                                    "",
                                availableDays: data.availableDays,
                                selectedDateIndex: _selectedDateIndex2)[index],
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

                CustomRow(
                    title: AppStrings.availableFor,
                    subtitle: generalController.getAvailableFor(
                        generalController.next7Days[_selectedDateIndex]
                                ["Day"] ??
                            "",
                        data.availableFor!)),

                ///=================================Details===================
                const DetailsSection(
                  title: AppStrings.details,
                  details:
                      'Dr. Ralph is the top most Cardiologist in Care Hospital New York. He is available for private consultation.',
                ),

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
                  children:
                      List.generate(homeController.reviewList.length, (index) {
                    var data = homeController.reviewList[index];
                    return CustomRatingCard(
                        name: data.sender?.name ?? "",
                        date: DateConverter.estimatedDate(
                            data.createdAt ?? DateTime.now()),
                        imageUrl: "${ApiUrl.baseUrl}/${data.sender?.img ?? ""}",
                        rating: data.rating ?? 0.0,
                        review: data.comment ?? "");
                  }),
                ),
                //
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

                ///============================== Similar Doctor =========================
                const CustomRow(
                    title: AppStrings.similarSpecialist,
                    subtitle: AppStrings.viewAll),
                SizedBox(
                  height: 12.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(homeController.allDoctorList.length,
                        (index) {
                      var data = homeController.allDoctorList[index];
                      return CustomCard(
                          favouriteOntap: () {},
                          networkImageUrl:
                              "${ApiUrl.baseUrl}/${data.img ?? ""}",
                          name: data.name ?? "",
                          profession: data.specialization ?? "",
                          rating: data.rating.toString());
                    }),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({super.key, required this.label, required this.value});

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
