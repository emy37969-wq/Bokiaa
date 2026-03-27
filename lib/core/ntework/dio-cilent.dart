// import 'package:bokiaa/core/utils/pref-helper.dart';
// import 'package:dio/dio.dart';

// class Diocilent {
//   final Dio _dio =
//       Dio(BaseOptions(baseUrl: 'https://codingarabic.online/api', headers: {
//     "Content-Type": "application/json",
//     "Accept": "application/json"
//   }));
//   Diocilent() {
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler)async {
//         final token = await Prefhelper.getToken();
//         if (token != null && token.isNotEmpty) {
//           options.headers["Authentication"] = "Bearer$token";
//         }
//         return handler.next(options);
//       },
//     ));
//   }
//   Dio get dio => _dio;
// }
