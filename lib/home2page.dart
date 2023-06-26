import 'package:flutter/material.dart';
import 'package:waterdetection/components/gnavbar.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/settingspage.dart';

class SwitchPages extends StatefulWidget {
  const SwitchPages({super.key});

  @override
  State<SwitchPages> createState() => _SwitchPAgesState();
}

class _SwitchPAgesState extends State<SwitchPages> {
  int _selectedIndex = 0;

  void Change(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [HomePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: GNavBar(onTabChange: (index) => Change(index)),
      body: pages[_selectedIndex],
    );
  }
}
