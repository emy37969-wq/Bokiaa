// import 'package:bokiaa/core/ntework/api-exceptions.dart';
// import 'package:bokiaa/core/ntework/dio-cilent.dart';
// import 'package:dio/dio.dart';

// class Apiservice {
//   final Diocilent _diocilent = Diocilent();
// //get
//   Future<dynamic> get(String endPoint) async {
//     try {
//       final response = await _diocilent.dio.get(endPoint);
//       return response.data;
//     } on DioError catch (e) {
//       return Apiexceptions.handleError(e);
//     }
//   }
// //post
//     Future<dynamic> post(String endPoint,Map<String,dynamic>body) async {
//     try {
//       final response = await _diocilent.dio.post(endPoint,data: body);
//       return response.data;
//     } on DioError catch (e) {
//       return Apiexceptions.handleError(e);
//     }
//   }
// //put(update)
//     Future<dynamic> put(String endPoint,Map<String,dynamic>body) async {
//     try {
//       final response = await _diocilent.dio.put(endPoint,data: body);
//       return response.data;
//     } on DioError catch (e) {
//       return Apiexceptions.handleError(e);
//     }
//   }
// //delete
//     Future<dynamic> delete(String endPoint,Map<String,dynamic>body) async {
//     try {
//       final response = await _diocilent.dio.delete(endPoint,data: body);
//       return response.data;
//     } on DioError catch (e) {
//       return Apiexceptions.handleError(e);
//     }
//   }

// }
