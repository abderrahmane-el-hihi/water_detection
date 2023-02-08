import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/productmenupage.dart';

import 'components/text_field.dart';

class SerialPage extends StatefulWidget {
  SerialPage({super.key});

  @override
  State<SerialPage> createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> {
  //serial number controller
  final serialcontroller = TextEditingController();
  bool _isPressed = false;
  //submit method
  void Submit() {
    setState(() {
      _isPressed = !_isPressed;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductMenuPage()),
    );
  }

  //////////////////////// ========== the page should be dynamic bsed on firestore db  ========== \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
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
                    /*Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(100, 100)),
                        )),*/
                    Icon(
                      Icons.account_circle,
                      size: 128,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('User Name'),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextField(
                        controller: serialcontroller,
                        obscureText: false,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.qr_code_scanner_rounded),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(179, 179, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                          hintText: 'Serial Number',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(179, 179, 179, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    L_Button(
                      onTap: Submit,
                      text: 'Submit',
                    )
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


/*
 * final Firestore firestore = Firestore.instance;
  final CollectionReference optionsRef = firestore.collection("options");

  // Get all options from the "options" collection
  Stream<QuerySnapshot> stream = optionsRef.snapshots();



  StreamBuilder<QuerySnapshot>(
  stream: stream,
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<DocumentSnapshot> options = snapshot.data.documents;
      if (options.length == 1) {
        return SingleOptionPage(options[0]);
      } else {
        return MultipleOptionPage(options);
      }
    } else if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    } else {
      return CircularProgressIndicator();
    }
  },
)


class SingleOptionPage extends StatelessWidget {
  final DocumentSnapshot option;
  SingleOptionPage(this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ... display a single option
    );
  }
}

class MultipleOptionPage extends StatelessWidget {
  final List<DocumentSnapshot> options;
  MultipleOptionPage(this.options);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(options[index]['name']),
          // ... other properties
        );
      },
    );
  }
}


 */