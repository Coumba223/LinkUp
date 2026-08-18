import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkupapp/functions/auth.dart';
import 'package:linkupapp/models/contact.dart';
import 'package:linkupapp/screens/contactcard.dart';
import 'package:linkupapp/screens/nouveaucontact.dart';
import 'package:linkupapp/screens/testqr.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class ScanContact extends StatefulWidget {
  const ScanContact({super.key});

  @override
  State<ScanContact> createState() => _ScanContactState();
}

class _ScanContactState extends State<ScanContact> {
  Contact? contact;

  void _handleBarcode(BarcodeCapture barcodes) {
    if (barcodes.barcodes.isEmpty) {
      return;
    }

    final String? rawValue = barcodes.barcodes.first.rawValue;

    if (rawValue == null) {
      return;
    }

    try {
      Map<String, dynamic> data = jsonDecode(rawValue);

      Contact nouveauContact = Contact.fromJson(data);

      setState(() {
        contact = nouveauContact;
      });
    } catch (e) {
      print("QR Code invalide : $e");
    }
  }

  Future<void> _ajouterContact() async {
    if (contact == null) {
      return;
    }

    bool resultat = await addNewContact(contact!);

    if (!mounted) {
      return;
    }

    if (resultat) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Contact ajouté avec succès !"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ce contact existe déjà !"),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF6FE),

      appBar: AppBar(
        backgroundColor: const Color(0XFFEEF6FE),
        title: const Text("Scanner un contact"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: contact == null
              ? Center(child: ScannerWidget(onDetect: _handleBarcode))
              : ContactCard(
                  contact: contact!,

                  // Bouton Nouveau scan
                  onNewScan: () {
                    setState(() {
                      contact = null;
                    });
                  },

                  // Bouton Ajouter au contact
                  onAddContact: _ajouterContact,
                ),
        ),
      ),
    );
  }
}
