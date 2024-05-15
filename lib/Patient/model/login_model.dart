class LoginModel {
  String? token;
  User? user;

  LoginModel({this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  User? user;
  String? nom;
  String? prenom;
  String? adresse;
  int? num;
  String? email;
  String? role;

  User(
      {this.id,
      this.user,
      this.nom,
      this.prenom,
      this.adresse,
      this.num,
      this.email,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    nom = json['nom'];
    prenom = json['prenom'];
    adresse = json['adresse'];
    num = json['num'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['adresse'] = this.adresse;
    data['num'] = this.num;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}

// class User {
//   int? id;
//   String? username;
//   bool? isActive;

//   User({this.id, this.username, this.isActive});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     isActive = json['is_active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['is_active'] = this.isActive;
//     return data;
//   }
// }
