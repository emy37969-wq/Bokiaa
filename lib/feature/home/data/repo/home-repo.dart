import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';
import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
import 'package:bokiaa/feature/home/data/models/slider-model.dart';

class Homerepo {
  static Future<SliderResponse?> getSliders() async {
    try {
      final response = await Diohelper.dio?.get(Apiconstants.slider);
      if (response?.statusCode == 200) {
        SliderResponse data = SliderResponse.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<Bestsellerresponse?> getbestseller() async {
    try {
      final response = await Diohelper.dio?.get(Apiconstants.bestseller);
      if (response?.statusCode == 200) {
        Bestsellerresponse data = Bestsellerresponse.fromjson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (error) {
      // print(error);
      return null;
    }
  }
}
