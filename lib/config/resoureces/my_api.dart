import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApi {
  const MyApi._();

  static const Duration duration = Duration(seconds: 30);
  static const int perPage = 15;
  // static String baseUrl = dotenv.env['BASE_URL_DEV']!;
  // static String sendOTP = dotenv.env['SEND_OTP']!;
  // static String verifyCode = dotenv.env['VERIFY_CODE']!;
  // static String profile = dotenv.env['SIGNUP']!;
  // static String jobs = dotenv.env['JOBS']!;
  // static String states = dotenv.env['STATES']!;
  // static String cities = dotenv.env['CITIES']!;
  // static String upload = dotenv.env['UPLOAD']!;
  // static String availableDays = dotenv.env['AVAILABLEDAYS']!;
  // static String lockTIme = dotenv.env['LOCKTIME']!;
  // static String booking = dotenv.env['BOOKING']!;
  // static String facturePay = dotenv.env['FACTUREPAY']!;
  // static String appointment = dotenv.env['APPOINTMENT']!;

  static String baseUrl = dotenv.env['BASE_URL_DEV']!;
  static String baseUrlPlayer = dotenv.env['BASE_URL_DEV_PLAYER']!;
  static String baseUrlOneApi = dotenv.env['BASEURLONEAPIDEV']!;
  static String chatGpt3Turbo = dotenv.env['CHATGPT3TURBO']!;
  static String chatGpt4 = dotenv.env['CHATGPT4']!;
  static String sendOTP = dotenv.env['SEND_OTP']!;
  static String verifyCode = dotenv.env['VERIFY_CODE']!;
  static String profile = dotenv.env['SIGNUP']!;
  static String profileUpdate = dotenv.env['PROFILEUPDATE']!;
  static String profileInfo = dotenv.env['PROFILEINFO']!;
  static String profileMe = dotenv.env['PROFILME']!;
  static String categories = dotenv.env['CATEGORIES']!;
  static String categoriesID = dotenv.env['MEDIABYID']!;
  static String medias = dotenv.env['MEDIAS']!;
}
