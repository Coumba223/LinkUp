import 'dart:convert';

class User {
  String? nom;
  String? prenom;
  String email;
  String password;
  String? profession;
  String? info;

  User({
    required this.email,
    required this.password,
    this.nom,
    this.prenom,
    this.profession,
    this.info,
  });

  String getInfo() {
    Map<String, dynamic> infos = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "profession": profession,
      "info": info,
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
      "profession": profession,
      "info": info,
    };
  }

  factory User.fromJson(Map<String, dynamic> jSon) {
    return User(
      nom: jSon["nom"],
      email: jSon["email"],
      password: jSon["password"],
      prenom: jSon["prenom"],
      profession: jSon["profession"],
      info: jSon["info"],
    );
  }
}
