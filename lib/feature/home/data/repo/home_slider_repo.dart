// import 'package:bokiaa/core/ntework/api-constants.dart';
// import 'package:bokiaa/core/ntework/dio-helper.dart';
// import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
// import 'package:bokiaa/feature/home/data/models/slider-model.dart';

// class Homerepo {
//   static Future<SliderResponse?> getSliders() async {
//     try {
//       final response = await Diohelper.dio?.get(Apiconstants.slider);
//       if (response?.statusCode == 200) {
//         SliderResponse data = SliderResponse.fromJson(response?.data);
//         return data;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   static Future<Bestsellerresponse?> getbestseller() async {
//     try {
//       final response = await Diohelper.dio?.get(Apiconstants.bestseller);
//       if (response?.statusCode == 200) {
//         Bestsellerresponse data = Bestsellerresponse.fromjson(response?.data);
//         return data;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       // print(error);
//       return null;
//     }
//   }
// }

import 'package:bokiaa/core/helper/errore_handler.dart';
import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio_factory.dart';
import 'package:bokiaa/feature/home/data/models/books_model.dart';
import 'package:bokiaa/feature/home/data/models/home_slider_model.dart';

class HomeRepo {
  static Future<(SliderModel?, String?)> getHomeSliders() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.homeSliderEndpoint,
      );
      if (response?.statusCode == 200) {
        return (SliderModel.fromJson(response?.data), null);
      }
      return (null, 'Failed to load sliders.');
    } catch (e) {
      return (null, ErrorHandler.handle(e));
    }
  }

  static Future<(BooksModel?, String?)> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstants.bestseller);
      if (response?.statusCode == 200) {
        return (BooksModel.fromJson(response?.data), null);
      }
      return (null, 'Failed to load best sellers.');
    } catch (e) {
      return (null, ErrorHandler.handle(e));
    }
  }
}
