import 'dart:convert';
import 'package:get/get.dart';
import 'package:pharmacy_app/livreur/model/livraison.dart';
import 'package:pharmacy_app/livreur/service/livraison_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LivraisonController extends GetxController {
  static LivraisonController instance = Get.find();
  RxList<Livraison> livraisonList = <Livraison>[].obs;
  RxBool isListLivraisonLoading = false.obs;
  RxBool isLivraisonUpdating = false.obs;

  @override
  void onInit() {
    getLivraison();
    super.onInit();
  }

  void getLivraison() async {
    try {
      isListLivraisonLoading(true);
      var result = await LivraisonService().get();
      if (result != null) {
        final responseBody = jsonDecode(result.body);
        livraisonList.assignAll(livraisonListFromJson(responseBody));
      }
    } catch (e) {
      print('Erreur lors de la récupération des données des livraisons: $e');
    } finally {
      isListLivraisonLoading(false);
    }
  }

  Future<void> updateLivraisonStatus(int livr_id) async {
    try {
      isLivraisonUpdating(true);
      int? livreurId = await getLivreurId();
      if (livreurId != null) {
        print(
            "Updating status for Livraison ID: $livr_id with livreurId: $livreurId");
        var result =
            await LivraisonService().updateLivraisonStatus(livr_id, livreurId);
        print("Response status: ${result.statusCode}");
        if (result.statusCode == 200) {
          Livraison livraison = livraisonList
              .firstWhere((livraison) => livraison.id_livraison == livr_id);
          livraison.orderStatus = 'livré';
          update();
          print("Status updated to 'livré' for Livraison ID: $livr_id");
        } else {
          print("Failed to update status for Livraison ID: $livr_id");
        }
      }
    } catch (e) {
      print('Erreur lors de la mise à jour des données des livraisons: $e');
    } finally {
      isLivraisonUpdating(false);
    }
  }

  Future<void> updateLivraisonTermine(int livr_id) async {
    try {
      isLivraisonUpdating(true);
      int? livreurId = await getLivreurId();
      if (livreurId != null) {
        print(
            "Updating termine for Livraison ID: $livr_id with livreurId: $livreurId");
        var result =
            await LivraisonService().updateLivraisonTermine(livr_id, livreurId);
        print("Response status: ${result.statusCode}");
        if (result.statusCode == 200) {
          Livraison livraison = livraisonList
              .firstWhere((livraison) => livraison.id_livraison == livr_id);
          livraison.isTermine = true;
          update();
          print("Termine updated to 'true' for Livraison ID: $livr_id");
        } else {
          print("Failed to update termine for Livraison ID: $livr_id");
        }
      }
    } catch (e) {
      print('Erreur lors de la mise à jour des données des livraisons: $e');
    } finally {
      isLivraisonUpdating(false);
    }
  }

  Future<int?> getLivreurId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('loggedInLivreurId');
  }
}
