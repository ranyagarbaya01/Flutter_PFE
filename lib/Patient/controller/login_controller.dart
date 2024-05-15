import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:pharmacy_app/Patient/service/login_service.dart';
import 'package:pharmacy_app/core/app_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';
import 'package:pharmacy_app/core/navigation_with_transition.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  RxBool isLoading = false.obs;
 

  Future<void> login(User user, context) async {
    update();
    try {
      isLoading.value = true;
      // Appelez votre API pour vous connecter et obtenir le token
      final token = await _apiService.login(user);
      print('token : $token');
      if (token == null || token.isEmpty) {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ));
      } else {
        print("got token------------------------ getting into cache");
        await cacheToken(token);
        print("token cached------------------------");
        isLoading.value = false;
        navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
          context,
          HowCommand(),
        );
      }
      // Stockez le jeton dans le cache
    } catch (error) {
      isLoading.value = false;
      // Gérez les erreurs
      print('Error during login: $error');
    }
  }
}

Future cacheToken(String token) async {
  print("caching token---------------------11111111---");
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  print("caching token---------------------2222222222---");

  sharedPreferences.setString('token', token);
}

Future getToken() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');

  print("5edmet------------------------------------- : $token");
  if (token != null) {
    return token;
  } else {
    return "";
  }
}
