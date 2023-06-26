import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SwitchBtn extends StatefulWidget {
  final activecolor;

  const SwitchBtn({
    super.key,
    required this.activecolor,
  });

  @override
  State<SwitchBtn> createState() => _SwitchBtnState();
}

class _SwitchBtnState extends State<SwitchBtn> {
  bool switchstate = true;
  void onChanged(bool newstate) {
    setState(() {
      switchstate = newstate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchstate,
      onChanged: ((value) {
        (bool newstate) => onChanged(newstate);
      }),
      activeColor: widget.activecolor,
    );
  }
}
