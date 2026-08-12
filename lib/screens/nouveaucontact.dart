import 'package:flutter/material.dart';

class NouveauContact extends StatefulWidget {
  const NouveauContact({super.key});

  @override
  State<NouveauContact> createState() => _NouveauContactState();
}

class _NouveauContactState extends State<NouveauContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      appBar: AppBar(
        backgroundColor: Color(0XFFEEF6FE),
        title: Text("Nouveau Contact"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 45),
                        SizedBox(height: 5),
                        Text("Karim DUMONT"),
                        Text(
                          "karim.dumont@example.com",
                          style: TextStyle(fontSize: 10),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.mail_sharp),
                          title: Text(
                            "ADRESSE E-MAIL",
                            style: TextStyle(
                              color: Color(0XFF64748B),
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text("sophie.martin@studio.com"),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(
                            "TELEPHONE",
                            style: TextStyle(
                              color: Color(0XFF64748B),
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text("+33 6 98 76 54 32"),
                        ),
                        ListTile(
                          leading: Icon(Icons.web),
                          title: Text(
                            "SITE WEB",
                            style: TextStyle(
                              color: Color(0XFF64748B),
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text("www.studiocreatif.design"),
                        ),
                        ListTile(
                          leading: Icon(Icons.dataset_linked_outlined),
                          title: Text(
                            "LINKEDIN",
                            style: TextStyle(
                              color: Color(0XFF64748B),
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text("linkedin.com/in/sophieux"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0XFF0845C3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Ajouter au contact",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Nouveau scan",
                      style: TextStyle(color: Color(0XFF123B7C), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
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
