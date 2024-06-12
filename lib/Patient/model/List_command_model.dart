import 'dart:io';

import 'package:pharmacy_app/Patient/model/command_medic.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';

import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

class CommandMedicc {
  int? medicament;
  int? qnt;
  String? confirmation_adresse;
  Pharmacie? pharmacie_proche;

  CommandMedicc({
    this.medicament,
    this.qnt,
    this.confirmation_adresse,
    this.pharmacie_proche,
  });

  CommandMedicc.fromJson(Map<String, dynamic> json) {
    medicament = json['medicament'];
    qnt = json['qnt'];
    confirmation_adresse = json['confirmation_adresse'];
    pharmacie_proche = json['pharmacie_proche'] != null
        ? Pharmacie.fromJson(json['pharmacie_proche'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicament'] = this.medicament;
    data['qnt'] = this.qnt;
    data['confirmation_adresse'] = this.confirmation_adresse;
    data['pharmacie_proche'] = this.pharmacie_proche?.toJson();

    return data;
  }

  @override
  String toString() {
    return 'CommandMedic{medicament: $medicament, qnt: $qnt, confirmation_adresse: $confirmation_adresse, pharmacie_proche: $pharmacie_proche}';
  }
}

List<ListCommande> commandeListFromJson(List<dynamic> val) =>
    List<ListCommande>.from(
        val.map((commande) => ListCommande.fromJson(commande)));

class ListCommande {
  final List<CommandMedicc>? reservations;
  final Patient patient;
  File? cnam;
  final String description;
  final String confirmadresse;
  File? ordonnance;
  final Pharmacie pharmacies; // Change to Pharmacie model

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
          ? List<CommandMedicc>.from(
              json['reservations'].map((v) => CommandMedicc.fromJson(v)))
          : null,
      cnam: json['cnam'] != null ? File(json['cnam']) : null,
      description: json['description']?.toString() ?? '',
      confirmadresse: json['confirmadresse']?.toString() ?? '',
      ordonnance: json['ordonnance'] != null ? File(json['ordonnance']) : null,
      pharmacies: Pharmacie.fromJson(
          json['pharmacies']), // Ensure a default value if null
    );
  }

  @override
  String toString() {
    return 'ListCommande{reservations: $reservations, patient: $patient, cnam: $cnam, description: $description, confirmadresse: $confirmadresse, ordonnance: $ordonnance, pharmacies: $pharmacies}';
  }
}
