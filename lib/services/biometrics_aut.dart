import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> HasBiometrics() async {
    try {
      return await localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final biometric_avilable = await HasBiometrics();
    if (!biometric_avilable) return false;

    try {
      final bool authenticated = await localAuth.authenticate(
          localizedReason:
              'Please scan your fingerprint to access your account.');
      useErrorDialogs:
      true;
      stickyAuth:
      true;

      if (authenticated) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      return false;
    }
  }
}
