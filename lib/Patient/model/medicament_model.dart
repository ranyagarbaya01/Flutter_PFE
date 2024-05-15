// ignore_for_file: file_names

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<Medicament> medicamentListFromJson(List<dynamic> val) =>
    List<Medicament>.from(
        val.map((medicament) => Medicament.fromJson(medicament)));

class Medicament {
  final String id;
  final String nom;
  final String medicImage;
  final String nomPharmacie;
  final double prix;
  final String temps_liv;
  final String categorie;
  late RxInt? quantiteACommander = 0.obs;

  Medicament({
    required this.id,
    required this.temps_liv,
    required this.categorie,
    required this.nom,
    required this.medicImage,
    required this.nomPharmacie,
    required this.prix,
  });

  factory Medicament.fromJson(Map<String, dynamic> json) {
    return Medicament(
      id: json['id'].toString() ?? "",
      temps_liv: json['temps_liv'] ?? "",
      categorie: json['categorie']?.toString() ?? "",
      nom: json['nom'] ?? "",
      medicImage: json['medic_image'] ?? "",
      nomPharmacie: json['nompharmacie'] ?? "",
      prix: json['prix']?.toDouble() ?? 0.0,
    );
  }
}

// class Patient {
//   final int id;
//
//   // Add other patient properties here, if needed
//
//   Patient({
//     required this.id,
//     // Add other patient properties here, if needed
//   });
//
//   factory Patient.fromJson(Map<String, dynamic> json) {
//     return Patient(
//       id: int.parse(json['id']),
//     );
//   }
// }
//
// class Medicament {
// final int id;
// final String nom;
// final String medicImage;
// final String nomPharmacie;
// final double prix;
// final String temps_liv;
// final int categorie;
//
//   Medicament({
//     required this.id,
//     required this.temps_liv,
//     required this.categorie,
//     required this.nom,
//     required this.medicImage,
//     required this.nomPharmacie,
//     required this.prix,
//   });
//
//   factory Medicament.fromJson(Map<String, dynamic> json) {
//     return Medicament(
//       id: int.parse(json['id']),
//       temps_liv: json['temps_liv'],
//       categorie: int.parse(json['categorie']),
//       nom: json['nom'],
//       medicImage: json['medic_image'],
//       nomPharmacie: json['nompharmacie'],
//       prix: json['prix'].toDouble(),
//     );
//   }
// }
