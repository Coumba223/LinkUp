import 'dart:convert';

import 'package:linkupapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Inscription
Future<bool> inscrire({required String email, required String password}) async {
  User user = User(email: email, password: password);
  String donneesJson = jsonEncode(user.toJson());
  final prefs = await SharedPreferences.getInstance();
  bool connected = await prefs.setString("user", donneesJson);
  return connected;
}

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
