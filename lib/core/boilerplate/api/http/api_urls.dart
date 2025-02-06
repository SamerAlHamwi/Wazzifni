
import '../../../constants/app_settings.dart';

class ApiURLs {
  ///BASE_URL
  static String baseUrl = AppSettings.BASE_URL;

  ///User
  static String checkVersion = '$baseUrl/api/services/app/Configuration/HomeChecker';
  static String createUserProfile = '$baseUrl/api/services/app/Profile/Update';

  ///Auth
  static String login = '$baseUrl/api/services/app/Account/SignInWithPhoneNumber';
  static String register = '$baseUrl/api/services/app/Account/SignUpWithPhoneNumber';
  static String verifyRegister = '$baseUrl/api/services/app/Account/VerifySignUpWithPhoneNumber';
  static String createUserAccount = '$baseUrl/api/TokenAuth/CreateAccountAfterSignUp';


  ///Cities
  static String allCities = '$baseUrl/api/services/app/City/GetAll';

  ///Languages
  static String allLanguages = '$baseUrl/api/services/app/SpokenLanguages/GetAll';

  ///Skills
  static String allSkills = '$baseUrl/api/services/app/Skill/GetAll';

  ///Company
  static String createCompanyAccount = '$baseUrl/api/services/app/Company/Create';

  ///Attachment
  static String uploadAttachment = '$baseUrl/api/services/app/Attachment/Upload';






}
