import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
        title: Text("Mon Profil"),
        backgroundColor: Color(0XFFF5F5F5),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                CircleAvatar(radius: 65),
                SizedBox(height: 10),
                Text(
                  "Karim DUMONT",
                  style: TextStyle(color: Color(0XFF123B7C)),
                ),
                Text(
                  "karim.dumont@example.com",
                  style: TextStyle(color: Color(0XFF125ACC)),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: Text("Information personnelles"),
                        subtitle: Text("Modifier le mot de passe"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.key),
                        title: Text("Modifier le mot de passe"),
                        subtitle: Text("Changer votre mot de passe ici"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.security),
                        title: Text("Abonnement actif"),
                        subtitle: Text(
                          "Decouvrez les avantages de votre abonnement actuel",
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Configurations"),
                        subtitle: Text("Ajustez selon vos preferences"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.warning),
                        title: Text("Termes et conditions d'utulisation"),
                        subtitle: Text("Reinitialisez votre mot de passe"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.accessibility),
                        title: Text("Assistance clientele"),
                        subtitle: Text("Reinitialisez votre mot de passe ici"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
