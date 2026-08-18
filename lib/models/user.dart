import 'dart:convert';

class User {
  String? nom;
  String? prenom;
  String email;
  String password;
  String? siteWeb;
  String? linkedin;

  User({
    required this.email,
    required this.password,
    this.nom,
    this.prenom,
    this.siteWeb,
    this.linkedin,
  });

  String getInfo() {
    Map<String, dynamic> infos = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "SiteWeb": siteWeb,
      "linkedin": linkedin,
    };
    String donneesJson = jsonEncode(infos);

    return donneesJson;
  }

  factory User.decodeUserInfo(String stringData) {
    Map<String, dynamic> donnees = jsonDecode(stringData);
    return User.fromJson(donnees);
  }

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "password": password,
      "siteWeb": siteWeb,
      "linkedin": linkedin,
    };
  }

  factory User.fromJson(Map<String, dynamic> jSon) {
    return User(
      nom: jSon["nom"],
      email: jSon["email"],
      password: jSon["password"],
      prenom: jSon["prenom"],
      siteWeb: jSon["siteWeb"],
      linkedin: jSon["linkedin"],
    );
  }
}
