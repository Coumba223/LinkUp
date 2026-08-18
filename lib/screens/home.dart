import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/user.dart';
import 'package:linkupapp/screens/connexion.dart';
import 'package:linkupapp/screens/nouveaucontact.dart';
import 'package:linkupapp/screens/profil.dart';
import 'package:linkupapp/screens/scancontact.dart';
import 'package:linkupapp/screens/mescontacts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user;

  // Couleurs
  static const Color backgroundColor = Color(0xFFEEF6FE);
  static const Color primaryColor = Color(0xFF0541C0);
  static const Color darkText = Color(0xFF1F2937);
  static const Color greyText = Color(0xFF6B7280);

  @override
  void initState() {
    super.initState();
    chargerUtilisateur();
  }

  Future<void> chargerUtilisateur() async {
    User? resultat = await getCurrentUser();

    if (!mounted) return;

    setState(() {
      user = resultat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,

        automaticallyImplyLeading: false,

        titleSpacing: 20,

        title: Image.asset(
          "assets/images/LinkUp_typographic_logo.png",
          height: 35,
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profil()),
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFE3EDFF),
                child: Icon(Icons.person_outline, color: primaryColor),
              ),
            ),
          ),
        ],
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =================================================
            // BIENVENUE
            // =================================================
            Text(
              "Bienvenue à bord ",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
              
            ),

            const SizedBox(height: 6),

            Text(
              user != null
                  ? "Ravi de vous revoir, ${user!.prenom ?? ''}"
                  : "Gérez facilement vos contacts",
              style: const TextStyle(fontSize: 14, color: greyText),
            ),

            const SizedBox(height: 25),

            // =================================================
            // PROFIL + NOUVEAU CONTACT
            // =================================================
            Row(
              children: [
                Expanded(
                  child: _mainCard(
                    icon: Icons.person_outline,
                    title: "Mon profil",
                    description: "Consulter mes informations",
                    color: Colors.white,
                    iconColor: primaryColor,
                    textColor: darkText,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profil()),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _mainCard(
                    icon: Icons.person_add_alt_1_outlined,
                    title: "Nouveau contact",
                    description: "Ajouter un contact",
                    color: primaryColor,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NouveauContact(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // =================================================
            // MES CONTACTS
            // =================================================
            const Text(
              "Gérer vos contacts",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),

            const SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MesContacts()),
                );
              },

              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,

                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF2FF),
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: const Icon(
                        Icons.people_outline,
                        color: primaryColor,
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mes contacts",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: darkText,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Voir tous mes contacts",
                            style: TextStyle(fontSize: 12, color: greyText),
                          ),
                        ],
                      ),
                    ),

                    const Icon(Icons.chevron_right, color: greyText),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // =================================================
            // ACTIONS RAPIDES
            // =================================================
            const Text(
              "Actions rapides",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                // ============================
                // MA CARTE
                // ============================
                Expanded(
                  child: _quickAction(
                    image: 'assets/icons/scan-qr-code.png',
                    title: "Ma carte",
                    description: "Afficher mon QR Code",
                    onTap: () {
                      afficherQRCode();
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // ============================
                // AJOUTER
                // ============================
                Expanded(
                  child: _quickAction(
                    image: 'assets/icons/plus-circle.png',
                    title: "Ajouter",
                    description: "Scanner un QR Code",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScanContact()),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // ============================
                // QUITTER
                // ============================
                Expanded(
                  child: _quickAction(
                    image: 'assets/icons/Power.png',
                    title: "Quitter",
                    description: "Fermer ma session",
                    onTap: () {
                      afficherConfirmationDeconnexion();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // CARD PRINCIPALE
  // =========================================================

  Widget _mainCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Color iconColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 185,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,

              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(icon, color: iconColor),
            ),

            const Spacer(),

            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description,
              style: TextStyle(
                fontSize: 11,
                color: textColor.withOpacity(0.65),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // ACTION RAPIDE
  // =========================================================

  Widget _quickAction({
    required String image,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 140,

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 42, height: 42),

            const SizedBox(height: 14),

            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 9, color: greyText),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // QR CODE
  // =========================================================

  void afficherQRCode() {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text(
            "Ma carte numérique",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              QrImageView(data: jsonEncode(user?.toJson()), size: 200),

              const SizedBox(height: 15),

              const Text(
                "Scannez ce QR Code pour partager vos informations.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: greyText),
              ),

              const SizedBox(height: 15),

              Image.asset(
                "assets/images/LinkUp_typographic_logo.png",
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }

  // =========================================================
  // DÉCONNEXION
  // =========================================================

  void afficherConfirmationDeconnexion() {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text(
            "Quitter la session",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: const Text("Voulez-vous vraiment quitter votre session ?"),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Annuler", style: TextStyle(color: greyText)),
            ),

            ElevatedButton(
              onPressed: () async {
                await logout();

                if (!context.mounted) return;

                Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(builder: (context) => const Connexion()),

                  (route) => false,
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              child: const Text("Quitter"),
            ),
          ],
        );
      },
    );
  }
}
