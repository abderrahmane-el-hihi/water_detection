import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
//import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../settingspage.dart';
//import 'package:waterdetection/settingspage.dart';
//import '../Home2page.dart';
//import '../homepage.dart';

class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Theme.of(context).colorScheme.primary,
      hoverColor: Colors.grey[100]!,
      gap: 8,
      activeColor: Color.fromRGBO(0, 78, 131, 10),
      iconSize: 32,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: Duration(milliseconds: 400),
      //tabBackgroundColor: Colors.grey[100]!,
      curve: Curves.easeInOut,
      tabBackgroundColor: Color.fromRGBO(0, 79, 131, 0.164),
      //tabActiveBorder:Border.all(color: Color.fromRGBO(0, 78, 131, 10), width: 2),
      color: Color.fromARGB(255, 143, 143, 143),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // selectedIndex: _selectedIndex,
      onTabChange: (value) => onTabChange!(value),
      tabs: [
        GButton(
          icon: Icons.home_rounded,
          text: '${AppLocale.words[8].getString(context)}',
        ),
        GButton(
          icon: Icons.settings_rounded,
          text: '${AppLocale.words[0].getString(context)}',
        ),
      ],
    );
  }
}
