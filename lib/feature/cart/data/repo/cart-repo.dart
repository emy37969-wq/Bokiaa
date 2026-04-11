


import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';

class Cartrepo {
    static Future<bool> addtocart(int productid) async {
    try {
      final response = await Diohelper.dio?.post(Apiconstants.addtocart,
      data: {"product_id":productid});
      if (response?.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

}