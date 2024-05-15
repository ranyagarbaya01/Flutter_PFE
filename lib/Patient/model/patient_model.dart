class User {
  String? username;
  String? password;
  bool? isActive;

  User({this.username, this.password, this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Patient {
  User? user;
  String? nom;
  String? prenom;
  String? adresse;
  int ? num;
  String? email;

  Patient(
      {this.user, this.nom, this.prenom, this.adresse, this.num, this.email});

  Patient.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    nom = json['nom'];
    prenom = json['prenom'];
    adresse = json['adresse'];
    num = json['num'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['adresse'] = this.adresse;
    data['num'] = this.num;
    data['email'] = this.email;
    return data;
  }
}