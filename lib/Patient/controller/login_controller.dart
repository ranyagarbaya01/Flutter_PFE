
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
//warini trah wenty tabaath f request maaha el token fi ay blasa trah ...
// kif njareb tw bch n3mll commande kif ysejelha b  informations mt3 user eli 3emell login 
  Future<void> login(User user, context) async {
    update();
    try {// warini el fonction eli tabaath beha fel flutter
      isLoading.value = true;
      // Appelez votre API pour vous connecter et obtenir le token
      final token = await _apiService.login(user);
      print(
          '---------------------------------------------------------token : $token');
      if (token == null || token.isEmpty) {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ));
      } else {
        print("got token------------------------ getting into cache");
        await cacheToken(token); // hedhi tsajel el token f cache !!! mch lokhra kima fasartlek ...
        // hedhi tekho el token mel reponse mtaa el login w t7otha fel cache, beeehii taw kif bech tabaath aya request lel serveur tabaath maaha el token el tjibha bel getToken
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
  print("caching token---------------------11111111---$token");
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  print("caching token---------------------2222222222---");

  sharedPreferences.setString('token', token);
}
// shared  preferences houwa variable eli ba9i yetsejell fih token w mn b3d n3mloulh get bl getToken 
Future getToken() async {
  // hedhi win kaada t3aytelha ?
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  print(sharedPreferences);
  // print all shared preferences
  print(sharedPreferences.getKeys());
  final token =
      sharedPreferences.getString('token'); // hedhi tsajel el token f variable
  print(
      "token 000000000000000000000000000000000000000: $token"); //just nheb naaref 3leh lena temchi w ghadi le dkika

  if (token != null) {
    // w lahne traja3ha el token !
    return token;
  } else {
    return "";
  }
}
