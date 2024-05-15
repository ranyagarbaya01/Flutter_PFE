import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';
import 'package:pharmacy_app/pharmacien/service/pharmacien_service.dart';

class PharmacieController extends GetxController {
  static Future<void> savePharmacie(User user, String email, DateTime heureOuv,
      DateTime heureFerm, double latitude, double longitude, int codesecurite) async {
    try {
      final Map<String, dynamic> data = {
        'user': user.toJson(),
        'email': email,
        'heure_ouv': heureOuv.toIso8601String(),
        'heure_ferm': heureFerm.toIso8601String(),
        'latitude': latitude,
        'longitude': longitude,
        'codesecurite': codesecurite,
      };

      await PharmacieService.createPharmacie(data);
      print('Ajout avec succées du pharmacie');
    } catch (e) {
      print('Erreur lors d ajout de pharmacie : $e');
      rethrow;
    }
  }
}








// class PharmacieController extends GetxController {
//   RxBool isLoading = false.obs;


//   Future<void> Pharmacienliste(User user, String email, DateTime heureOuv, DateTime heureFerm, String adresse) async {
//     isLoading.value = true;
//     if (email.isEmpty || heureOuv == null || heureFerm == null || adresse.isEmpty
//         ) {
//       isLoading.value = false;
//       return;
//     }
//     try {
//       // Construire le corps de la requête avec les données d'inscription
//       var body = {
//         'user': user.toJson(),
//         'email': email,
//         'heure_ouv': heureOuv.toIso8601String(),
//         'heure_ferm': heureFerm.toIso8601String(),
//         'adresse': adresse,
//       };

//      final String url = '$baseUrl/pharmacies/';
//     final response = await http.post(
//       Uri.parse(url),
//       body: body,
//     );

//    if (response.statusCode == 200) {
//         // Inscription réussie
//         print("Inscription réussie !");
//       } else {
//         // Gérer les erreurs de l'API
//         print("Erreur lors de l'inscription : ${response.statusCode}");
//       }
//     } catch (e) {
//       // Gérer les erreurs de connexion ou autres exceptions
//       print("Erreur lors de l'inscription : $e");
//     }

//     isLoading.value = false;
      
//     }

//   static void pharmacienController(String text, String text2) {}
//   }

