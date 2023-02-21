// import 'package:shared_preferences/shared_preferences.dart';

// class HelperFunctions {
//   static String userLoggedInKey = "LOGGEDINKEY";
//   static String userNameKey = "USERNAMEKEY";
//   static String userEmailKey = "USEREMAILKEY";

//   static Future<bool> setUserLoggedInStatus(bool isUserLoggedIn) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setBool(userLoggedInKey, isUserLoggedIn);
//   }

//   static Future<bool> saveUserNameSF(String userName) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setString(userNameKey, userName);
//   }

//   static Future<bool> saveEmailSF(String email) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setString(userEmailKey, email);
//   }

//   static Future<bool?> getUserLoggedInStatus() async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return sf.getBool(userLoggedInKey);
//   }

//   static String getId(String namedId) {
//     return namedId.substring(0, namedId.indexOf("_"));
//   }

//   static String getName(String namedId) {
//     return namedId.substring(namedId.indexOf("_") + 1);
//   }
// }
