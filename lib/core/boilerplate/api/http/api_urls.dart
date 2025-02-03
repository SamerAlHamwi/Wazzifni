
import '../../../constants/app_settings.dart';

class ApiURLs {
  ///BASE_URL
  static String baseUrl = AppSettings.BASE_URL;

  ///User
  static String checkVersion = '$baseUrl/api/services/app/Configuration/HomeChecker';

  ///Auth
  static String login = '$baseUrl/api/services/app/Account/SignInWithPhoneNumber';






}
