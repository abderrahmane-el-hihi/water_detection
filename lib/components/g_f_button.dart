import 'package:flutter/material.dart';

class G_F_Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  //final String imgpath;
  const G_F_Button({
    super.key,
    required this.onTap,
    required this.text,
    //required this.imgpath
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
            ),
            //Image.asset('assets/lib/images/google.png'),
          ],
        ),
        width: 130,
        height: 58,
        //padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: Color.fromRGBO(179, 179, 179, 1),
            width: 1,
          ),
        ),
      ),
    );
  }
}
