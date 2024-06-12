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
  bool isTermine;

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
    this.isTermine = false,
  });

  Livraison.fromJson(Map<String, dynamic> json)
      : id_livraison = json['id_livraison'],
        patientId = json['patient'],
        patientName = json['patientName'],
        patientFamilyName = json['patientFamilyName'],
        patientPhone = json['patientPhone'],
        patientAddress = json['patientAddress'],
        orderStatus = json['orderStatus'],
        confirmationcode = json['confirmationcode'],
        livreur = json['livreur'],
        commande = json['commande'],
        isTermine = json['is_termine'] ?? false;
}

List<Livraison> livraisonListFromJson(List<dynamic> val) =>
    val.map((livraisons) => Livraison.fromJson(livraisons)).toList();
