import 'dart:convert';

class Contact {
  String? nom;
  String? prenom;
  String? profession;
  String? email;
  String? telephone;
  String? siteWeb;
  String? linkedin;

  Contact({
    this.nom,
    this.prenom,
    this.profession,
    this.email,
    this.telephone,
    this.siteWeb,
    this.linkedin,
  });

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "profession": profession,
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
      profession: json["profession"],
      email: json["email"],
      telephone: json["telephone"],
      siteWeb: json["siteWeb"],
      linkedin: json["linkedin"],
    );
  }
}
