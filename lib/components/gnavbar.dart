import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../settingspage.dart';

class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Theme.of(context).colorScheme.primary,
      hoverColor: Colors.grey[100]!,
      gap: 8,
      activeColor: Color(0xFF00BCD4),
      iconSize: 32,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      tabBackgroundColor: Color(0x1A00BCD4),
      color: Color.fromARGB(255, 143, 143, 143),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      onTabChange: (value) => onTabChange!(value),
      tabs: [
        GButton(
          icon: Icons.home_outlined,
          text: '${AppLocale.words[8].getString(context)}',
        ),
        GButton(
          icon: Icons.settings_outlined,
          text: '${AppLocale.words[0].getString(context)}',
        ),
      ],
    );
  }
}
