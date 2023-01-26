/*import 'package:local_auth/local_auth.dart';

class FingerprintAuth {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      final bool authenticated = await _localAuth.authenticateWithBiometrics(
        localizedReason: 'Please authenticate to access your account.',
      );
      if (authenticated) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      // Handle errors (e.g. no fingerprint sensor available)
      return false;
    }
  }
}*/
