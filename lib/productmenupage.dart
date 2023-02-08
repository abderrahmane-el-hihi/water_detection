import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/serianumpage.dart';

class ProductMenuPage extends StatefulWidget {
  ProductMenuPage({super.key});

  @override
  State<ProductMenuPage> createState() => _ProductMenuPageState();
}

class _ProductMenuPageState extends State<ProductMenuPage> {
  void Back() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => SerialPage())));
  }

  void ToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*
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
                       */

                      Container(
                        child: ListTile(
                            title: Text(
                              'Products',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 78, 131, 10),
                              ),
                            ),
                            leading: IconButton(
                              onPressed: Back,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Color.fromRGBO(0, 78, 131, 10),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                            color: Color.fromRGBO(0, 78, 131, 10),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                            onTap: ToHome,
                            title: Text(
                              'ceterne ',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 78, 131, 10),
                              ),
                            ),
                            leading: Icon(
                              Icons.abc,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                            color: Color.fromRGBO(0, 78, 131, 10),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                            onTap: ToHome,
                            title: Text(
                              'ceterne ',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 78, 131, 10),
                              ),
                            ),
                            leading: Icon(
                              Icons.abc,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                            color: Color.fromRGBO(0, 78, 131, 10),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                            onTap: ToHome,
                            title: Text(
                              'ceterne ',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 78, 131, 10),
                              ),
                            ),
                            leading: Icon(
                              Icons.abc,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
