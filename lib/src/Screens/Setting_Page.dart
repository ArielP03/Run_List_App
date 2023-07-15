// ignore_for_file: deprecated_member_use

import 'package:app_list/src/Screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        backgroundColor: color_1,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shape: null,
        elevation: 0,
        title: Transform(
          transform:  Matrix4.translationValues(-40.0, 0.0, 0.0),
          child: Text('Setting',style: GoogleFonts.courgette(color: iconcolor,fontSize: 40),)),),
      body: Container(
        color: color_1,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),gradient: LinearGradient(
                      colors: [color_1, Colors.white],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                    )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                        //boxShadow: [BoxShadow(blurRadius: 20,spreadRadius:10,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                        //boxShadow: [BoxShadow(blurRadius: 20,spreadRadius:10,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                       // boxShadow: [BoxShadow(blurRadius: 20,spreadRadius:10,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                       // boxShadow: [BoxShadow(blurRadius: 20,spreadRadius:10,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                       // boxShadow: [BoxShadow(blurRadius: 20,spreadRadius:10,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      
                      color:color_3,
                        borderRadius: BorderRadius.circular(30),),
                        // boxShadow: [BoxShadow(blurRadius: 15,spreadRadius:0,color: Colors.grey.shade300)]
                        child: Icon(Icons.report),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
