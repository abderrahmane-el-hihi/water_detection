import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 290,
                top: 670,
              ),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {},
                //splashColor: Color.fromARGB(248, 0, 34, 57),
                child: Icon(Icons.arrow_forward_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
