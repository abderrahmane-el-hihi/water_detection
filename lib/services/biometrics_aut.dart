import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:local_auth/local_auth.dart';

// class FingerprintAuth {
//   final LocalAuthentication localAuth = LocalAuthentication();

//   Future<bool> HasBiometrics() async {
//     try {
//       return await localAuth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }

//   Future<bool> authenticate() async {
//     final biometric_avilable = await HasBiometrics();
//     if (!biometric_avilable) return false;

//     try {
//       final bool authenticated = await localAuth.authenticate(
//           localizedReason:
//               'Please scan your fingerprint to access your account.');
//       useErrorDialogs:
//       true;
//       stickyAuth:
//       true;
//       //final bool authenticated = false;

//       if (authenticated) {
//         return true;
//       } else {
//         return false;
//       }
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// class FingerprintSwitch extends StatefulWidget {
//   const FingerprintSwitch({Key? key}) : super(key: key);

//   @override
//   _FingerprintSwitchState createState() => _FingerprintSwitchState();
// }

// class _FingerprintSwitchState extends State<FingerprintSwitch> {
//   final LocalAuthentication _localAuthentication = LocalAuthentication();
//   bool _isFingerprintEnabled = false;

//   Future<void> _authenticate() async {
//     final bool isAuthenticated = await _localAuthentication.authenticate(
//       localizedReason: 'Authenticate with your fingerprint',
//     );

//     if (isAuthenticated) {
//       setState(() {
//         _isFingerprintEnabled = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: const Text('Enable Fingerprint Authentication'),
//       value: _isFingerprintEnabled,
//       onChanged: (bool value) {
//         setState(() {
//           _isFingerprintEnabled = value;
//         });

//         if (_isFingerprintEnabled) {
//           _authenticate();
//         }
//       },
//     );
//   }
// }
