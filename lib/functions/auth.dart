import 'dart:convert';
import 'dart:ffi';

import 'package:linkupapp/models/contact.dart';
import 'package:linkupapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Inscription
Future<bool> inscrire({
  required String nom,
  required String prenom,
  required String email,
  required String password,
  
}) async {
  User user = User(nom: nom, prenom: prenom, email: email, password: password);
  String donneesJson = jsonEncode(user.toJson());
  final prefs = await SharedPreferences.getInstance();
  bool connected = await prefs.setString("user", donneesJson);
  return connected;
}

//Conexion
Future<bool> connexion({
  required String email,
  required String password,
}) async {
  final prefs = await SharedPreferences.getInstance();
  String? donneesJson = prefs.getString("user");
  if (donneesJson == null) {
    return false;
  }
  Map<String, dynamic> donnees = jsonDecode(donneesJson);
  User user = User.fromJson(donnees);
  if (user.email == email && user.password == password) {
    return true;
  }
  return false;
}

//Recupere l'utilisateur
Future<User?> getCurrentUser() async {
  final prefs = await SharedPreferences.getInstance();
  String? donneesJson = prefs.getString("user");
  if (donneesJson == null) {
    return null;
  }
  Map<String, dynamic> donnees = jsonDecode(donneesJson);
  User user = User.fromJson(donnees);
  return user;
}

//Ajouter un contatct
Future<bool> addNewContact(Contact contact) async {
  final prefs = await SharedPreferences.getInstance();

  // Récupérer l'utilisateur connecté
  User? user = await getCurrentUser();

  if (user == null) {
    return false;
  }

  // Clé propre à l'utilisateur
  String cleContacts = "contacts_${user.email}";

  // Récupérer ses contacts
  List<String> contacts = prefs.getStringList(cleContacts) ?? [];

  // Vérifier si le contact existe déjà
  bool existeDeja = contacts.any((contactJson) {
    Contact ancienContact = Contact.decodeUserInfo(contactJson);

    return ancienContact.email?.toLowerCase() == contact.email?.toLowerCase();
  });

  // Si le contact existe déjà
  if (existeDeja) {
    return false;
  }

  // Ajouter le nouveau contact
  contacts.add(jsonEncode(contact.toJson()));

  await prefs.setStringList(cleContacts, contacts);

  return true;
}

//Afficher les contacts
Future<List<Contact>> getContacts() async {
  final prefs = await SharedPreferences.getInstance();

  User? user = await getCurrentUser();

  if (user == null) {
    return [];
  }

  String emailUtilisateur = user.email;

  String cleContacts = "contacts_$emailUtilisateur";

  List<String> contacts = prefs.getStringList(cleContacts) ?? [];

  return contacts.map((contact) {
    return Contact.decodeUserInfo(contact);
  }).toList();
}

//Mettre a jour les informations d'un utilisateur
Future<bool> updateUser(User user) async {
  final prefs = await SharedPreferences.getInstance();

  String donneesJson = jsonEncode(user.toJson());

  await prefs.setString("user", donneesJson);

  return true;
}

Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.remove("user");
}
