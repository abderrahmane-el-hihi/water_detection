import 'package:flutter/material.dart';

import '../productmenupage.dart';

class L_Button extends StatefulWidget {
  final Function() onTap;

  final String text;
  const L_Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<L_Button> createState() => _L_ButtonState();
}

class _L_ButtonState extends State<L_Button> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        //width: 290,
        //height: 58,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 78, 131, 10),
          border: Border.all(color: Color.fromRGBO(0, 78, 131, 10), width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            _isPressed ? widget.text : widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
