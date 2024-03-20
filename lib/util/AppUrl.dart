class AppApiUrls{
  static String address = 'http://192.168.10.122:8090';  // set current address
  static String gateway = '$address/gateway';

  //auth
  static String auth = '$gateway/auth';

  static String sign_up = '$auth/sign-up';
  static String sign_in = '$auth/sign-in';
  static String get_code_to_email = '$auth/reset-password/';
  static String reset_password_by_code = '$auth/change-password/';

  //smart_greenhouse
  static String smart_greenhouse = '$gateway/smart-greenhouse';

  //plants
  static String plants = '$smart_greenhouse/plants';

  //greenhouse
  static String greenhouse = '$smart_greenhouse/greenhouse';

  //arduino
  static String arduino = '$smart_greenhouse/arduino';
}