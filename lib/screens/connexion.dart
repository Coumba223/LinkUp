import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/screens/home.dart';
import 'package:linkupapp/screens/inscription.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
   
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                        child: Text(
                          "Bienvenue à bord",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Text(
                      "Veuillez renseigner les informations suivantes pour vous connecter.",
                    ),
                    SizedBox(height: 5),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                "Adresse Email",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
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
                              if (!value.contains("@")) {
                                return "Veullez saisir un email valide";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                "Mot de passe",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Saisissez votre mot de passe",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,

                              fillColor: Colors.white38,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: Icon(
                                  visible == true
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            obscureText: !visible,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Veuillez saisir votre mot de passe";
                              }

                              if (value.length < 8) {
                                return "Entrez au moins 8 caracteres";
                              }
                              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                return "le champ doit contenir une majuscule";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          bool connected = await connexion(
                            email: email,
                            password: password,
                          );
                          if (connected == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Vous n'avez pas de compte ou vos informations sont incorrectes.",
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF0845C3),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 110,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Se connecter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(child: Divider()),

                        Text("Or"),
                        Expanded(child: Divider()),
                      ],
                    ),

                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Inscription(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFFFFFF),

                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 100,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Créer mon compte",
                        style: TextStyle(color: Color(0XFF0845C3)),
                      ),
                    ),
                    SizedBox(height: 10),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "En m’inscrivant ou en me connectant, j’accepte",
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: " les Conditions d’utilisation",
                            style: TextStyle(color: Color(0XFF0845C3)),
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "la Politique de confidentialité",
                            style: TextStyle(color: Color(0XFF0845C3)),
                          ),
                          TextSpan(text: " de l’application."),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
