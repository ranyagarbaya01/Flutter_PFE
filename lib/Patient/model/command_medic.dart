class CommandMedic {
  int? medicament;
  int? qnt;
  String? confirmation_adresse;
  int? pharmacie_proche;

  CommandMedic(
      {this.medicament,
      this.qnt,
      this.confirmation_adresse,
      this.pharmacie_proche});

  CommandMedic.fromJson(Map<String, dynamic> json) {
    medicament = json['medicament'];
    qnt = json['qnt'];
    confirmation_adresse = json['confirmation_adresse'];
    pharmacie_proche = json['pharmacie_proche'];
    // pharmacie_proche = json['pharmacie_proche'] != null
    //     ? Pharmacie.fromJson(json['pharmacie_proche'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicament'] = this.medicament;
    data['qnt'] = this.qnt;
    data['confirmation_adresse'] = this.confirmation_adresse;
    data['pharmacie_proche'] = this.pharmacie_proche;
    // if (this.pharmacie_proche != null) {
    //   data['pharmacie_proche'] = this.pharmacie_proche!.toJson();
    // }

    return data;
  }

  //method to string
  @override
  String toString() {
    return 'CommandMedic{medicament: $medicament, qnt: $qnt, confirmation_adresse:$confirmation_adresse, pharmacie_proche: $pharmacie_proche}';
  }
}
