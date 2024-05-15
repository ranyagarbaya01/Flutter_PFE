import 'dart:convert';

import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/service/list_pharmacies_service.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

class ListPharmacieController extends GetxController {
  static ListPharmacieController instance = Get.find();
  RxList<Pharmacie> pharmacieList = <Pharmacie>[].obs;
  RxBool isListPharmacieLoading = false.obs;

  @override
  void onInit() {
    getPharmacie();
    super.onInit();
  }

  void getPharmacie() async {
    try {
      isListPharmacieLoading(true);
      var result = await ListPharmacieService().get();
      print(result.body);
      if (result != null) {
        final responseBody = jsonDecode(result.body);
        pharmacieList.assignAll(pharmacieListFromJson(responseBody));
      }
    } catch (e) {
      // En cas d'erreur lors de la récupération des données
      print('Erreur lors de la récupération des données des pharmacies: $e');
    } finally {
      isListPharmacieLoading(false);
    }
  }
}
