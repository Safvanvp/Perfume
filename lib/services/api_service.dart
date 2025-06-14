import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String> login() async {
    final url = Uri.parse(
        'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login');

    final response = await http.post(
      url,
      body: {
        'device_token': 'test_token',
        'device_type': '1',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Login response: $data");

      if (data['data'] != null && data['data']['access_token'] != null) {
        return data['data']['access_token'];
      } else {
        throw Exception('access_token not found in response');
      }
    } else {
      throw Exception(
          'Failed to login: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> getHomeData(String token) async {
    const homeUrl =
        'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home'; 
    final response = await http.get(
      Uri.parse(homeUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load home data');
    }
  }
}
