import 'package:dio/dio.dart';
import 'package:bokiaa/core/ntework/dio-helper.dart';

class PaymobService {
  Future<String> getPaymentUrl({
    required double amount,
    required String firstName,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await Diohelper.dio!.post(
        'payment',
        data: {
          'amount': amount,
          'first_name': firstName,
          'email': email,
          'phone': phone,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if (data is Map && data['payment_url'] != null) {
          return data['payment_url'].toString();
        }
        throw Exception('Payment URL not found in response');
      }

      throw Exception('Failed to get payment url: ${response.statusCode}');
    } on DioError catch (e) {
      final message = e.response?.data?.toString() ?? e.message;
      throw Exception('Paymob service error: $message');
    } catch (e) {
      throw Exception('Paymob service error: $e');
    }
  }
}
