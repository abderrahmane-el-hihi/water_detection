import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/homepage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  //signout method
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      //button pour retourner au home page
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }),
                      icon: Icon(Icons.arrow_back_rounded)),
                  Text('Settings'),
                ],
              ),
              Container(
                //padding: EdgeInsets.only(right: 150),
                height: 70,
                width: 290,
                //color: Colors.black,

                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 3, color: Color.fromRGBO(121, 158, 255, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 32,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('User Name')),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Divider(color: Color.fromRGBO(179, 179, 179, 1), thickness: 1),
              SizedBox(
                height: 75,
              ),
              Divider(color: Color.fromRGBO(179, 179, 179, 1), thickness: 1),
              SizedBox(
                height: 75,
              ),
              Divider(color: Color.fromRGBO(179, 179, 179, 1), thickness: 1),
              SizedBox(
                height: 75,
              ),
              Divider(color: Color.fromRGBO(179, 179, 179, 1), thickness: 1),
              SizedBox(
                height: 75,
              ),
              Divider(color: Color.fromRGBO(179, 179, 179, 1), thickness: 1),
              SizedBox(
                height: 50,
              ),
              GestureDetector(onTap: SignOut, child: Text('Sign Out')),
            ],
          ),
        ),
      ),
    );
  }
}
