import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/model/command_medic.dart';
import 'package:pharmacy_app/Patient/model/ligne_commande.dart';
import 'package:pharmacy_app/Patient/service/panier_service.dart';

import 'medicament_controller.dart';

class CommandController extends GetxController {
  final CommandService _commandService = CommandService();
  MedicamentController medicamentController = Get.find();

  //  i want to add a list of medicamentList to the command

  final RxList<CommandMedic> reservations = <CommandMedic>[].obs;

  int patientId = 1;

  CommandController();

  // Method to create a command
  Future<void> createCommand(String confirmation_adresse, String pharmacieId,
      BuildContext context) async {
    print('pharmacieId $pharmacieId');
    for (var medicament in medicamentController.commandList) {
      final commandMedic = CommandMedic(
        medicament: int.parse(medicament.id.toString()),
        qnt: medicament.quantiteACommander!.value ?? 1,
        confirmation_adresse: confirmation_adresse,
        pharmacie_proche: int.parse(pharmacieId),
      );
      reservations.add(commandMedic);
    }
    final command = Command(
      reservations: reservations,
      confirmadresse: '',
      patient: patientId,
      cnam: null,
      description: '',
      ordonnance: null,
      pharmacies: '',
    );
    try {
      log("command $command");
      await _commandService.createCommand(command);
      // Clear medicament list after successful command creation
      reservations.clear();
    } catch (e) {
      // Handle error
      print('Error creating command: $e');
    }
  }
}
