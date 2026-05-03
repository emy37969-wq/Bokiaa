import 'package:bokiaa/core/helper/errore_handler.dart';
import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio_factory.dart';
import 'package:bokiaa/feature/wishlistt/data/model/wishlist_model.dart';
import 'package:flutter/foundation.dart';

class WishlistRepo {
  static Future<(WishlistModel?, String?)> getWishlist() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstants.showWishlist);
      debugPrint('>>> getWishlist status: ${response?.statusCode}');
      if (response?.statusCode == 200) {
        return (WishlistModel.fromJson(response?.data), null);
      }
      return (null, 'Failed to load wishlist.');
    } catch (e) {
      return (null, ErrorHandler.handle(e));
    }
  }

  static Future<(bool, String?)> addToWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.addToWishlist,
        data: {'product_id': productId},
      );
      debugPrint('>>> addToWishlist status: ${response?.statusCode}');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return (true, null);
      }
      return (false, 'Failed to add to wishlist.');
    } catch (e) {
      return (false, ErrorHandler.handle(e));
    }
  }

  static Future<(bool, String?)> removeFromWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.removeFromWishlist,
        data: {'product_id': productId},
      );
      debugPrint('>>> removeFromWishlist status: ${response?.statusCode}');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return (true, null);
      }
      return (false, 'Failed to remove from wishlist.');
    } catch (e) {
      return (false, ErrorHandler.handle(e));
    }
  }
}