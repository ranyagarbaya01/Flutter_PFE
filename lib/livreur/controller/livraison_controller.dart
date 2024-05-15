import 'dart:convert';

import 'package:get/get.dart';
import 'package:pharmacy_app/livreur/model/livraison.dart';
import 'package:pharmacy_app/livreur/service/Livraison_service.dart';

class LivraisonController extends GetxController {
  static LivraisonController instance = Get.find();
  RxList<Livraison> livraisonList = <Livraison>[].obs;
  RxBool isListLivraisonLoading = false.obs;
  RxBool isLivraisonUpdating = false.obs;

  //List<Medicament> commandList = <Medicament>[].obs;

  @override
  void onInit() {
    getLivraison();
    super.onInit();
  }

  // void addMedicamentToCommandList(Medicament medicament) {
  //   if (commandList.contains(medicament)) {
  //     return;
  //   }
  //   commandList.add(medicament);
  //   update(); // This will update the UI
  // }

  void getLivraison() async {
    try {
      isListLivraisonLoading(true);
      var result = await LivraisonService().get();
      if (result != null) {
        final responseBody = jsonDecode(result.body);
        livraisonList.assignAll(livraisonListFromJson(responseBody));
      }
    } catch (e) {
      // En cas d'erreur lors de la récupération des données
      print('Erreur lors de la récupération des données des livraisons: $e');
    } finally {
      isListLivraisonLoading(false);
    }
  }

  Future<void> updateLivraison(int id) async {
    try {
      isLivraisonUpdating = true.obs;
      var result = await LivraisonService().updateLivraison(id);
      isLivraisonUpdating = false.obs;
      if (result.statusCode == 200) {
        Livraison livraison = livraisonList
            .firstWhere((livraison) => livraison.id_livraison == id);
        livraison.orderStatus = 'livrée';
        update();
      }
    } catch (e) {
      print('Erreur lors de la mise à jour des données des livraisons: $e');
    }
  }
}
