import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class PharmacieService {
  static Future<void> createPharmacie(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pharmacies/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Pharmacie created successfully');
    } else {
      throw Exception('Failed to create pharmacie');
    }
  }
}
