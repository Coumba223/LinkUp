import 'package:flutter/material.dart';

class MonReseau extends StatefulWidget {
  const MonReseau({super.key});

  @override
  State<MonReseau> createState() => _MonReseauState();
}

class _MonReseauState extends State<MonReseau> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEF6FE),
      appBar: AppBar(
        backgroundColor: Color(0XFFEEF6FE),
        title: Text("Mon Reseau"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                  key: _keyForm,

                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Rechercher un contact...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Sophie Martin"),
                  subtitle: Text(
                    "Designer UX studio Creatif",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Thomas Bernard"),
                  subtitle: Text(
                    "Tech Lead Nexus Digital",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Lucie Petit"),
                  subtitle: Text(
                    "Product Manager Fintech Corp",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Antoine Richard"),
                  subtitle: Text(
                    "CO-fondateur innovate",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Marie Durand"),
                  subtitle: Text(
                    "DA Studio Creatif",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Jean Dupuis"),
                  subtitle: Text(
                    "Analyste Finance Group",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text("Clara Simon"),
                  subtitle: Text(
                    "RH. Nexus Digital",
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Icon(Icons.star_border),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
