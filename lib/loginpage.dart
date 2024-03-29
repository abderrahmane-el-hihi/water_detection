import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/components/g_f_button.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';
import 'package:waterdetection/services/auth_services.dart';
import 'package:waterdetection/settingspage.dart';

class LoginPage extends StatefulWidget {
  final Function()? ontap;
  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailcontroller = TextEditingController();

  final passwcontroller = TextEditingController();
  bool _isPressed = false;

  //signin user method
  void SignIn() async {
    setState(() {
      _isPressed = !_isPressed;
    });
    //show loading screen
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwcontroller.text);
      //kill loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //kill loading circle
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //email incorrect
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Incorrect E-mail',
                style: TextStyle(fontFamily: "Poppins"),
              ),
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        //password incorrect
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Incorrect Password',
                style: TextStyle(fontFamily: "Poppins"),
              ),
            );
          },
        );
      }
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  //dont have account ontap function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),

                    Text(
                      '${AppLocale.words[18].getString(context)}',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 50),

                    //email textfield
                    Text_Field(
                      controller: emailcontroller,
                      hinText: 'E-mail Address',
                      obsecureText: false,
                      preicon: Icons.email_rounded,
                    ),

                    SizedBox(height: 10),
                    //password textfield
                    Text_Field(
                      controller: passwcontroller,
                      hinText: 'Password',
                      obsecureText: true,
                      preicon: Icons.lock,
                    ),
                    SizedBox(height: 10),
                    //signin buton
                    L_Button(
                      onTap: SignIn,
                      text: '${AppLocale.words[18].getString(context)}',
                    ),

                    SizedBox(height: 25),
                    //dont have account
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        '${AppLocale.words[21].getString(context)}',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 78, 131, 10),
                            fontFamily: "Poppins"),
                      ),
                    ),
                    SizedBox(height: 25),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                                color: Color.fromRGBO(179, 179, 179, 1),
                                thickness: 1),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  color: Color.fromRGBO(179, 179, 179, 1),
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                                color: Color.fromRGBO(179, 179, 179, 1),
                                thickness: 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    //google and facebook buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //google
                        G_F_Button(
                          text: '',
                          onTap: (() => AuthService().SignInWithG()),
                          svgpath: 'assets/social_svg/google.svg',
                          h: 100,
                          w: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
