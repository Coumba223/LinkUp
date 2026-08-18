import 'package:flutter/material.dart';
import 'package:linkupapp/models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onNewScan;
  final VoidCallback onAddContact;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onNewScan,
    required this.onAddContact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                const CircleAvatar(
                  radius: 45,
                ),

                const SizedBox(height: 5),

                Text(
                  "${contact.prenom} ${contact.nom}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  contact.email ?? "",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.mail_sharp),
                  title: const Text(
                    "ADRESSE E-MAIL",
                    style: TextStyle(
                      color: Color(0XFF64748B),
                      fontSize: 10,
                    ),
                  ),
                  subtitle: Text(contact.email ?? ""),
                ),

                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text(
                    "TELEPHONE",
                    style: TextStyle(
                      color: Color(0XFF64748B),
                      fontSize: 10,
                    ),
                  ),
                  subtitle: Text(contact.telephone ?? ""),
                ),

                ListTile(
                  leading: const Icon(Icons.web),
                  title: const Text(
                    "SITE WEB",
                    style: TextStyle(
                      color: Color(0XFF64748B),
                      fontSize: 10,
                    ),
                  ),
                  subtitle: Text(contact.siteWeb ?? ""),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.dataset_linked_outlined,
                  ),
                  title: const Text(
                    "LINKEDIN",
                    style: TextStyle(
                      color: Color(0XFF64748B),
                      fontSize: 10,
                    ),
                  ),
                  subtitle: Text(contact.linkedin ?? ""),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 15),

        // AJOUTER AU CONTACT
        GestureDetector(
          onTap: onAddContact,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // NOUVEAU SCAN
        GestureDetector(
          onTap: onNewScan,
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Center(
              child: Text(
                "Nouveau scan",
                style: TextStyle(
                  color: Color(0XFF123B7C),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}