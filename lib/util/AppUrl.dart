class AppApiUrls{
  static String address = 'http://asdasdasdasdas';  // set current address
  static String gateway = '$address/gateway';

  //auth
  static String auth = '$gateway/auth';

  static String sign_up = '$auth/sign-up';
  static String sign_in = '$auth/token';
  static String get_code_to_email = '$auth/reset-password/';
  static String reset_password_by_code = '$auth/change-password/';

}