import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_payment_screen/information_screen/inner_widget/Image_container.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_payment_screen/payment_controller/doctor_payment_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({super.key});

  final DoctorPaymentController paymentController =
      Get.find<DoctorPaymentController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.information,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(() {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.cardholdersName,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayNormal,
                    top: 22.h,
                    bottom: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //====================== Font image container ===========================//
                      Flexible(
                        child: ImageContainer(
                          text: AppStrings.front,
                          image: AppIcons.gallery,
                          onTap: () => paymentController.getPaymentCard(
                              imageType: AppStrings.front),
                          getFileImage:
                              paymentController.frontImageFile.value == null
                                  ? false
                                  : true,
                          fileImagePath:
                              paymentController.frontImageFile.value?.path ??
                                  '',
                        ),
                      ),
                      //=========================== Back image container  ===============================//
                      Flexible(
                        child: ImageContainer(
                          text: AppStrings.back,
                          image: AppIcons.gallery,
                          onTap: () => paymentController.getPaymentCard(
                              imageType: AppStrings.back),
                          getFileImage:
                              paymentController.backImageFile.value == null
                                  ? false
                                  : true,
                          fileImagePath:
                              paymentController.backImageFile.value?.path ?? '',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomFormCard(
                    title: AppStrings.accountName,
                    controller: paymentController.nameController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //========================== Date of birth field =======================
                  CustomFormCard(
                    title: AppStrings.dateofBirth,
                    controller: paymentController.dateOfbirthController.value,
                    hasBackgroundColor: true,
                    hintText: '05-12-2024',
                    readOnly: true,
                    onTap: () => paymentController.getDateOfBirth(),
                    hasSuffixIcon: false,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //===========================n Address city field =========================
                  CustomFormCard(
                    title: AppStrings.addressCity,
                    controller: paymentController.addressCityController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),

                  ///========================== Address country field =====================
                  CustomFormCard(
                    title: AppStrings.addressCountry,
                    controller:
                        paymentController.addressCountryController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //========================= Address postal code ========================
                  CustomFormCard(
                    title: AppStrings.addressPostalCode,
                    controller:
                        paymentController.addressPostalCodeController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //============================= Line 1 field ======================
                  CustomFormCard(
                    title: AppStrings.line1,
                    controller: paymentController.lineOneController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //=========================== Bank account number field ===============
                  CustomFormCard(
                    title: AppStrings.bankAccountNumber,
                    controller:
                        paymentController.bankAccountNumberController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //====================== Bank holder number field ======================
                  CustomFormCard(
                    title: AppStrings.accountHolderType,
                    controller:
                        paymentController.accountHolderTypeController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //===================== bank info country ============================
                  CustomFormCard(
                    title: AppStrings.bankInfoCountry,
                    controller:
                        paymentController.bankInfoCountryController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //====================== bank info currency ===========================
                  CustomFormCard(
                    title: AppStrings.bankInfoCurrency,
                    controller:
                        paymentController.bankInfoCurrencyController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //=========================== bank info bussiness ==================
                  CustomFormCard(
                    title: AppStrings.bankInfoBusinessname,
                    controller:
                        paymentController.bankInfoBusinessController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //====================== Bank info website field ====================
                  CustomFormCard(
                    title: AppStrings.bankInfoWebsite,
                    controller:
                        paymentController.bankInfoWebsiteController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  //==================== Bank info product discription ==================
                  CustomFormCard(
                    title: AppStrings.bankInfoProductdescription,
                    controller: paymentController
                        .bankInfoProductDiscriptionController.value,
                    hasBackgroundColor: true,
                    hintText: AppStrings.typehere,
                    isMultiLine: false,
                    maxLine: 3,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //============================ Submit button =======================..
                  paymentController.addCardLoading.value
                      ? const CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (paymentController.frontImageFile.value !=
                                    null &&
                                paymentController.backImageFile.value != null) {
                              if (formKey.currentState!.validate()) {
                                paymentController.addNewCard();
                              }
                            } else {
                              showCustomSnackBar(
                                  "Please add both front and back image",
                                  isError: true);
                            }
                          },
                          title: AppStrings.submit,
                        ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
