// import 'package:bokiaa/core/ntework/api-constants.dart';
// import 'package:bokiaa/core/ntework/dio-helper.dart';
// import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';

// class Searchrepo {
//   static Future<Bestsellerresponse?>?search({required String Text}) async {
//     try {
//       final response = await Diohelper.dio
//           ?.get(Apiconstants.search, queryParameters: {"name": Text});
//       if (response?.statusCode == 200) {
//         Bestsellerresponse data = Bestsellerresponse.fromjson(response?.data);
//         return data;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }

import 'package:bokiaa/core/helper/errore_handler.dart';
import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio_factory.dart';
import 'package:bokiaa/feature/home/data/models/books_model.dart';

class SearchRepo {
  static Future<(BooksModel?, String?)> searchBooks(String query) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.productsSearch,
        queryParameters: {'name': query},
      );
      if (response?.statusCode == 200) {
        return (BooksModel.fromJson(response?.data), null);
      }
      return (null, 'Search failed. Please try again.');
    } catch (e) {
      return (null, ErrorHandler.handle(e));
    }
  }
}
