import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/banner_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/category_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaitentHomeController extends GetxController with GetxServiceMixin {
  final categoryLoading = Status.loading.obs;
  void categoryLoadingMethod(Status value) => categoryLoading.value = value;

  final bannerLoading = Status.loading.obs;
  void bannerLoadingMethod(Status value) => bannerLoading.value = value;

  RxInt bannerIndex = 0.obs;
  final List<String> bannerImg = [
    AppImages.bannerOne,
    AppImages.bannerOne,
    AppImages.bannerOne,
  ];
  Rx<PageController> pageController = PageController().obs;
  List<String> categories = [
    'Cardiologist',
    'Neurologist',
    'Dermatologist',
    'Dentist'
  ];

  final RxString _selectedOption = 'Patient'.obs;

  String get selectedOption => _selectedOption.value;

  void setSelectedOption(String value) {
    _selectedOption.value = value;
  }

  var selectedCategory = 'Cardiologist'.obs;

  void updateCategory(String newCategory) {
    selectedCategory.value = newCategory;
  }

  ///========================== Get Category ==========================
  RxList<CategoryDatum> categoryList = <CategoryDatum>[].obs;

  getCategory() async {
    categoryLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.category);

    if (response.statusCode == 200) {
      categoryList.value = List<CategoryDatum>.from(
          response.body["data"].map((x) => CategoryDatum.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        categoryLoadingMethod(Status.internetError);
      } else {
        categoryLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///==================== Get Banner ====================
  RxList<BannerDatum> bannerList = <BannerDatum>[].obs;

  getBanner() async {
    categoryLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.banner);

    if (response.statusCode == 200) {
      bannerList.value = List<BannerDatum>.from(
          response.body["data"].map((x) => BannerDatum.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        categoryLoadingMethod(Status.internetError);
      } else {
        categoryLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///============ All Methods ============
  allMethods() {
    getCategory();
    getBanner();
  }

  @override
  void onInit() {
    allMethods();
    super.onInit();
  }
}
