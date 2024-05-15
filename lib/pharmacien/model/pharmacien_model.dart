List<Pharmacie> pharmacieListFromJson(List<dynamic> val) =>
    List<Pharmacie>.from(val.map((pharmacie) => Pharmacie.fromJson(pharmacie)));

class User {
  String? id;
  String? username;
  String? password;
  bool? isActive;

  User({this.id, this.username, this.password, this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    username = json['username'];
    password = json['password'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Pharmacie {
  User? user;
  int? id;
  String? email;
  DateTime? heureOuv;
  DateTime? heureFerm;
  int? codesecurite;
  double? latitude;
  double? longitude;
  String? role;
  bool isSelected = false;

  Pharmacie(
      {this.user,
      this.id,
      this.email,
      this.heureOuv,
      this.heureFerm,
      this.codesecurite,
      this.latitude,
      this.longitude,
      this.role});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['heure_ouv'] = this.heureOuv;
    data['heure_ferm'] = this.heureFerm;
    data['codesecurite'] = this.codesecurite;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['role'] = this.role;
    return data;
  }

  Pharmacie.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    id = json['id'];
    email = json['email'];
    heureOuv = DateTime.parse(json['heure_ouv'].toString());
    heureFerm = DateTime.parse(json['heure_ferm'].toString());
    codesecurite = json['codesecurite'];
    latitude = double.tryParse(json['latitude']?.toString() ?? '0.0');
    longitude = double.tryParse(json['longitude']?.toString() ?? '0.0');
    role = json['role']?.toString();
    isSelected = false;
  }

  @override
  String toString() {
    return 'Pharmacie{id: $id}'; // Replace 'id' with the actual field name for the id in the Pharmacie class
  }
}
