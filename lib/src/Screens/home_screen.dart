// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_list/Widgets/Widgets.dart';

final Color color_1 = Color.fromARGB(255, 43, 120, 164);
final Color color_3 = Color.fromARGB(255, 55, 156, 212);
final Color iconcolor = Colors.black;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = 0;
  int _selectedIndex = 0;
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
        //Navigator.pushNamed(context, '$page',);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_1,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shape: null,
        elevation: 0,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            splashRadius: 1,
            onPressed: () => showSearch(
              context: context,
              delegate: SearchWidget(),
            ),
            icon: SvgPicture.asset(
              'assets/icon_search.svg',
              color: iconcolor,
            ),
            iconSize: 45,
          )
        ],
      ),
      backgroundColor: color_1,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [color_1, Colors.white]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        ),
        child: Center(
          child: Text(
            'hello',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(context: context, builder: cardDialog),
        child: SvgPicture.asset(
          'assets/392530_add_create_cross_new_plus_icon.svg',
          width: 35,
          height: 35,
          color: iconcolor,
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
              icon: SvgPicture.asset('assets/icons8-home.svg', color: color_3),
              iconSize: 45,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(1);
              },
              icon: SvgPicture.asset('assets/icons8-setting.svg',
                  color: iconcolor),
              iconSize: 45,
            )
          ],
        ),
      ),
    );
  }
}

@override
Widget cardDialog(BuildContext context) {
  return Center(
    child: Text('Add'),
  );
}
