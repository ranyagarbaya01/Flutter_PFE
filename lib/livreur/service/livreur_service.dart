import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';

class LivreurService {
  Future<String> signin(User user, role) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Login_gn/'),
      // Utilisez l'URL de votre endpoint de connexion
      body: {
        'username': user.username,
        'password': user.password,
      },
      //headers: {"Content-Type": "application/json"},
    );
    dynamic token = null;
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      token = responseData['token'];
      return token;
    } else {
      return "";
    }
  }
}
