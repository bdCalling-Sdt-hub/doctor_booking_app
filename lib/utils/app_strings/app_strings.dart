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

  ///=======================OnBoard==================
  static const String welcomeToIlera = "Welcome to ilera";
  static const String next = "Next";
  static const String ilera = "ilera";
  static const String getStart = "Get start";
  static const String bookAppointmentsEffortlessly = "Book Appointments Effortlessly";
  static const String simplifyYourHealthcareExperience = "Simplify your healthcare experience. Manage appointments, access records, and more.";
  static const String findAndBookAvailableSlots = "Find and book available slots with your preferred doctors in just a few taps.";
  static const String yourHealthRecords = "Your Health Records, Always Accessible";
  static const String securelyAccessYourMedical = "Securely access your medical history and health records anytime, anywhere.";


  ///==========================Authentication====================
  static const String choseYourRole = "Choose your role";
  static const String patient = "Patient";
  static const String healthProfessional = "Health Professional";
  static const String continues = "Continue";
  static const String signIn = "Sign In";
  static const String emailAddress = "Email Address";
  static const String enterEmailAddress = "Enter email address";
  static const String password = "Password";
  static const String enterPassword = "Enter password";
  static const String forgotPassword = "Forgot password?";
  static const String dontHaveAnAccount = "Don’t have an account?";
  static const String createAccount = "Create Account";
  static const String signUp = "Sign Up";
  static const String yourName = "Your name";
  static const String yourNameHere = "Your name here";
  static const String dateOfBirth = "Date of birth";
  static const String email = "Email";
  static const String yourMailHere = "Your mail here";
  static const String phoneNumber = "Phone Number";
  static const String yourPhoneNumberHere = "Your phone number here";
  static const String location = "Location";
  static const String typeYourLocationHere = "Type your location here";
  static const String confirmPassword = "Confirm Password";
  static const String alreadyHaveAAccount = "Already have a account?";
  static const String forgotPasswords = "Forgot password";
  static const String sendACode = "Send a Code";
  static const String verification = "Verification";
  static const String checkYourEmail = "Check your email";
  static const String resendOtp = "Resend OTP";
  static const String verifyCode = "Verify code ";
  static const String updatePassword = "Update Password";
  static const String createANewPasswordEnsureIt = "Create a new password. Ensure it differs from previous ones for security";
  static const String enterYourEmailAndWeWill = "Enter your email and we will send you a verification code";
  static const String weSentAResetLinkTO = "We sent a reset link to contact@dscode...com enter 6 digit code that mentioned in the email";

///==============================Patient’s Home=====================
  static const String hi = "Hi,";
  static const String search = "Search";
  static const String categories = "Categories";
  static const String viewAll = "View All";
  static const String popularDoctors = "Popular Doctors";
  static const String recommendedDoctors = "Recommended Doctors";
  static const String termsAndConditions = "Terms & conditions";
  static const String privacyPolicy = "Privacy policy";
  static const String settings = "Settings";
  static const String logOut = "Log Out";
  static const String topSearch = "Top search";
  static const String notification = "Notification";
  static const String favorites = "Favorites";
  static const String allowAccess = "Allow Access";
  static const String allowLocationAccess = "Allow Location Access";
  static const String whatAreYouLookingFor = "What are you looking for?";
  static const String byAllowingAccessYouConsentTo = "By allowing access, you consent to share your personal info with Google Maps.";
  static const String weUseThisToShowNearbyHospitals = "We use this to show nearby hospitals. You can edit access in your phone’s settings.";


  ///=================================Doctor’s Profile=====================
static const String doctorProfile = 'Doctor’s Profile';
static const String experience = 'Experience';
static const String patientsChecked = 'Patients Checked';
static const String overallRating = 'Overall Rating';
static const String appointmentFee = 'Appointment Fee';
///==========================Schedule=================
static const String schedule = 'Schedule';
static const String bookAppointment = 'Book Appointment';
static const String availAbleTime = 'Available Time';
static const String details = 'Details';
static const String reviewAndRating = 'Review & Rating';
static const String similarDoctors = 'Similar Doctors';
static const String upcoming = 'Upcoming';
static const String past = 'Past';
static const String canceled = 'Canceled';
static const String appointmentTime = 'Appointment Time:';
static const String rescheduleAppointment = 'Reschedule Appointment';
static const String rescheduleDate = 'Reschedule Date';
///=============================Profile===================
static const String profile = 'Profile';
static const String accountInfo = 'Account Info';
static const String appointmentHistory = 'Appointment History';
static const String paymentOption = 'Payment Option';
static const String helpCenter = 'Help Center';
static const String phoneNumberColon = 'Phone Number:';
static const String dateOfBirthColon = 'Date of Birth:';
static const String genderColon = 'Gender:';
static const String locationColon = 'Location:';
static const String editAccountInfo = 'Edit Account Info';
static const String uploadPhoto = 'Upload Photo';
static const String fullName = 'Full Name';
static const String gender = 'Gender';
static const String review = 'Review';
static const String deleteAccount = 'Delete Account';
static const String setYourNewPassword = 'Set your new password';
static const String enterCurrentPassword = 'Enter Current Password';
static const String enterNewPassword = 'Enter New Password';
static const String retypeNewPassword = 'Retype New Password';
static const String changePassword = 'Change Password';
///==========================Help =================
static const String howCanWeHelpYou = 'How can we help you?';
static const String searchYourQuestionHere = 'Search your questions here';
static const String frequentlyAskedQuestions = 'Frequently Asked Questions ';
static const String needMoreHelp = 'Need More Help?';
static const String ourHelpLineService = 'Our help line service is active: 24/7';
static const String callUs = 'Call Us';
static const String home = 'Home';
static const String calls = 'Calls';
static const String hospitals = 'Hospitals';
static const String favorite = 'Favorite';
static const String appointments = 'Appointments';


///================================Doctor Section ========================
static const String personalInfo = 'Personal Info';
static const String professionalInfo = 'Professional Info';
static const String medicalLicenceImage = 'Medical license image';
static const String specialization = 'Specialization';
static const String yearsOfExperience = 'Years of experience';
static const String educationalBackground = 'Educational Background';
static const String currentAffiliation = 'Current Affiliation';
static const String hospitalClinicName = 'hospital clinic name';
static const String byContinueYouAccept = 'By continue you accept our';
static const String and = '&';
static const String totalBalance = 'Total Balance';
static const String totalAppointment = 'Total Appointment';
static const String today = 'Today';
static const String weekly = 'Weekly';
static const String monthly = 'Monthly';
static const String myAppointments = 'My appointments';
static const String currentLocation = 'Current Location';
static const String transectionHistory = 'Transection history';
static const String totalCancelation = 'Total Cancelation:';
static const String notifications = 'Notifications';
static const String markAllAsRead = 'Mark all as read';
static const String allPatientList = 'All Patient List';
static const String yes = 'Yes';
static const String cancel = 'Cancel';
static const String weight = 'Weight (KG)';
static const String reasonOfVisit = 'Reason of Visit';
static const String describeProblem = 'Describe Problem';
static const String patientDetails = 'Patient details';
static const String todaysCalls = 'Todays Calls';
static const String allCalls = 'All Calls';
static const String searchHere = 'Search here';
static const String attachReportsAndPrevious = 'Attach Reports & Previous Prescription';
static const String areYouSureYouWantTo = 'Are you sure you want to Delete your account?';
}
