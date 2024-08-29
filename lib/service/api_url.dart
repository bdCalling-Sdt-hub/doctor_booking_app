class ApiUrl {
  static const baseUrl = "http://192.168.10.6:5000";

  //============================ Image base url ===========
  static const imageBaseUrl = 'http://192.168.10.6:5000/';

  ///=============================== Auth Section ==============================

  static const login = '/auth/sign-in';
  static const doctorSignUp = '/auth/doctor-sign-up';
  static const paitentSignUp = '/auth/sign-up';
  static const varifyCode = '/auth/verify-code';

  ///========================== Paitent Section ============================
//=============== Home ================

  static const category = '/category';

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
}
