import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  final controller;
  final String hinText;
  final bool obsecureText;
  final preicon;

  const Text_Field({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obsecureText,
    required this.preicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: Icon(preicon),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
        ),
      ),
    );
  }
}
