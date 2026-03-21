import 'package:dio/dio.dart';

class Authrepo {
  static Dio dio = Dio();

  static Future<bool> login(
      {required String email, required String password}) async {
    try {
      final Response response = await dio.post(
          "https://codingarabic.online/api/login",
          data: {"email": email, "password": password});
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
