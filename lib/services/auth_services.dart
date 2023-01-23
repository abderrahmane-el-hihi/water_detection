//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in
  SignInWithG() async {
    //page to click your email
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
    //get authentificaton details from request
    final GoogleSignInAuthentication gauth = await guser!.authentication;
    //create new credential for user
    final Credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    //use the new credential to sign in
    return await FirebaseAuth.instance.signInWithCredential(Credential);
  }
}
/*class AuthService {
  SignInWithG() async {}
}*/
