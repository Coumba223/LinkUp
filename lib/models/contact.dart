import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Contact {
  String? nom;
  String? prenom;
  String? email;
  String? telephone;
  String? siteWeb;
  String? linkedin;

  Contact({
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    this.siteWeb,
    this.linkedin,
  });

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "telephone": telephone,
      "siteWeb": siteWeb,
      "linkedin": linkedin,
    };
  }
  factory Contact.decodeUserInfo(String stringData) {
    Map<String, dynamic> donnees = jsonDecode(stringData);
    return Contact.fromJson(donnees);
  }


  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"],
      telephone: json["telephone"],
      siteWeb: json["siteWeb"],
      linkedin: json["linkedin"],
    );
  }
  
}
