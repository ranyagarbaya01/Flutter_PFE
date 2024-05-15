import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';

class RegistrationController extends GetxController {
  Future<void> register(User user, String nom, String prenom, String adresse,
      int num, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/patients/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user': {
          'username': user.username,
          'password': user.password, // Include password field
          'is_active': user.isActive,
        },
        'nom': nom,
        'prenom': prenom,
        'adresse': adresse,
        'num': num,
        'email': email,
      }),
    );

    if (response.statusCode == 201) {
      print('Registration successful');
    } else {
      throw Exception('Registration failed');
    }
  }
}
