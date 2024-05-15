import 'dart:io';

import 'package:pharmacy_app/Patient/model/command_medic.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

class Command {
  final List<CommandMedic>? reservations;
  final String? confirmadresse;
  
  final int? patient;
  final File? cnam;
  final String? description;
  final File? ordonnance;
  final String? pharmacies;

  Command({
    this.reservations,
    this.patient,
    this.cnam,
    this.description,
    this.confirmadresse,
    this.ordonnance, 
    this.pharmacies,
    
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient'] = patient;
    if (reservations != null) {
      data['reservations'] = reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  //method to string
  @override
  String toString() {
    return 'Command{reservations: $reservations, patient: $patient}';
  }
}
