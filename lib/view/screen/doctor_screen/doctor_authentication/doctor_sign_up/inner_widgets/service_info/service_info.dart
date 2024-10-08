import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceInfo extends StatefulWidget {
  const ServiceInfo({super.key});

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  DoctorAuthController authController = Get.find<DoctorAuthController>();

  // List to store a GlobalKey for each form
  List<GlobalKey<FormState>> formKeys = [];

  // Method to generate JSON for each service
  List<Map<String, String>> getServiceJson() {
    List<Map<String, String>> services = [];
    for (int i = 0; i < authController.serviceName.length; i++) {
      services.add({
        "name": authController.serviceName[i].text,
        "price": authController.servicePrice[i].text,
      });
    }
    return services;
  }

  List<Widget> serviceFields(
      {required TextEditingController serviceNameController,
      required TextEditingController servicePriceController,
      required int index}) {
    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: formKeys[index], // Assign a unique form key for each field
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a service name';
                    }
                    return null;
                  },
                  textEditingController: serviceNameController,
                  hintText: "Service name",
                  hintStyle: const TextStyle(color: AppColors.eyeColor),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a service price';
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return 'Only numbers are allowed';
                    }
                    if (number < 0) {
                      return 'Price cannot be negative';
                    }
                    return null;
                  },
                  textEditingController: servicePriceController,
                  hintText: "Service price",
                  hintStyle: const TextStyle(color: AppColors.eyeColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (authController.serviceName.length > index &&
                        authController.servicePrice.length > index) {
                      authController.serviceName.removeAt(index);
                      authController.servicePrice.removeAt(index);
                      formKeys
                          .removeAt(index); // Remove the corresponding form key
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              )
            ],
          ),
        ),
      ),
    ];
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ------------------- Add More Service -------------------

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  authController.serviceName.add(TextEditingController());
                  authController.servicePrice.add(TextEditingController());
                  formKeys.add(GlobalKey<FormState>()); // Add a unique form key
                });
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.blackDarker,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                child: const CustomText(
                  text: "Add Service",
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        if (authController.serviceName.isNotEmpty &&
            authController.servicePrice.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  authController
                      .serviceName.length, // Ensure we don't go out of bounds
                  (index) {
                    return serviceFields(
                      index: index,
                      serviceNameController: authController.serviceName[index],
                      servicePriceController:
                          authController.servicePrice[index],
                    ).first; // Always return the first widget (Row) from serviceFields
                  },
                ),
              ),
            ),
          ),

        ///================================= Sign up Button ============================

        authController.signUpLoading.value
            ? const CustomLoader()
            : CustomButton(
                onTap: () {
                  // Validate all forms before submitting
                  bool allFormsValid = true;
                  for (var key in formKeys) {
                    if (!key.currentState!.validate()) {
                      allFormsValid = false;
                      break;
                    }
                  }
                  if (allFormsValid) {
                    // Extract services as JSON
                    List<Map<String, String>> services = getServiceJson();

                    authController.doctorSignUp(services: services);
                  }
                },
                title: AppStrings.signUp,
              ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: AppStrings.alreadyHaveAAccount,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.signInScreen);
              },
              child: const CustomText(
                left: 8,
                text: AppStrings.signIn,
                color: AppColors.bluNormalHover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
