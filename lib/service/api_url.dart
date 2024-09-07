class ApiUrl {
  static const baseUrl = "http://103.161.9.133:5000";

  //============================ Image base url ===========
  static const imageBaseUrl = 'http://103.161.9.133:5000';

  ///=============================== Auth Section ==============================

  static const login = '/auth/sign-in';
  static const doctorSignUp = '/auth/doctor-sign-up';
  static const paitentSignUp = '/auth/sign-up';
  static const varifyCode = '/auth/verify-code';

  ///========================== Paitent Section ============================

  //=============== Home ================

  static const category = '/category';
  static const banner = '/banner/get-banners';
  static const popularDoc = '/doctors/popular-doctors';
  static const recomendedDoc = '/doctors/recommended-doctors';
  static reviews({required String id}) => '/review/get-reviews?receiverId=$id';

  //=========== All Doctors ==========
  static allDoctors({required String specialization}) =>
      '/doctors?specialization=$specialization';

  //=========== Single Doctors ==========
  static singleDoctors({required String docID}) =>
      '/doctors/single-doctor/$docID';

  //============ Profile ==========
  static const getProfile = '/auth/profile';
  static const updateProfile = '/auth/update-user';
  static const favourite = '/favorite/add-remove-favorite';
  static const getFavourite = '/favorite/get-favorite-doctors';

  //============ Appoinment ==========
  static bookAppoinment({required String docId}) =>
      '/appointment/create-appointment/$docId';

  static getAppoinments({required String status}) =>
      "/appointment/get-my-appointments?status=$status";

  ///=============================== Doctor Section ==============================
  static const profile = '/auth/profile';
  //=============================== Appointment ===========================//
  static const doctorAppointment = '/appointment/get-my-appointments';
  //======================= Notification ===============================//
  static const doctorNotification = '/notification/get-notifications';

  //============================= Change password ====================//
  static const changePassword = '/auth/change-password';

  //========================= update Doctor Profile =====================//

  static const updateDoctorProfile = '/auth/update-doctor/';
  //======================== Doctor Over view ========================//

  static const doctorOverveiw = '/overview/doctor-overview';

  // ================================= Terms & Conditions ================

  static const termsAndCondition = '/settings/get-settings/terms';

  //============================ privacy & policy =======================//
  static const privacyPolicy = '/settings/get-settings/privacy';
  //=============================== Update Appointment ===================================//
  static const updateAppointment = '/appointment/update-appointment/';
}
