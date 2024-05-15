import 'dart:io';

import 'package:pharmacy_app/Patient/model/command_medic.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';

List<ListCommande> commandeListFromJson(List<dynamic> val) =>
    List<ListCommande>.from(
        val.map((commande) => ListCommande.fromJson(commande)));

class ListCommande {
  final List<CommandMedic>? reservations;
  final Patient patient;
  File? cnam;
  final String description;
  final String confirmadresse;
  File? ordonnance;
  final String pharmacies;

  ListCommande({
    this.reservations,
    required this.patient,
    this.cnam,
    required this.description,
    required this.confirmadresse,
    this.ordonnance,
    required this.pharmacies,
  });

  factory ListCommande.fromJson(Map<String, dynamic> json) {
    return ListCommande(
      patient: Patient.fromJson(json['patient']),
      reservations: json['reservations'] != null
          ? List<CommandMedic>.from(
              json['reservations'].map((v) => CommandMedic.fromJson(v)))
          : null,
      cnam: json['cnam'] != null ? File(json['cnam']) : null,
      description: json['description'] ?? '',
      confirmadresse: json['confirmadresse'] ?? '',
      ordonnance: json['ordonnance'] != null ? File(json['ordonnance']) : null,
      pharmacies: json['pharmacies'] ?? '',
    );
  }
  //method to string
  @override
  String toString() {
    return 'Command{patient: $patient, reservations: $reservations, cnam: $cnam, description: $description, confirmadresse: $confirmadresse, ordonnance: $ordonnance, pharmacies: $pharmacies}';
  }
}
