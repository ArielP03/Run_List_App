
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Color color_1 = Color.fromARGB(255, 43, 120, 164);
final Color color_3 = Color.fromARGB(255, 55, 156, 212);
final Color color_2 = Color.fromARGB(255, 19, 41, 62);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              delegate: CardWidget(),
            ),
            icon: SvgPicture.asset(
              'assets/icon_search.svg',
              // ignore: deprecated_member_use
              color: color_2,
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
    );
  }
}

class CardWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          splashColor: Colors.transparent,
          splashRadius: 1,
          icon: Icon(CupertinoIcons.clear_thick),
          onPressed: () => this.query = '',
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      splashColor: Colors.transparent,
      splashRadius: 1,
      onPressed: () => this.close(context, null),
      icon: Icon(CupertinoIcons.back));

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return Container(
      child: Container(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Container(child: Text(
              'Resultado',
              textAlign: TextAlign.center,
            ) ,
            ),
            Container(child:ListView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              children: [CardView()],
            ),color: Colors.transparent ,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,)
            
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
            gradient: LinearGradient(
              colors: [color_1, Colors.white],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            )),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      color: color_1,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container(
        color: color_1,
        child: Container(
          child: ListTile(
            title: Text(
              'Suggestions',
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60)),
              gradient: LinearGradient(
                colors: [color_1, Colors.white],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      );
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: color_1,
        elevation: 0,
        foregroundColor: color_2,
        shape: null,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CardView() {
  return Container(
    color: Colors.yellow,
    width: 50,
    height: 50,
    child: Column(
      children: [Row(children: [Text('hello')],),],
  ),);
}
