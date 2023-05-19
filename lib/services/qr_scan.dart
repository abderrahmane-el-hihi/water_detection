import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';

class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

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
    controller.scannedDataStream.listen((scanData) {
      // Process the scanned QR code data
      _processQRCodeData(scanData.code as String);
    });
  }

  void _processQRCodeData(String qrCodeData) {
    final productsCollection =
        FirebaseFirestore.instance.collection('products');

    final userId = FirebaseAuth.instance.currentUser?.uid;

    productsCollection.doc(qrCodeData).update({'userId': userId}).then((_) {
      print('User connected with the product.');
    }).catchError((error) {
      print('Failed to connect user with the product: $error');
    });
  }
}
