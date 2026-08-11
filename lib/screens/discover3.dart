import 'package:flutter/material.dart';

class Discover3 extends StatefulWidget {
  const Discover3({super.key});

  @override
  State<Discover3> createState() => _Discover3State();
}

class _Discover3State extends State<Discover3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/LinkUp_typographic_logo.png',
              width: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.contain,
            ),

            Text(
              "Développez votre réseau",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
                wordSpacing: -1,
                fontFamily: "regular",
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "Conservez tous vos contacts professionnels au même endroit, organisez-les et gardez le fil de vos opportunités.",
                    style: TextStyle(
                      color: Color(0XFF64748B),
                      fontFamily: "regular",
                    ),

                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 150),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0XFFCBD5E1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0XFFCBD5E1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0XFF2563EB),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF0843C4),

                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 125,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      print("Bouton cliqué");
                    },
                    child: Text(
                      "Suivant",
                      style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontFamily: "regular",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
