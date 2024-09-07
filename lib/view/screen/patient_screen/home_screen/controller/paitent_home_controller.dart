import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/banner_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/category_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/favourite_doc_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/popular_doctor.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/model/review_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaitentHomeController extends GetxController with GetxServiceMixin {
  final categoryLoading = Status.loading.obs;
  void categoryLoadingMethod(Status value) => categoryLoading.value = value;

  final bannerLoading = Status.loading.obs;
  void bannerLoadingMethod(Status value) => bannerLoading.value = value;

  final popularDocLoading = Status.loading.obs;
  void popularDocLoadingMethod(Status value) => popularDocLoading.value = value;

  final recomemdedDocLoading = Status.loading.obs;
  void recomemdedDocLoadingMethod(Status value) =>
      recomemdedDocLoading.value = value;

  final favouriteLoading = Status.loading.obs;
  void favouriteLoadingMethod(Status value) => favouriteLoading.value = value;

  final allDocLoading = Status.loading.obs;
  void allDocLoadingMethod(Status value) => allDocLoading.value = value;

  RxInt bannerIndex = 0.obs;

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
      if (response.statusText == ApiClient.somethingWentWrong) {
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
      if (response.statusText == ApiClient.somethingWentWrong) {
        categoryLoadingMethod(Status.internetError);
      } else {
        categoryLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///================= Get Popular Doctor ===============

  RxList<PopularDoctorDatum> popularDoctorList = <PopularDoctorDatum>[].obs;
  RxList<bool> popuDocFavouList = <bool>[].obs;

  getPopularDoctor() async {
    popularDocLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.popularDoc);

    if (response.statusCode == 200) {
      popularDoctorList.value = List<PopularDoctorDatum>.from(
          response.body["data"].map((x) => PopularDoctorDatum.fromJson(x)));

      for (int i = 0; i < popularDoctorList.length; i++) {
        popuDocFavouList.add(popularDoctorList[i].isFavorite ?? false);
      }

      popularDocLoadingMethod(Status.completed);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        popularDocLoadingMethod(Status.internetError);
      } else {
        popularDocLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///==================== Get recomemded Doctors ====================

  RxList<PopularDoctorDatum> recomemdedDoctorList = <PopularDoctorDatum>[].obs;
  RxList<bool> recomemdedDocFavouList = <bool>[].obs;

  getrecomendedDoc() async {
    recomemdedDocLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.recomendedDoc);

    if (response.statusCode == 200) {
      recomemdedDoctorList.value = List<PopularDoctorDatum>.from(
          response.body["data"].map((x) => PopularDoctorDatum.fromJson(x)));

      for (int i = 0; i < recomemdedDoctorList.length; i++) {
        recomemdedDocFavouList.add(recomemdedDoctorList[i].isFavorite ?? false);
      }

      recomemdedDocLoadingMethod(Status.completed);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        recomemdedDocLoadingMethod(Status.internetError);
      } else {
        recomemdedDocLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///======================= Get review ======================
  RxList<ReviewDatum> reviewList = <ReviewDatum>[].obs;
  getReview({required String id}) async {
    var response = await ApiClient.getData(ApiUrl.reviews(id: id));

    if (response.statusCode == 200) {
      reviewList.value = List<ReviewDatum>.from(
          response.body["data"]["data"].map((x) => ReviewDatum.fromJson(x)));
      reviewList.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  ///================= Get favourite Doctor ===============
  RxList<FavouriteDocDatum> favouriteDocList = <FavouriteDocDatum>[].obs;

  getFavouriteDocList() async {
    favouriteLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.getFavourite);

    if (response.statusCode == 200) {
      favouriteDocList.value = List<FavouriteDocDatum>.from(
          response.body["data"].map((x) => FavouriteDocDatum.fromJson(x)));
      favouriteLoadingMethod(Status.completed);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        favouriteLoadingMethod(Status.internetError);
      } else {
        favouriteLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///==================== All Doctor List ====================
  RxList<PopularDoctorDatum> allDoctorList = <PopularDoctorDatum>[].obs;
  RxList<bool> allDocFavouList = <bool>[].obs;

  getAllDoc({required String query}) async {
    allDocLoadingMethod(Status.loading);

    var response =
        await ApiClient.getData(ApiUrl.allDoctors(specialization: query));

    if (response.statusCode == 200) {
      allDoctorList.value = List<PopularDoctorDatum>.from(
          response.body["data"].map((x) => PopularDoctorDatum.fromJson(x)));

      for (int i = 0; i < allDoctorList.length; i++) {
        allDocFavouList.add(allDoctorList[i].isFavorite ?? false);
      }

      allDocLoadingMethod(Status.completed);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        allDocLoadingMethod(Status.internetError);
      } else {
        allDocLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///============ All Methods ============
  allMethods() {
    getCategory();
    getBanner();
    getPopularDoctor();
    getrecomendedDoc();
    getFavouriteDocList();
  }

  @override
  void onInit() {
    allMethods();
    super.onInit();
  }
}
