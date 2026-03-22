import 'package:bokiaa/feature/auth/ui/register-screen.dart';
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
    static Future<bool> register(
      {required String email, required String password,required String name,required String password_confirmation}) async {
    try {
      final Response response = await dio.post(
          "https://codingarabic.online/api/register",
          data: {"username": name,"email": email, "password": password,"confirmpassword":password_confirmation});
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
