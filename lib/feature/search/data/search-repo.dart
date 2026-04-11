import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';
import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';

class Searchrepo {
  static Future<Bestsellerresponse?>?search({required String Text}) async {
    try {
      final response = await Diohelper.dio
          ?.get(Apiconstants.search, queryParameters: {"name": Text});
      if (response?.statusCode == 200) {
        Bestsellerresponse data = Bestsellerresponse.fromjson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
