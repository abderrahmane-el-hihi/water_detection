import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/productmenupage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isPressed = false;

  void Ontap() {
    setState(() {
      _isPressed = !_isPressed;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductMenuPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: Ontap,
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.white : Colors.blue,
              border: Border.all(
                  color: _isPressed ? Colors.blue : Colors.transparent,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Center(
              child: Text(_isPressed ? "Released" : "Pressed",
                  style: TextStyle(
                      color: _isPressed ? Colors.blue : Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
