import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/contact.dart';
import 'package:linkupapp/models/user.dart';

class NouveauContact extends StatefulWidget {
  const NouveauContact({super.key});

  @override
  State<NouveauContact> createState() => _NouveauContactState();
}

class _NouveauContactState extends State<NouveauContact> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _sitewebController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  User? user;

  @override
  void initState() {
    super.initState();
    chargerUtilisateur();
  }

  Future<void> chargerUtilisateur() async {
    User? resultat = await getCurrentUser();

    setState(() {
      user = resultat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),

      appBar: AppBar(
        backgroundColor: const Color(0XFFEEF6FE),
        title: const Text("Nouveau Contact"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const CircleAvatar(radius: 45),

                        const SizedBox(height: 5),

                        const Divider(),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Nouveau Contact"),
                                ),
                              ),

                              // NOM
                              TextFormField(
                                controller: _nomController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "Nom",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez saisir le nom";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              // PRENOM
                              TextFormField(
                                controller: _prenomController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "Prénom",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez saisir le prénom";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              // EMAIL
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez saisir l'email";
                                  }

                                  if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  ).hasMatch(value.trim())) {
                                    return "Veuillez saisir un email valide";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              // TELEPHONE
                              TextFormField(
                                controller: _telController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "Numéro de téléphone",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez saisir le numéro de téléphone";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              // SITE WEB
                              TextFormField(
                                controller: _sitewebController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "Site Web",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez mentionner le site web";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              // LINKEDIN
                              TextFormField(
                                controller: _linkedinController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  hintText: "LinkedIn",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white38,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Veuillez saisir le LinkedIn";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // BOUTON AJOUTER
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      String nom = _nomController.text.trim();
                      String prenom = _prenomController.text.trim();
                      String email = _emailController.text.trim();
                      String tel = _telController.text.trim();
                      String siteweb = _sitewebController.text.trim();
                      String linkedin = _linkedinController.text.trim();

                      Contact contact = Contact(
                        nom: nom,
                        prenom: prenom,
                        email: email,
                        telephone: tel,
                        siteWeb: siteweb,
                        linkedin: linkedin,
                      );

                      bool added = await addNewContact(contact);

                      if (added) {
                        _nomController.clear();
                        _prenomController.clear();
                        _emailController.clear();
                        _telController.clear();
                        _sitewebController.clear();
                        _linkedinController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Contact ajouté avec succès"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ce contact existe déjà"),
                          ),
                        );
                      }
                    }
                  },

                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0XFF0845C3),
                    ),
                    child: const Center(
                      child: Text(
                        "Ajouter au contact",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // NOUVEAU SCAN
              ],
            ),
          ),
        ),
      ),
    );
  }
}
