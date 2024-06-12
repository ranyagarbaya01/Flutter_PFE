import 'dart:io';

import 'package:pharmacy_app/Patient/model/command_medic.dart';

class Command {
  final List<CommandMedic>? reservations;
  final int patient;
  final File? cnam;
  final String description;
  final String confirmadresse;
  final File? ordonnance;
  final String pharmacies;

  Command({
    this.reservations,
    required this.patient,
    this.cnam,
    required this.description,
    required this.confirmadresse,
    this.ordonnance,
    required this.pharmacies,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.reservations != null) {
      data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    data['patient'] = this.patient;
    if (this.cnam != null) {
      data['cnam'] = this.cnam!.path;
    }
    data['description'] = this.description;
    data['confirmadresse'] = this.confirmadresse;
    if (this.ordonnance != null) {
      data['ordonnance'] = this.ordonnance!.path;
    }
    data['pharmacies'] = this.pharmacies;
    return data;
  }
}





// import 'dart:io';

// import 'package:pharmacy_app/Patient/model/patient_model.dart';
// import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

// class Commande {
//   Patient patient;
//   File cnam;
//   final String description;
//   final String confirmadresse;
//   File ordonnance;
//   Pharmacie pharmacies;

//   Commande({
//     required this.patient,
//     required this.cnam,
//     required this.description,
//     required this.confirmadresse,
//     required this.ordonnance,
//     required this.pharmacies,
//   });

//   factory Commande.fromJson(Map<String, dynamic> json) {
//     return Commande(
//       patient: Patient.fromJson(json['patient']),
//       cnam: json['cnam'],
//       description: json['description'],
//       confirmadresse: json['confirmadresse'],
//       ordonnance: json['ordonnance'],
//       pharmacies: json['pharmacies'],
//     );
//   }
// }
