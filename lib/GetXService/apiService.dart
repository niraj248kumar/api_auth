import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<bool> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String number,
    required String gender,
    required String address,
    required String agentId,
    required String referralCode,
    required String otherReferralCode,
    required String fcmToken,
    required String updatedAt,
    required String createdAt,
    required String userId,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://edugaondev.com/firebase-api-main/api/signup'),
    );
    request.fields.addAll({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "number": number,
      "gender": gender,
      "address": address,
      "agent_id": agentId,
      "referral_code": referralCode,
      "other_referral_code": otherReferralCode,
      "fcm_token": fcmToken,
      "updated_at": updatedAt,
      "created_at": createdAt,
      "user_id": userId,
    });
    http.StreamedResponse response = await request.send();
    final body = await response.stream.bytesToString();
    print('Status code: ${response.statusCode}');
    print('Response: $body');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('https://edugaondev.com/firebase-api-main/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    return jsonDecode(response.body);
  }
}
