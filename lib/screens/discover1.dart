import 'package:flutter/material.dart';

class Discover1 extends StatefulWidget {
  const Discover1({super.key});

  @override
  State<Discover1> createState() => _Discover1State();
}

class _Discover1State extends State<Discover1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            SizedBox(height: 125),
            Image.asset(
              'assets/images/Digital_business_card.png',
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              "Créez votre identité pro",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
                wordSpacing: -1,
                fontFamily: "regular",
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "Personnalisez votre carte numérique premium en quelques secondes. Modifiez vos informations, thèmes et réseaux sociaux en temps réel.",
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
                        width: 20,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0XFF2563EB),
                          borderRadius: BorderRadius.circular(15),
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
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0XFFCBD5E1),
                          shape: BoxShape.circle,
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
