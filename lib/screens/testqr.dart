import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerWidget extends StatelessWidget {
  final Function(BarcodeCapture) onDetect;

  const ScannerWidget({
    super.key,
    required this.onDetect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF0A5BC4),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MobileScanner(
          onDetect: onDetect,
        ),
      ),
    );
  }
}