import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
