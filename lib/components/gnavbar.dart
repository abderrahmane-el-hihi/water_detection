import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:waterdetection/settingspage.dart';

class GNavBar extends StatefulWidget {
  const GNavBar({super.key});

  @override
  State<GNavBar> createState() => _GNavBarState();
}

class _GNavBarState extends State<GNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GNav(
      hoverColor: Colors.grey[100]!,
      gap: 8,
      activeColor: Color.fromRGBO(0, 78, 131, 10),
      iconSize: 32,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),

      duration: Duration(milliseconds: 400),
      //tabBackgroundColor: Colors.grey[100]!,
      tabBackgroundColor: Color.fromRGBO(0, 79, 131, 0.164),
      color: Color.fromARGB(255, 143, 143, 143),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      tabs: [
        GButton(
          icon: Icons.home_rounded,
          //text: '${AppLocale.words[9].getString(context)}',
          text: 'Home',
        ),
        GButton(
          icon: Icons.settings_rounded,
          //text: '${AppLocale.words[0].getString(context)}',
          text: 'Settings',
        ),
      ],
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
