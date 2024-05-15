import 'dart:io';

import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

class Commande {
  Patient patient;
  File cnam;
  final String description;
  final String confirmadresse;
  File ordonnance;
  Pharmacie pharmacies;

  Commande({
    required this.patient,
    required this.cnam,
    required this.description,
    required this.confirmadresse,
    required this.ordonnance,
    required this.pharmacies,
  });

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      patient: Patient.fromJson(json['patient']),
      cnam: json['cnam'],
      description: json['description'],
      confirmadresse: json['confirmadresse'],
      ordonnance: json['ordonnance'],
      pharmacies: json['pharmacies'],
    );
  }
}
