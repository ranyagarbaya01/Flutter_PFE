import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Livreur/model/livreur_model.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';

class RegistrationLivreurController extends GetxController {
  Future<void> register(
      User user, String nom, String prenom, int num, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/livreurs/register/'),
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
        'num': num,
        'email': email,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      print('Registration successful');
    } else {
      throw Exception('Registration failed');
    }
  }
}
