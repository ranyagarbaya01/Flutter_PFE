import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LivreurService {
  Future<String> signin(User user, role) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Login_gn/'),
      body: {
        'username': user.username,
        'password': user.password,
      },
    );
    dynamic token = null;
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      int livreurId = responseData['user']["id"];
      print(livreurId);
      token = responseData['token'];

      // Save the livreurId in shared preferences
      await saveLivreurId(livreurId);

      return token;
    } else {
      return "";
    }
  }

  Future<void> saveLivreurId(int livreurId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('loggedInLivreurId', livreurId);
  }

  Future<int?> getLivreurId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('loggedInLivreurId');
  }
}
