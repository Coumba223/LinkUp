import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/user.dart';

class InfoPerso extends StatefulWidget {
  const InfoPerso({super.key});

  @override
  State<InfoPerso> createState() => _InfoPersoState();
}

class _InfoPersoState extends State<InfoPerso> {
  User? user;

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController siteWebController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chargerUtilisateur();
  }

  Future<void> chargerUtilisateur() async {
    User? utilisateur = await getCurrentUser();

    if (utilisateur != null) {
      setState(() {
        user = utilisateur;

        nomController.text = utilisateur.nom ?? "";
        prenomController.text = utilisateur.prenom ?? "";
        professionController.text = utilisateur.profession ?? "";
        telephoneController.text = utilisateur.telephone ?? "";
        emailController.text = utilisateur.email;
        siteWebController.text = utilisateur.siteWeb ?? "";
        linkedinController.text = utilisateur.linkedin ?? "";
      });
    }
  }

  Future<void> mettreAJour() async {
    if (user == null) return;

    User utilisateurModifie = User(
      nom: nomController.text,
      prenom: prenomController.text,
      profession: professionController.text,
      telephone: telephoneController.text,
      email: emailController.text,
      password: user!.password,
      siteWeb: siteWebController.text,
      linkedin: linkedinController.text,
    );

    await updateUser(utilisateurModifie);

    if (!mounted) return;

    setState(() => user = utilisateurModifie);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Informations mises à jour avec succès")),
    );

    Navigator.pop(context, utilisateurModifie);
  }

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    professionController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    siteWebController.dispose();
    linkedinController.dispose();

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
          "Informations personnelles",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  // PHOTO
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0XFFE3EDFF),

                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Color(0XFF0845C3),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // NOM
                  TextField(
                    controller: nomController,

                    decoration: InputDecoration(
                      labelText: "Nom",
                      prefixIcon: const Icon(Icons.person_outline),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // PRÉNOM
                  TextField(
                    controller: prenomController,

                    decoration: InputDecoration(
                      labelText: "Prénom",
                      prefixIcon: const Icon(Icons.person_outline),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // PROFESSION
                  TextField(
                    controller: professionController,
                    decoration: InputDecoration(
                      labelText: "Profession",
                      prefixIcon: const Icon(Icons.badge_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // TELEPHONE
                  TextField(
                    controller: telephoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Numéro de téléphone",
                      prefixIcon: const Icon(Icons.phone_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // EMAIL
                  TextField(
                    controller: emailController,

                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // SITE WEB
                  TextField(
                    controller: siteWebController,

                    decoration: InputDecoration(
                      labelText: "Site web",
                      prefixIcon: const Icon(Icons.language),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // LINKEDIN
                  TextField(
                    controller: linkedinController,

                    decoration: InputDecoration(
                      labelText: "LinkedIn",
                      prefixIcon: const Icon(Icons.work_outline),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BOUTON ENREGISTRER
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: mettreAJour,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF0845C3),
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        "Enregistrer les modifications",
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
