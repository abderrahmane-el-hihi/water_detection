import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //signout method
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  void PageBack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        actions: [
          IconButton(onPressed: SignOut, icon: Icon(Icons.logout)),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,

            children: [
              IconButton(
                  onPressed: PageBack, icon: Icon(Icons.arrow_back_rounded))
            ],
          ),
        ],
      ),*/
      body: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Bonjour.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Icon(
                      Icons.search_rounded,
                      size: 32,
                    ),
                    Icon(
                      Icons.menu_rounded,
                      size: 32,
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 32,
                    ),
                    Icon(
                      Icons.notifications_rounded,
                      size: 32,
                    ),
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 32,
                    ),
                    IconButton(
                      onPressed: SignOut,
                      icon: Icon(
                        Icons.logout,
                        size: 32,
                      ),
                    ),
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
