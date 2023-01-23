import 'package:flutter/material.dart';
import 'package:waterdetection/components/g_f_button.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';
import 'package:waterdetection/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  //text editing controllers
  final emailcontroller = TextEditingController();
  final passwcontroller = TextEditingController();
  //signin user method
  void SignUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text, password: passwcontroller.text);
  }

  void SignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),

                Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(height: 75),
                //name textfield
                Text_Field(
                    controller: emailcontroller,
                    hinText: 'Name',
                    obsecureText: false),
                SizedBox(height: 10),
                //last name textfield
                Text_Field(
                    controller: emailcontroller,
                    hinText: 'Last Name',
                    obsecureText: false),
                SizedBox(height: 10),
                //email textfield
                Text_Field(
                    controller: emailcontroller,
                    hinText: 'E-mail Address',
                    obsecureText: false),

                SizedBox(height: 10),
                //password textfield
                Text_Field(
                    controller: passwcontroller,
                    hinText: 'Password',
                    obsecureText: true),
                SizedBox(height: 10),
                //signin buton
                L_Button(onTap: SignUp, text: 'Sign Up'),

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
                      onTap: SignIn,
                      text: 'Google',
                      //imgpath: 'lib/images/google.png'
                    ),

                    //Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0)),

                    //facebook
                    G_F_Button(
                      onTap: SignIn,
                      text: 'Facebook',
                      //imgpath: 'lib/images/facebook.png'
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
