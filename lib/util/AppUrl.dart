class AppUrls{
  static String address = 'http://192.168.10.122:8090';  // set current address
  static String gateway = '$address/gateway';

  //auth
  static String auth = '$gateway/auth';

  static String sign_up = '$auth/sign-up';
  static String sign_in = '$auth/sign-in';
  static String get_code_to_email = '$auth/reset-password/';
  static String reset_password_by_code = '$auth/change-password/';
  static String update_profile_image = '$auth/update-profile-image';

  //smart_greenhouse
  static String smart_greenhouse = '$gateway/smart-greenhouse';

  //plants
  static String plants = '$smart_greenhouse/plants';

  //greenhouse
  static String greenhouse = '$smart_greenhouse/greenhouse/';
  static String greenhouses = '$smart_greenhouse/greenhouse';

  static String my_greenhouses = '$smart_greenhouse/greenhouse/my';

  //arduino
  static String arduino = '$smart_greenhouse/arduino';

  //file-store
  static String file_store = '$gateway/file-store';

  static String download_file = '$file_store/file/download/';
  static String upload_file = '$file_store/file/upload';


  //logger
  static String logger = '$smart_greenhouse/logger';

  static String logger_arduino_id = '$logger/arduino/';
  static String weekly_averages = '/weekly-averages';



}