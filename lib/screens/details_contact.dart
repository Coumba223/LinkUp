import 'package:flutter/material.dart';
import 'package:linkupapp/models/contact.dart';

class DetailContact extends StatelessWidget {
  final Contact contact;

  const DetailContact({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),

      appBar: AppBar(
        backgroundColor: const Color(0XFFEEF6FE),
        elevation: 0,
        title: const Text(
          "Détails du contact",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // =========================
            // CARTE PRINCIPALE
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                children: [
                  // PHOTO
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0XFFE3EDFF),
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Color(0XFF0845C3),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // NOM
                  Text(
                    "${contact.prenom ?? ''} ${contact.nom ?? ''}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF111827),
                    ),
                  ),

                  const SizedBox(height: 5),

                  // EMAIL
                  Text(
                    contact.email ?? "Aucun email",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0XFF6B7280),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // INFORMATIONS
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informations",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF111827),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PROFESSION
                  _information(
                    icon: Icons.badge_outlined,
                    title: "Profession",
                    value: contact.profession,
                  ),

                  const SizedBox(height: 15),

                  // TELEPHONE
                  _information(
                    icon: Icons.phone_outlined,
                    title: "Téléphone",
                    value: contact.telephone,
                  ),

                  const SizedBox(height: 15),

                  // EMAIL
                  _information(
                    icon: Icons.email_outlined,
                    title: "Email",
                    value: contact.email,
                  ),

                  const SizedBox(height: 15),

                  // SITE WEB
                  _information(
                    icon: Icons.language_outlined,
                    title: "Site web",
                    value: contact.siteWeb,
                  ),

                  const SizedBox(height: 15),

                  // LINKEDIN
                  _information(
                    icon: Icons.work_outline,
                    title: "LinkedIn",
                    value: contact.linkedin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _information({
    required IconData icon,
    required String title,
    required String? value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: const Color(0XFFEAF2FF),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(icon, color: const Color(0XFF0845C3)),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 13, color: Color(0XFF9CA3AF)),
              ),

              const SizedBox(height: 3),

              Text(
                value?.isNotEmpty == true ? value! : "Non renseigné",

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF1F2937),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
