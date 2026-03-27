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
      final  response = await dio.post(
          "https://codingarabic.online/api/register",
          data: {"name": name,"email": email, "password": password,"password_confirmation":password_confirmation});
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}




// import 'package:bokiaa/core/ntework/api-erroe.dart';
// import 'package:bokiaa/core/ntework/api-exceptions.dart';
// import 'package:bokiaa/core/ntework/api-service.dart';
// import 'package:bokiaa/core/utils/pref-helper.dart';
// import 'package:bokiaa/feature/auth/data/user-model.dart';
// import 'package:dio/dio.dart';

// class Authrepo {
//   Apiservice apiservice = Apiservice();

// //login
//   Future<Usermodel?> Login(String email, String password) async {
//     try {
//       final response = await apiservice
//           .post("login", {"email": email, "password": password});
//       final user = Usermodel.fromJson(response["data"]);
//       if (user.token != null) {
//         await Prefhelper.saveToken(user.token!);
//       }
//       return user;
//     } on DioError catch (e) {
//       throw Apiexceptions.handleError(e);
//     } catch (e) {
//       throw Apierroe(message: e.toString());
//     }
//   }
// //register
// }
