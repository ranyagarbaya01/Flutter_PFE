






import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/model/List_command_model.dart';
import 'package:pharmacy_app/Patient/model/medicament_model.dart';
import 'package:pharmacy_app/Patient/service/list_command_service.dart';
import 'package:pharmacy_app/Patient/service/medicament_service.dart';
import 'package:pharmacy_app/Patient/view/list_command.dart';

class ListCommandeController extends GetxController {
  static ListCommandeController instance = Get.find();
  RxList<ListCommande> commandeList = <ListCommande>[].obs;
  RxBool isListCommandLoading = false.obs;

  @override
  void onInit() {
    getCommand();
    super.onInit();
  }

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
      print('Erreur lors de la récupération des données des médicaments: $e');
    } finally {
      isListCommandLoading(false);
    }
  }
}
