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
          prefixIcon: Icon(
            preicon,
            color: Colors.grey.shade500,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color.fromRGBO(179, 179, 179, 1))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(0, 78, 131, 10)),
          ),
          fillColor: Theme.of(context).colorScheme.background,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
        ),
      ),
    );
  }
}
