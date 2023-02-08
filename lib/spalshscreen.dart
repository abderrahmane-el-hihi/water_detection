import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waterdetection/infopage.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int val = 0;
  void Open() {
    for (var i = 0; i < 5; i++) {
      setState(() {
        val++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'water detection',
                style: TextStyle(
                  color: Color.fromRGBO(0, 111, 186, 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*SpinKitPulse(
                color: Colors.blue,
                size: 50.0,
                duration: Duration(milliseconds: 800),
              ),*/

              /*
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (((context) => InfoPage()))));
                      }),
                      child: Container(
                        color: Colors.amber,
                        padding: EdgeInsets.all(50),
                        child: Text('Hello'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: val < 1
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 0, 112, 186),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: val < 2
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 0, 112, 186),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: val < 3
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 0, 112, 186),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: val < 4
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 0, 112, 186),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: val < 5
                                ? Colors.grey[300]
                                : Color.fromARGB(255, 0, 112, 186),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                 */

              //Image.asset('assets/codrops.png'),
            ],
          ),
        ),
      ),
    );
  }
}
