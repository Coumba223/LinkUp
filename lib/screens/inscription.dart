import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/screens/connexion.dart';
import 'package:linkupapp/screens/home.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool visible = false;

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Rejoignez LinkUp",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),

                const Text(
                  "Commencez à réinventer votre réseau dès aujourd'hui",
                ),

                const SizedBox(height: 5),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // NOM ET PRENOM
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Nom"),
                        ),
                      ),

                      TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(
                          hintText: "Saisissez votre nom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Veuillez saisir votre nom ";
                          }

                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Prénom"),
                        ),
                      ),

                      TextFormField(
                        controller: _prenomController,
                        decoration: InputDecoration(
                          hintText: "Saisissez votre prénom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Veuillez saisir votre prénom";
                          }

                          return null;
                        },
                      ),

                      // EMAIL
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Adresse Email"),
                        ),
                      ),

                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Saisissez votre email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Veuillez saisir votre email";
                          }

                          if (!RegExp(
                            r'^[^@]+@[^@]+\.[^@]+',
                          ).hasMatch(value.trim())) {
                            return "Veuillez saisir un email valide";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 5),

                      // MOT DE PASSE
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Mot de passe"),
                        ),
                      ),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: !visible,
                        decoration: InputDecoration(
                          hintText: "Saisissez votre mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: Icon(
                              visible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Veuillez saisir votre mot de passe";
                          }

                          if (value.length < 8) {
                            return "Entrez au moins 8 caractères";
                          }

                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return "Le mot de passe doit contenir une majuscule";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      // CONFIRMATION MOT DE PASSE
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Confirmez votre mot de passe"),
                        ),
                      ),

                      TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: !visible,
                        decoration: InputDecoration(
                          hintText: "Confirmez votre mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: Icon(
                              visible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Veuillez resaisir votre mot de passe";
                          }

                          if (value != _passwordController.text) {
                            return "Vos deux mots de passe ne correspondent pas";
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // BOUTON INSCRIPTION
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String nom = _nomController.text.trim();
                      String prenom = _prenomController.text.trim();
                      String email = _emailController.text.trim();
                      String password = _passwordController.text;

                      bool inscrit = await inscrire(
                        nom: nom,
                        prenom: prenom,
                        email: email,
                        password: password,
                      );

                      if (inscrit) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF0845C3),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Créer mon compte",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 5),

                // OR
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Ou"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 10),

                // BOUTON CONNEXION
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Connexion(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 120,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(color: Color(0XFF0845C3)),
                  ),
                ),

                const SizedBox(height: 10),

                // CONDITIONS
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "En m’inscrivant ou en me connectant, j’accepte",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: " les Conditions d’utilisation",
                        style: TextStyle(color: Color(0XFF0845C3)),
                      ),
                      TextSpan(text: " et "),
                      TextSpan(
                        text: "la Politique de confidentialité",
                        style: TextStyle(color: Color(0XFF0845C3)),
                      ),
                      TextSpan(text: " de l’application."),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
