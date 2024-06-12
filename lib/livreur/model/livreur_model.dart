import 'package:pharmacy_app/Patient/model/patient_model.dart';

class Livreur {
  User? user;
  String? nom;
  String? prenom;
  int? num;
  String? email;
  String? role;

  Livreur({this.user, this.nom, this.prenom, this.num, this.email, this.role});

  Livreur.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    nom = json['nom'];
    prenom = json['prenom'];
    num = json['num'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['num'] = this.num;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
