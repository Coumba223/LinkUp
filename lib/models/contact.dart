class Contact {
  String nom;
  String prenom;
  String email;

  String tel;
  String profession;

  Contact({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.tel,
    required this.profession,
  });
  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "tel": tel,
      "profession": profession,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"],
      tel: json["tel"],
      profession: json["profession"],
    );
  }
}
