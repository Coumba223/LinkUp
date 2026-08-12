import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/LinkUp_typographic_logo.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(width: 130),
                    Image.asset(
                      'assets/icons/Power.png',
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 20),
                  ],
                ),
                Text("Bienvenue a bord"),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 185,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0XFFFFFFFF),
                      ),

                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Icon(Icons.inventory_2_outlined),
                            SizedBox(height: 100),

                            Text("Mon Profil", style: TextStyle(fontSize: 10)),
                            Text(
                              "Lorem Ipsum Dolor Sit Amet",
                              style: TextStyle(fontSize: 7),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 185,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0XFF0541C0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.description_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(height: 110),
                            Text(
                              "Nouveau contact",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Lorem Ipsum Dolor Sit Amet",
                              style: TextStyle(
                                fontSize: 7,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Gerer vos contacts",
                  style: TextStyle(color: Color(0XFF374151)),
                ),
                SizedBox(height: 10),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/users.png',
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mes Contacts",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF002573),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Lorem Ipsum Dolor Sit Amet, sonsecteur",
                              style: TextStyle(
                                fontSize: 7,
                                color: Color(0XFF374151),
                              ),
                            ),
                            Text(
                              "adipscing elit. Nunc sit amet",
                              style: TextStyle(
                                fontSize: 7,
                                color: Color(0XFF374151),
                              ),
                            ),
                            Text(
                              "dolorSit amet dolor",
                              style: TextStyle(
                                fontSize: 7,
                                color: Color(0XFF374151),
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        SizedBox(width: 90),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Actions Rapides",
                  style: TextStyle(color: Color(0XFF374151)),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 140,
                      width: 103,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/scan-qr-code.png',
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            SizedBox(height: 20),
                            Text("Ma carte"),
                            SizedBox(height: 5),
                            Text(
                              "Afficher mon Qr Code",
                              style: TextStyle(
                                fontSize: 5,
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 140,
                      width: 103,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/plus-circle.png',
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            SizedBox(height: 20),
                            Text("Ajouter"),
                            SizedBox(height: 5),
                            Text(
                              "Scanner mon Qr Code",
                              style: TextStyle(
                                fontSize: 5,
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 140,
                      width: 103,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Power.png',
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            SizedBox(height: 20),
                            Text("Quitter"),
                            SizedBox(height: 5),
                            Text(
                              "Fermer ma session",
                              style: TextStyle(
                                fontSize: 5,
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
