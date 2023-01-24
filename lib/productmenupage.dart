import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/homepage.dart';

class ProductMenuPage extends StatelessWidget {
  ProductMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: 290,
                        height: 60,
                        //padding: EdgeInsets.all(18),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                        child: Text(
                          'ceterne 1',
                          style: TextStyle(
                            color: Color.fromRGBO(179, 179, 179, 1),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: 290,
                        height: 58,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                        child: Text(
                          'ceterne 2',
                          style: TextStyle(
                            color: Color.fromRGBO(179, 179, 179, 1),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: 290,
                        height: 58,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                        child: Text(
                          'ceterne 3',
                          style: TextStyle(
                            color: Color.fromRGBO(179, 179, 179, 1),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: 290,
                        height: 58,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                        child: Text(
                          'ceterne 4',
                          style: TextStyle(
                            color: Color.fromRGBO(179, 179, 179, 1),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
