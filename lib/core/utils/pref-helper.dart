// import 'package:shared_preferences/shared_preferences.dart';

// class Prefhelper {
//   static const String _tokenkey = "auth token";
//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenkey, token);
//   }
//     static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//    return prefs.getString(_tokenkey);
//   }
//       static Future<String?> clrearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.remove(_tokenkey);
//     return null;
//   }


// }
