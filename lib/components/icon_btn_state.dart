import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToggleButton extends StatefulWidget {
  final double size;
  final color;
  //final Function() ontap;
  //final Function onToggle;
  const ToggleButton({
    super.key,
    required this.size,
    required this.color,
    //required this.ontap,
    //required this.onToggle,
  });

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isOn = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
          isDark = !isDark;
          //widget.onToggle(isOn);
        });
        //widget.ontap;
      },
      child: Icon(
        isOn ? Icons.toggle_on : Icons.toggle_off,
        size: widget.size,
        color: widget.color,
      ),
    );
  }
}
