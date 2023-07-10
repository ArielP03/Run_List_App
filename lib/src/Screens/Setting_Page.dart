// ignore_for_file: deprecated_member_use

import 'package:app_list/src/Screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  

  @override
  Widget build(BuildContext context) {
    final controller = 1;
    int _selectedIndex = controller;
    onTabTapped(int index) {
      setState(() {
        _selectedIndex = index;
        Widget page = Center();
        if (index == 0) {
          page = HomeScreen();
        }
        if (index == 1) {
          page = SettingPage();
        }
        if (_selectedIndex != controller) {
         // Navigator.pushNamed(context, '$page');
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: Duration(milliseconds: 50),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
        }
      });
    }

    return Scaffold(
      body: Center(child: Text('Setting')),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                onTabTapped(0);
              },
              icon:
                  SvgPicture.asset('assets/icons8-home.svg', color: iconcolor),
              iconSize: 45,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(1);
              },
              icon:
                  SvgPicture.asset('assets/icons8-setting.svg', color: color_3),
              iconSize: 45,
            )
          ],
        ),
      ),
    );
  }
}
