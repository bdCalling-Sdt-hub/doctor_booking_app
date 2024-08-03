class AppStrings {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String passDoesNotMatch = "Password does not match";
  static const String passwordMustHaveEightWith =
      "Password must have 8 characters With(A-z,a-z,0-9)";
  static const String enterValidEmail = "Enter a valid email";
  static const String passMustContainBoth =
      "Password must be 8 characters long & must include one capital letter";
  static const String enterAValidName = "Enter a valid name";
  static const String enterValidEamil = "Please Enter Your Email Address";

  ///================================Onboard screen=====================================
  static const String loginAsAUser = 'Login  as a User';
  static const String loginAsADriver = 'Login as a Driver';
  static const String hireBookTruckPickup = 'Hire/Book Truck Pickup';
  static const String welcomeToAllText =
      'Welcome to EasyTruck! Effortlessly book trucks for all your transportation needs. Enjoy fast, reliable, and hassle-free service with real-time tracking and transparent pricing.Get started now!';

  ///================================SIgn in screen=======================
  static const String login = 'Login';
  static const String loginToContinueUsingTheApp =
      'Login to Continue Using the app';
  static const String email = 'Email';
  static const String enterYourEmail = 'Enter your email';
  static const String password = 'Password';
  static const String enterYourPassword = 'Enter your password';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAnAccount = 'Don’t have an account?';
  static const String signUp = 'Sign Up';

  ///===========================forgot password=======================
  static const forgetPassword = 'Forgot Password';
  static const sendCode = 'Send Code';
  static const dontWorryItOccurs =
      'Don’t worry! It Occurs. Please enter the email address linked with your account.';

  ///=========================Otp screen========================
  static const otpVerification = 'OTP Verification';
  static const verify = 'Verify';
  static const dontReceivedCode = 'Don’t received code?';
  static const resend = 'Resend';

  static const enterTheVerificationCodeWeJust =
      'Enter the verification code we just sent on your email address.';

  ///========================Reset password==========================
  static const confirmPassword = 'Confirm Password';
  static const newPassword = 'New Password';
  static const save = 'Save';
  static const yourNewPasswordMustBe =
      'Your new password must be unique from those previously used.';

  ///==================================User section===========================
  static const setYourProfile = 'Set Your Profile';
  static const name = 'Name';
  static const phoneNumber = 'Phone Number';
  static const termsOfUse = 'Terms of Use';
  static const and = 'and';
  static const privacyTerms = ' Privacy Terms?';
  static const byProceedingYouAccept = 'By proceeding you accept our';
  static const letsGo = 'Let\'s Go';

  ///=============================User Sign up profile============================
  static const personalInformation = 'Personal Information :';
  static const phoneNumbers = 'Phone number :';
  static const names = 'Name :';
  static const emails = 'Email :';
  static const address = 'Address :';
  static const editProfile = 'Edit Profile';

  ///=========================user nav bar text========================
static const massage = 'Massage';
static const trip = 'Trip';
static const home = 'Home';
static const profile = 'Profile';

///==================================user home screen=========================
  static const welcome ='Welcome!';
  static const customerCare ='Customer Care';
  static const termsAndConditions ='Terms & Condition';
  static const privacyPolicy ='Privacy Policy';
  static const feedBack ='Feedback';
  static const settings ='Settings';
  static const logOut ='Log Out';

///====================================Driver section=====================



///=================================Driver sign up ========================
  static const primaryInfo = 'Primary Info';
  static const drivingInfo = 'Driving Info';
  static const bankInfo = 'Bank Info';
  static const primaryInfos = 'Primary Info:';
  static const yourName = 'Your Name';
  static const truckInfo = 'Truck Info:';
  static const drivingLicenceNumber = 'Driving Licence Number';
  static const drivingLicenceExpiredDate = 'Driving Licence Expired Date';
  static const licenseImage = 'Licence Image';
  static const truckRegistrationNumber = 'Truck Registration Number';
  static const registrationDocumentImage = 'Registration Document image';
  static const truckImage = 'Truck Image';
  static const truckSize = 'Truck Size';
  static const cargoCapacity = 'Cargo capacity of the truck';
  static const selectKm = 'Select  Km:';
  static const selectPrice = 'Select  Price:';
  static const next = 'Next';
  static const bankingInfo = 'Banking Info:';
  static const bankAccountNumber = 'Bank Account Number';
  static const bankName = 'Bank Name';
  static const routingNumber = 'Routing Number';
  static const accountHolderName = 'Account Holder\'s Name';
  static const theNameOfThePersonWhoHoldsTheAccount = 'The name of the person who holds the account, which should typically match the driver\'s name.';
  static const whatKindOfGoodsDo = 'What kind of goods do you want to bring through EasyTruck?';
  static const byContinueYouAcceptOutPrivacyPolicy = 'By continue you accept our privacy policy & terms and condition';


}
