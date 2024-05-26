import 'dart:convert';

import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/model/List_command_model.dart';
import 'package:pharmacy_app/Patient/service/list_command_service.dart';

class ListCommandeController extends GetxController {
  static ListCommandeController instance = Get.find();
  RxList<ListCommande> commandeList = <ListCommande>[].obs;
  RxBool isListCommandLoading = false.obs;

  void getCommand() async {
    try {
      isListCommandLoading(true);
      var result = await ListCommandeService().get();
      if (result != null) {
        final responseBody = jsonDecode(result.body);
        commandeList.assignAll(commandeListFromJson(responseBody));
      }
    } catch (e) {
      // En cas d'erreur lors de la récupération des données
      print('Erreur lors de la récupération des données des commandes: $e');
    } finally {
      isListCommandLoading(false);
    }
  }
}
