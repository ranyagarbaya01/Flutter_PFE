List<Livraison> livraisonListFromJson(List<dynamic> val) =>
    val.map((livraisons) => Livraison.fromJson(livraisons)).toList();

class Livraison {
  int? id_livraison;
  int? patientId;
  String? patientName;
  String? patientFamilyName;
  String? patientPhone;
  String? patientAddress;
  String? orderStatus;
  int? confirmationcode;
  int? livreur;
  int? commande;

  Livraison({
    this.id_livraison,
    this.patientId,
    this.patientName,
    this.patientFamilyName,
    this.patientPhone,
    this.patientAddress,
    this.orderStatus,
    this.confirmationcode,
    this.livreur,
    this.commande,
  });

  Livraison.fromJson(Map<String, dynamic> json) {
    id_livraison = json['id_livraison'];
    patientId = json['patient'];
    patientName = json['patientName'];
    patientFamilyName = json['patientFamilyName'];
    patientPhone = json['patientPhone'];
    patientAddress = json['patientAddress'];
    orderStatus = json['orderStatus'];
    confirmationcode = json['confirmationcode'];
    livreur = json['livreur'];
    commande = json['commande'];
  }
}

// class Livraison {
//   final Patient patient;
//   final String orderStatus;
//   final int confirmationCode;
//   final int livreur;
//   final int commande;

//   Livraison({
//     required this.patient,
//     required this.orderStatus,
//     required this.confirmationCode,
//     required this.livreur,
//     required this.commande,
//   });

//   factory Livraison.fromJson(Map<String, dynamic> json) {
//     return Livraison(
//       patient: Patient.fromJson(json['patient']),
//       orderStatus: json['orderStatus']?.toString() ?? '',
//       confirmationCode: json['confirmationCode'] as int? ?? 0,
//       livreur: json["livreur"] as int? ?? 0,
//       commande: json["commande"] as int? ?? 0,
//     );
//   }
// }
