import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class G_F_Button extends StatelessWidget {
  final Function()? onTap;
  //final String text;
  final String svgpath;
  final double w, h;

  const G_F_Button({
    super.key,
    required this.onTap,
    //required this.text,
    required this.svgpath,
    required this.w,
    required this.h,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: 130,
        width: MediaQuery.of(context).size.width * 0.2,
        //height: 58,
        height: MediaQuery.of(context).size.height * 0.1,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              '${svgpath}',
              height: h,
              width: w,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: Text(text,style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),),),
          ],
        ),

        //padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 30),
        //padding: EdgeInsets.all(0),
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
