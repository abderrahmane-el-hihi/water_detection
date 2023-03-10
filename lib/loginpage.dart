import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/components/g_f_button.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';
import 'package:waterdetection/services/auth_services.dart';

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
    //setstate method
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
              title: Text('Incorrect E-mail'),
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        //password incorrect
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Incorrect Password'),
            );
          },
        );
      }
    }
  }

  //dont have account ontap function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SizedBox(height: 50),
                  //Icon(Icons.lock,size: 100,),
                  SizedBox(height: 50),

                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
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
                  //signin buuton
                  L_Button(
                    onTap: SignIn,
                    text: 'Sign In',
                  ),

                  SizedBox(height: 25),
                  //dont have account
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text(
                      'dont have account',
                      style: TextStyle(color: Color.fromRGBO(0, 78, 131, 10)),
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
                        onTap: (() => AuthService().SignInWithG()),
                        //text: 'Google',
                        svgpath: 'assets/social_svg/google_svg.svg',
                      ),

                      //Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0)),

                      //facebook
                      G_F_Button(
                        onTap: SignIn,
                        //text: 'Facebook',
                        svgpath: 'assets/social_svg/facebook-svgrepo-com.svg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
