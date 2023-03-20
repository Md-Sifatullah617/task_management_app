import 'package:shared_preferences/shared_preferences.dart';

String defaultProfilePic =
    "data:image/png;base64,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";

Future<void> writeUserData(value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("token", value["token"]);
  await prefs.setString("email", value["data"]["email"]);
  await prefs.setString("firstName", value["data"]["firstName"]);
  await prefs.setString("lastName", value["data"]["lastName"]);
  await prefs.setString("mobile", value["data"]["mobile"]);
  await prefs.setString("photo", value["data"]["photo"]);
}

Future<void> writeEmailVerification(email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("EmailVerification", email);
}

Future<void> writeOTPVerification(oTP) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("OTPVerification", oTP);
}

// Future<void> writePassword(storepassword) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString("savedPassword", storepassword);
// }

Future<String?> readUserData(key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = await prefs.getString(key);
  return mydata;
}

Future<bool> checkLogin() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  if (token != null) {
    return true;
  } else {
    return false;
  }
}

Future<bool> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}
