import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/components/g_f_button.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterdetection/mongodb_config/firebase_db.dart';

import 'package:waterdetection/settingspage.dart';

class SignUpPage extends StatefulWidget {
  final Function()? ontap;
  SignUpPage({super.key, required this.ontap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers
  final emailcontroller = TextEditingController();
  final passwcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  int i = 0;

  void SignUp() async {
    setState(() {
      _isPressed = !_isPressed;
    });
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text, password: passwcontroller.text);

    Firebase_db().Write_Data("compt", data);
    i++;
  }

  bool _isPressed = false;

  void SignIn() {}

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  late Map<String, dynamic> data = {
    'email': emailcontroller.text,
    'password': passwcontroller.text,
    'username': namecontroller.text,
    'id_compt': i,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),

                  Text(
                    '${AppLocale.words[17].getString(context)}',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 75),
                  //name textfield
                  Text_Field(
                    controller: namecontroller,
                    hinText: 'Name',
                    obsecureText: false,
                    preicon: Icons.person,
                  ),
                  SizedBox(height: 10),
                  //last name textfield
                  Text_Field(
                    controller: lnamecontroller,
                    hinText: 'Last Name',
                    obsecureText: false,
                    preicon: Icons.person,
                  ),
                  SizedBox(height: 10),
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
                  //sign up buton
                  L_Button(
                    onTap: SignUp,
                    text: '${AppLocale.words[17].getString(context)}',
                  ),

                  //SizedBox(height: 25),

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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                color: Color.fromRGBO(179, 179, 179, 1)),
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
                        text: 'Google',
                        onTap: SignIn,
                        //text: 'Google',
                        svgpath: 'assets/social_svg/google_svg.svg',
                        h: 40,
                        w: 40,
                      ),

                      //facebook
                      // G_F_Button(
                      //   onTap: () async {
                      //     //await signInWithFacebook();
                      //   },
                      //   //text: 'Facebook',
                      //   svgpath: 'assets/social_svg/facebook-svgrepo-com.svg',
                      //   h: 50,
                      //   w: 50,
                      // ),
                    ],
                  ),
                  SizedBox(height: 25),
                  //alredy have account
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text(
                      'already have account',
                      style: TextStyle(color: Color.fromRGBO(0, 78, 131, 10)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
