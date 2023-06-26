import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/components/g_f_button.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterdetection/Firebasedb_config/firebase_db.dart';
import 'package:waterdetection/settingspage.dart';
import 'services/auth_services.dart';

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

  late Map<String, dynamic> data = {
    'email': emailcontroller.text,
    'password': passwcontroller.text,
    'username': namecontroller.text,
    'id_compt': i,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Text(
                      '${AppLocale.words[17].getString(context)}',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 50),
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
                          text: '',
                          onTap: (() => AuthService().SignInWithG()),
                          svgpath: 'assets/social_svg/google.svg',
                          h: 100,
                          w: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    //alredy have account
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        '${AppLocale.words[21].getString(context)}',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 78, 131, 10),
                            fontFamily: 'Poppins'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
