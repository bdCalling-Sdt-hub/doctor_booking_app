import 'dart:io';

import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/inner_widget/appointments_history_dialog.dart';
import 'package:doctor_booking/view/widgets/custom_image_picker_popup/custom_image_picker_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GeneralController extends GetxController with GetxServiceMixin {
  RxString profileID = "".obs;

  RxString role = "".obs;

  ///================== Show Loader ====================

  showPopUpLoader() {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomImagePickerPopup(
                galleryButton: () {
                  openGallery(source: ImageSource.gallery);
                },
                cammeraButton: () {
                  openGallery(source: ImageSource.camera);
                },
              ),
            ),
          );
        });
  }

  showAppintmentHistoryDialog({
    required String imageUrl,
    required String patientName,
    required String sickName,
    required String appointmentFee,
    required String contactNumber,
    required String appointmentTime,
    required String rated,
  }) {
    return showDialog(
        barrierDismissible: true,
        context: Get.context!,
        builder: (_) {
          return SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: AppointmentsHistoryDialog(
                imageUrl: imageUrl,
                patientName: patientName,
                sickName: sickName,
                appointmentFee: appointmentFee,
                contactNumber: contactNumber,
                appointmentTime: appointmentTime,
                rated: rated,
              ),
            ),
          );
        });
  }

  ///================== Get User Id ====================
  // getUserID() async {
  //   profileID.value = await SharePrefsHelper.getString(AppConstants.profileID);
  //   profileID.refresh();
  // }

  ///================== Get User Role ====================
  // getRole() async {
  //   role.value = await SharePrefsHelper.getString(AppConstants.role);
  //   role.refresh();

  //   debugPrint("User Role=================>>>>>>>>>>${role.value}");
  // }

  ///===================== Get All Info at once ===================
  // getAllInfo() {
  //   getUserID();
  //   getRole();
  // }

  ///================== Get Calender value ====================

  Rx<DateTime> calenderValue = DateTime.now().obs;

  pickDate(
      {required BuildContext context, TextEditingController? value}) async {
    DateTime? result = await showDatePicker(
        context: context, firstDate: DateTime(1980), lastDate: DateTime.now());

    calenderValue.value = result ?? DateTime.now();

    // value!.text = DateConverter.yearMonthDate(calenderValue.value);
    refresh();
  }

  ///====================== Pick Image =====================
  Rx<File?> proImage = Rx<File?>(null);

  Future<void> openGallery({required ImageSource source}) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 10);
    if (pickedFile != null) {
      proImage.value = File(pickedFile.path);
    }
  }


  ///============================Multi Image picker method================
  RxList<File> selectedImagesMulti = <File>[].obs;
  final ImagePicker picker = ImagePicker();

  void pickMultiImage() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 80,
      );

      if (pickedFiles == null || pickedFiles.isEmpty) {
        Get.snackbar('No Images Selected', 'No images were selected.');
        selectedImagesMulti.clear();
        return;
      }

      if (pickedFiles.length > 6) {
        Get.snackbar('Image Limit Exceeded', 'You can only select up to 6 images.');
        return;
      }

      selectedImagesMulti.clear();
      for (var xFile in pickedFiles) {
        if (selectedImagesMulti.length < 6) {
          selectedImagesMulti.add(File(xFile.path));
        } else {
          Get.snackbar('', 'You can only pick up to 6 images for each product.');
          break;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while picking images: $e');
    } finally {
      // Notify listeners of changes
      update();
    }
  }
}
