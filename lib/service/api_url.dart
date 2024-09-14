class ApiUrl {
  static const baseUrl = "http://103.161.9.133:5000";
  static const imageBaseUrl = 'http://103.161.9.133:5000/';
  static const socketUrl =
      'http://103.161.9.133:5000?userId=66d7efd8ca187e791dac4758';

  static const stripePublicKey =
      "pk_test_51PvZAIRv9ouTNUmHJAe3Sl0oUW8zqon9fr5jb6J5B5bDmSVWmb8DVtuUTQUry4SXLCtZSKugavb72wW6bzNjsm3T00C83N7lLB";

  ///=============================== Auth Section ==============================

  static const login = '/auth/sign-in';
  static const doctorSignUp = '/auth/doctor-sign-up';
  static const paitentSignUp = '/auth/sign-up';
  static const varifyCode = '/auth/verify-code';

  ///=============================================== Paitent Section ======================================

  //=============== Home ================

  static const category = '/category';
  static const banner = '/banner/get-banners';
  static const popularDoc = '/doctors/popular-doctors';
  static const recomendedDoc = '/doctors/recommended-doctors';
  static reviews({required String id}) => '/review/get-reviews?receiverId=$id';

  //=========== All Doctors ==========
  static allDoctors({required String specialization}) =>
      '/doctors?specialization=$specialization';

  static search({required String search}) => '/doctors?search=$search';

  //=========== Single Doctors ==========
  static singleDoctors({required String docID}) =>
      '/doctors/single-doctor/$docID';

  //============ Profile ==========
  static const getProfile = '/auth/profile';
  static const updateProfile = '/auth/update-user';
  static const favourite = '/favorite/add-remove-favorite';
  static const getFavourite = '/favorite/get-favorite-doctors?limit=100&page=1';

  //============ Appoinment ==========
  static bookAppoinment({required String docId}) =>
      'appointment/update-appointment-status/$docId';

  static getAppoinments({required String status, String page = "1"}) =>
      "/appointment/get-my-appointments?page=$page&status=$status";

  static updateAppoinment({required String appoinmentID}) =>
      '/appointment/update-appointment-status/$appoinmentID';

  ///============= Payment Section ===============

  static const paymentIntent = '/payment/create-payment-intent';
  static const savePayment = '/payment/save-payment';

  ///============= Ratting ===============
  static const giveRatting = '/review/create-review';

  ///============================================= Doctor Section ===========================================
  ///
  static const profile = '/auth/profile';

  //=============================== Appointment ===========================//

  static const doctorAppointment = '/appointment/get-my-appointments';

  //============================  Pending appointment =========================

  static const pendingDoctorAppointment = "$doctorAppointment?status=pending";
  static const completedDoctorAppointment =
      "$doctorAppointment?status=completed";
  static const pastDoctorAppointment = "$doctorAppointment?type=past";
  static const acceptedDoctorAppointment =
      "$doctorAppointment?status=accepted&type=today";
  static const appointmentUpdateStatus =
      '/appointment/update-appointment-status/';

  //======================= Notification ===============================//
  static const doctorNotification = '/notification/get-notifications';
  static const readAllNotification = '/notification/read-all';

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

  //=========================== Doctor create payment account ==================//

  static const doctorCreatePaymentAccount = '/appointment/update-appointment/';
  //=========================== Doctor payment history ==================//
  static const doctorPaymentHistory = '/payment/user-payment-history';

  //=========================== Doctor Home Type Status ==================//

  static getAppointmentType({required String type, String page = '1'}) =>
      "/appointment/get-my-appointments?page=$page&status=accepted&type=$type";

  static getAppointmentPast({required String type, String page = '1'}) =>
      "/appointment/get-my-appointments?page=$page&type=$type";
}
