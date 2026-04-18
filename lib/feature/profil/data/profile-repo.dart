
import 'package:bokiaa/core/ntework/api-constants.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';
import 'package:bokiaa/feature/profil/data/model/profile-model.dart';
import 'package:flutter/foundation.dart';

class ProfileRepo {
  static Future<ProfileModel?> getProfile() async {
    try {
      final response = await Diohelper.dio?.get(Apiconstants.profile);
      debugPrint('>>> getProfile status: ${response?.statusCode}');
      if (response?.statusCode == 200) {
        return ProfileModel.fromJson(response?.data);
      }
      return null;
    } catch (e) {
      debugPrint('>>> getProfile error: $e');
      return null;
    }
  }
  
}
