import 'package:get/get.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';
import 'package:pharmacy_app/pharmacien/service/pharmacien_service.dart';

class PharmacieController extends GetxController {
  static Future<void> savePharmacie(
      User user,
      String email,
      DateTime heureOuv,
      DateTime heureFerm,
      double latitude,
      double longitude,
      int codesecurite) async {
    try {
      final List<int> codesecList = await PharmacieService.getAllCodesec();

      if (!codesecList.contains(codesecurite)) {
        throw Exception('Code de sécurité invalide');
      }

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
      print('Ajout avec succès du pharmacie');
    } catch (e) {
      print('Erreur lors de l\'ajout de pharmacie : $e');
      rethrow;
    }
  }
}
