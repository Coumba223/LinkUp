import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/user.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  User? user;

  final TextEditingController ancienPasswordController =
      TextEditingController();

  final TextEditingController nouveauPasswordController =
      TextEditingController();

  final TextEditingController confirmationController = TextEditingController();

  bool afficherAncien = false;
  bool afficherNouveau = false;
  bool afficherConfirmation = false;

  @override
  void initState() {
    super.initState();
    chargerUtilisateur();
  }

  Future<void> chargerUtilisateur() async {
    User? utilisateur = await getCurrentUser();

    setState(() {
      user = utilisateur;
    });
  }

  Future<void> changerMotDePasse() async {
    if (user == null) return;

    // Vérifier l'ancien mot de passe
    if (ancienPasswordController.text != user!.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("L'ancien mot de passe est incorrect")),
      );
      return;
    }

    // Vérifier que le nouveau mot de passe n'est pas vide
    if (nouveauPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez saisir un nouveau mot de passe"),
        ),
      );
      return;
    }

    // Vérifier la confirmation
    if (nouveauPasswordController.text != confirmationController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Les mots de passe ne correspondent pas")),
      );
      return;
    }

    // Créer l'utilisateur avec le nouveau mot de passe
    User utilisateurModifie = User(
      nom: user!.nom,
      prenom: user!.prenom,
      profession: user!.profession,
      telephone: user!.telephone,
      email: user!.email,
      password: nouveauPasswordController.text,
      siteWeb: user!.siteWeb,
      linkedin: user!.linkedin,
    );

    // Sauvegarder
    await updateUser(utilisateurModifie);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Mot de passe modifié avec succès")),
    );

    // Retour à la page précédente
    Navigator.pop(context);
  }

  @override
  void dispose() {
    ancienPasswordController.dispose();
    nouveauPasswordController.dispose();
    confirmationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),

      appBar: AppBar(
        backgroundColor: const Color(0XFFEEF6FE),
        elevation: 0,

        title: const Text(
          "Modifier le mot de passe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Color(0XFF0845C3),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Modifier votre mot de passe",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Entrez votre ancien mot de passe puis choisissez un nouveau mot de passe.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  // ANCIEN MOT DE PASSE
                  TextField(
                    controller: ancienPasswordController,
                    obscureText: !afficherAncien,

                    decoration: InputDecoration(
                      labelText: "Ancien mot de passe",

                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        icon: Icon(
                          afficherAncien
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),

                        onPressed: () {
                          setState(() {
                            afficherAncien = !afficherAncien;
                          });
                        },
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // NOUVEAU MOT DE PASSE
                  TextField(
                    controller: nouveauPasswordController,
                    obscureText: !afficherNouveau,

                    decoration: InputDecoration(
                      labelText: "Nouveau mot de passe",

                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        icon: Icon(
                          afficherNouveau
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),

                        onPressed: () {
                          setState(() {
                            afficherNouveau = !afficherNouveau;
                          });
                        },
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // CONFIRMATION
                  TextField(
                    controller: confirmationController,
                    obscureText: !afficherConfirmation,

                    decoration: InputDecoration(
                      labelText: "Confirmer le nouveau mot de passe",

                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        icon: Icon(
                          afficherConfirmation
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),

                        onPressed: () {
                          setState(() {
                            afficherConfirmation = !afficherConfirmation;
                          });
                        },
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BOUTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: changerMotDePasse,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF0845C3),
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        "Modifier le mot de passe",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
