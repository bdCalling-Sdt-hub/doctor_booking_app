import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/model/terms_model/terms_model.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/inner_widget/appointments_history_dialog.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/category_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/popular_doctor.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_routes/app_routes.dart';

class GeneralController extends GetxController with GetxServiceMixin {
  RxString profileID = "".obs;

  // RxString role = "".obs;

  ///================== Show Loader ====================

  showPopUpLoader() {
    return showDialog(
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return const SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomLoader(),
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

  ///================== Get Calender value ====================

  Rx<DateTime> calenderValue = DateTime.now().obs;
  Rx<DateTime> startTimeValue = DateTime.now().obs;
  Rx<DateTime> endTimeValue = DateTime.now().obs;

  ///====================== Pick Image =====================
  Rx<File?> proImage = Rx<File?>(null);

  ///============================Multi Image picker method================
  RxList<File> selectedImagesMulti = <File>[].obs;
  final ImagePicker picker = ImagePicker();

  void pickMultiImage() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 80,
      );

      // ignore: unnecessary_null_comparison
      if (pickedFiles == null || pickedFiles.isEmpty) {
        Get.snackbar('No Images Selected', 'No images were selected.');
        selectedImagesMulti.clear();
        return;
      }

      if (pickedFiles.length > 6) {
        Get.snackbar(
            'Image Limit Exceeded', 'You can only select up to 6 images.');
        return;
      }

      for (var xFile in pickedFiles) {
        if (selectedImagesMulti.length < 6) {
          selectedImagesMulti.add(File(xFile.path));

          debugPrint(
              "Selected Image=============>>>>>>>>>>>$selectedImagesMulti");
        } else {
          Get.snackbar(
              '', 'You can only pick up to 6 images for each product.');
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

  ///========================= Get User Info =========================
  RxString userImg = "".obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userLocation = "".obs;

  getSavedInfo() async {
    userImg.value = await SharePrefsHelper.getString(AppConstants.userImage);
    userName.value = await SharePrefsHelper.getString(AppConstants.userName);
    userId.value = await SharePrefsHelper.getString(AppConstants.id);

    userLocation.value =
        await SharePrefsHelper.getString(AppConstants.userLocation);
    refresh();
  }

  ///================= 7 Days Info ===================

  RxList<Map<String, String>> next7Days = <Map<String, String>>[].obs;

  sevenDaysInfo() async {
    DateTime today = DateTime.now();

    // Initialize a list to store the next 7 days' data in a Map

    // Loop to get the next 7 days
    for (int i = 0; i < 7; i++) {
      DateTime nextDay = today.add(Duration(days: i));
      String day =
          DateFormat('EEEE').format(nextDay); // Get the day (e.g., Fri)
      String date = DateFormat('d').format(nextDay); // Get the date (e.g., 12)

      int month = nextDay.month;

      // Add the day and date to the map
      Map<String, String> dayMap = {
        'Day': day,
        'Date': date,
        "month": month.toString()
      };

      // Add the map to the list
      next7Days.add(dayMap);
      refresh();
    }
  }

  //================================== Get Terms And Condition =============================
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<TermsModel> termsModel = TermsModel().obs;

  Future<void> getTerms() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.termsAndCondition);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      termsModel.value = TermsModel.fromJson(response.body['data']);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
  //=================================== Privacy & Policy ===========================//

  Rx<TermsModel> privacyModel = TermsModel().obs;

  Future<void> getPrivacyPolicy() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.privacyPolicy);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      privacyModel.value = TermsModel.fromJson(response.body['data']);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///===================== Get Appointment Time ========================

  RxList<String> getAvailableTimesForSelectedDay(
      {AvailableDays? availableDays,
      int selectedDateIndex = 0,
      required String selectedDay}) {
    debugPrint(
        "$selectedDay>>>>>>>>>>>>>>>>>>>>${availableDays!.getTimesForDay(selectedDay)}");
    refresh();
    return RxList<String>.from(availableDays.getTimesForDay(selectedDay));
  }

  ///====================== Get Available For ========================
  String getAvailableFor(String day, AvailableFor availableFor) {
    switch (day) {
      case 'Monday':
        return availableFor.monday == AppStrings.online
            ? AppStrings.online
            : availableFor.monday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;

      case 'Tuesday':
        return availableFor.tuesday == AppStrings.online
            ? AppStrings.online
            : availableFor.tuesday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      case 'Wednesday':
        return availableFor.wednesday == AppStrings.online
            ? AppStrings.online
            : availableFor.wednesday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      case 'Thursday':
        return availableFor.thursday == AppStrings.online
            ? AppStrings.online
            : availableFor.thursday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      case 'Friday':
        return availableFor.friday == AppStrings.online
            ? AppStrings.online
            : availableFor.friday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      case 'Saturday':
        return availableFor.saturday == AppStrings.online
            ? AppStrings.online
            : availableFor.saturday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      case 'Sunday':
        return availableFor.sunday == AppStrings.online
            ? AppStrings.online
            : availableFor.sunday == AppStrings.offlineCapital
                ? AppStrings.inPerson
                : AppStrings.unavailable;
      default:
        return "Not Found";
    }
  }

  ///==================== Make Favourite ====================

  Future<bool> makeFavourite({required String docID}) async {
    showPopUpLoader();

    var response = await ApiClient.postData(
      ApiUrl.favourite,
      jsonEncode({"doctorId": docID}),
    );

    if (response.statusCode == 200) {
      PaitentHomeController homeController = Get.find<PaitentHomeController>();
      homeController.getFavouriteDocList();
      toastMessage(message: response.body["message"], colors: Colors.green);
      navigator?.pop();
      return true;
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
      return false;
    }
  }

  ///========================== Get Category ==========================
  RxList<CategoryDatum> categoryList = <CategoryDatum>[].obs;
  RxList<bool> categoryBool = <bool>[].obs;
  RxList<String> selectedInterest = <String>[].obs;
  getCategory() async {
    // categoryLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.category);

    if (response.statusCode == 200) {
      categoryList.value = List<CategoryDatum>.from(
          response.body["data"].map((x) => CategoryDatum.fromJson(x)));
      getCategoryName();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        //  categoryLoadingMethod(Status.internetError);
      } else {
        /// categoryLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  RxList<String> categoryListName = <String>[].obs;

  getCategoryName() {
    if (categoryList.isNotEmpty) {
      for (int i = 0; i < categoryList.length; i++) {
        categoryListName.add(categoryList[i].name!);
        categoryBool.add(false);
      }
    }
  }

  updateInterest({required String interest, required int index}) {
    if (selectedInterest.contains(interest)) {
      selectedInterest.remove(interest);
    } else {
      selectedInterest.add(interest);
    }

    categoryBool[index] = !categoryBool[index];

    categoryBool.refresh();
    selectedInterest.refresh();

    debugPrint("Selected Interest List========>>>>>>>>>$selectedInterest");
  }
//================== Update Appoinment =================

  Future<bool> updateAppoinment(
      {required String status, required String appoinmentID}) async {
    showPopUpLoader();

    var response = await ApiClient.patchData(
        ApiUrl.updateAppoinmentStatus(appoinmentID: appoinmentID),
        jsonEncode({"status": status}));

    if (response.statusCode == 200) {
      navigator?.pop();
      return true;
    } else {
      navigator?.pop();
      return false;
    }
  }

  //================== Create Call History =================
  Future<void> createCallHistory(
      {required String senderId,
      required String receiverId,
      required String userName}) async {
    Map<String, String> body = {
      "doctorId": senderId,
      "userId": receiverId,
      "name": userName,
    };

    var response = await ApiClient.postData(
        ApiUrl.createDoctorCallHistory, jsonEncode(body));

    if (response.statusCode == 200) {
      debugPrint(
          "===============Response body====================${response.body}");
    } else {
      ApiChecker.checkApi(response);
    }
  }
  //======================================= Delete Account ===========================

  Rx<TextEditingController> passwordController = TextEditingController().obs;

  deleteAccount() async {
    String email = await SharePrefsHelper.getString(AppConstants.email);
    String bearerToken =
        await SharePrefsHelper.getString(AppConstants.bearerToken);

    Map<String, String> body = {
      "email": email,
      "password": passwordController.value.text,
    };

    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    debugPrint("======================== $email ========================");

    // Convert the body to JSON string
    http.Response response = await http.delete(
      Uri.parse("${ApiUrl.baseUrl}/${ApiUrl.deleteAccount}"),
      headers: mainHeaders,
      body: jsonEncode(body), // Encode the body as JSON
    );

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.signInScreen);
    } else {
      // Handle error response
      //ApiChecker.checkApi(response);
    }
  }

  /// ==============================- Lunch Map =============================

  launchMap(BuildContext context, double? lat, double? lng) async {
    var googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    var appleMapsUrl = 'https://maps.apple.com/?q=$lat,$lng';
    var googleMapsAppUrl =
        'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving';

    try {
      if (Platform.isAndroid) {
        // Attempt to open Google Maps in the browser if the app cannot be opened
        if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
          await launchUrl(Uri.parse(googleMapsUrl));
        } else {
          throw 'Could not launch Google Maps in browser: $googleMapsUrl';
        }
      } else if (Platform.isIOS) {
        // Try opening Google Maps app first
        if (await canLaunchUrl(Uri.parse(googleMapsAppUrl))) {
          await launchUrl(Uri.parse(googleMapsAppUrl));
        } else {
          // Fall back to Apple Maps
          if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
            await launchUrl(Uri.parse(appleMapsUrl));
          } else {
            throw 'Could not launch Apple Maps or Google Maps app';
          }
        }
      } else {
        throw 'Unsupported platform';
      }
    } catch (e) {
      debugPrint('Error launching map: $e');
      throw 'Could not launch map';
    }
  }

  @override
  void onInit() {
    getTerms();
    getPrivacyPolicy();
    sevenDaysInfo();
    getCategory();
    super.onInit();
  }
}
