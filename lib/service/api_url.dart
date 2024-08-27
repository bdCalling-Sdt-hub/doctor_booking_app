class ApiUrl {
  static const baseUrl = "http://192.168.10.6:5000";

  ///=============================== Auth Section ==============================

  static const login = '/auth/sign-in';
  static const doctorSignUp = '/auth/doctor-sign-up';
  static const paitentSignUp = '/auth/sign-up';

  ///=============================== Doctor Section ==============================
  static const profile = '/auth/profile';
  //=============================== Appointment ===========================//
  static const doctorAppointment = '/appointment/get-my-appointments';
  //======================= Notification ===============================//
  static const doctorNotification = '/notification/get-notifications';

  //============================= Change password ====================//
  static const changePassword = '/auth/change-password';
}
