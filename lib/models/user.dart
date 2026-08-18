import 'dart:convert';

class User {
  String? nom;
  String? prenom;
  String? profession;
  String? telephone;
  String email;
  String password;
  String? siteWeb;
  String? linkedin;

  User({
    required this.email,
    required this.password,
    this.nom,
    this.prenom,
    this.profession,
    this.telephone,
    this.siteWeb,
    this.linkedin,
  });

  String getInfo() {
    return jsonEncode({
      'nom': nom,
      'prenom': prenom,
      'profession': profession ?? '',
      'telephone': telephone ?? '',
      'email': email,
      'siteWeb': siteWeb ?? '',
      'linkedin': linkedin ?? '',
    });
  }

  factory User.decodeUserInfo(String data) {
    return User.fromJson(jsonDecode(data));
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'profession': profession,
      'telephone': telephone,
      'email': email,
      'password': password,
      'siteWeb': siteWeb,
      'linkedin': linkedin,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'],
      prenom: json['prenom'],
      profession: json['profession'],
      telephone: json['telephone'],
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      siteWeb: json['siteWeb'],
      linkedin: json['linkedin'],
    );
  }
}
