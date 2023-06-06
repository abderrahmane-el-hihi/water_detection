import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import '../productmenupage.dart';

class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  bool isScanning = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner le code QR'),
        backgroundColor: Color.fromRGBO(0, 78, 131, 10),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    StreamSubscription<Barcode>? scanSubscription;

    scanSubscription = controller.scannedDataStream.listen((scanData) {
      if (scanData.code!.isNotEmpty) {
        _processQRCodeData(scanData.code as String);
        controller.stopCamera();
        scanSubscription?.cancel();
      }
    });

    controller.resumeCamera();
  }

  void _processQRCodeData(String qrCodeData) {
    print('Scanned QR Code: $qrCodeData');
    DocumentReference? userRef = FirebaseAuth.instance.currentUser?.uid != null
        ? FirebaseFirestore.instance
            .collection('compt')
            .doc(FirebaseAuth.instance.currentUser!.uid)
        : null;
    // Create a new product document and set the user reference field
    if (userRef != null) {
      FirebaseFirestore.instance.collection('detector').add({
        'ref': '$qrCodeData',
        'userRef': userRef,
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductMenuPage()),
    );
  }
}
