class ApiUrl {
  static const baseUrl = "http://192.168.10.6:5000";

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
  static const doctorAppointment = '/appointment/get-my-appointments';
}
