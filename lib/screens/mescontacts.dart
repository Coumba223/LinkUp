import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/contact.dart';
import 'package:linkupapp/screens/details_contact.dart';

class MesContacts extends StatefulWidget {
  const MesContacts({super.key});

  @override
  State<MesContacts> createState() => _MesContactsState();
}

class _MesContactsState extends State<MesContacts> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltres = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chargerContacts();
  }

  // Charger les contacts
  Future<void> chargerContacts() async {
    List<Contact> resultat = await getContacts();

    setState(() {
      contacts = resultat;
      contactsFiltres = resultat;
    });
  }

  // Rechercher un contact
  void rechercherContact(String recherche) {
    setState(() {
      contactsFiltres = contacts.where((contact) {
        String nom = "${contact.prenom ?? ''} ${contact.nom ?? ''}"
            .toLowerCase();

        return nom.contains(recherche.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: const Color(0XFFEEF6FE),
        elevation: 0,

        title: const Text(
          "Mes Contacts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          // =========================
          // BARRE DE RECHERCHE
          // =========================
          Padding(
            padding: const EdgeInsets.all(20),

            child: TextField(
              controller: _searchController,
              onChanged: rechercherContact,

              decoration: InputDecoration(
                hintText: "Rechercher un contact...",

                prefixIcon: const Icon(Icons.search, color: Color(0XFF0845C3)),

                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),

                        onPressed: () {
                          _searchController.clear();
                          rechercherContact("");
                        },
                      )
                    : null,

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // =========================
          // LISTE DES CONTACTS
          // =========================
          Expanded(
            child: contactsFiltres.isEmpty
                ? const Center(
                    child: Text(
                      "Aucun contact trouvé",
                      style: TextStyle(color: Color(0XFF374151)),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    itemCount: contactsFiltres.length,

                    itemBuilder: (context, index) {
                      Contact contact = contactsFiltres[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: ListTile(
                          // =========================
                          // QUAND ON APPUIE
                          // =========================
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailContact(contact: contact),
                              ),
                            );
                          },

                          // =========================
                          // PHOTO
                          // =========================
                          leading: const CircleAvatar(
                            backgroundColor: Color(0XFFE3EDFF),

                            child: Icon(Icons.person, color: Color(0XFF0845C3)),
                          ),

                          // =========================
                          // NOM
                          // =========================
                          title: Text(
                            "${contact.prenom ?? ''} "
                            "${contact.nom ?? ''}",

                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),

                          // =========================
                          // EMAIL
                          // =========================
                          subtitle: Text(contact.email ?? ""),

                          // =========================
                          // FLÈCHE
                          // =========================
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Color(0XFF6B7280),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
