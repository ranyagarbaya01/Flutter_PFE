import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/model/medicament_model.dart';
import 'package:pharmacy_app/Patient/service/medicament_service.dart';

class MedicamentController extends GetxController {
  static MedicamentController instance = Get.find();
  RxList<Medicament> medicamentList = <Medicament>[].obs;
  RxBool isMedicamentLoading = false.obs;

  List<Medicament> commandList = <Medicament>[].obs;

  @override
  void onInit() {
    getMedicament();
    super.onInit();
  }

  void addMedicamentToCommandList(Medicament medicament) {
    if (commandList.contains(medicament)) {
      return;
    }
    commandList.add(medicament);
    update(); // This will update the UI
  }

  void getMedicament() async {
    try {
      isMedicamentLoading(true);
      var result = await RenoteMedicamentService().get();
      if (result != null) {
        final responseBody = jsonDecode(result.body);
        medicamentList.assignAll(medicamentListFromJson(responseBody));
      }
    } catch (e) {
      // En cas d'erreur lors de la récupération des données
      print('Erreur lors de la récupération des données des médicaments: $e');
    } finally {
      isMedicamentLoading(false);
    }
  }
}
