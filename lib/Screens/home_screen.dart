// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(UniconsLine.search),
          color: Color.fromRGBO(34, 156, 255, 1),
          onPressed: () => showSearch(context: context, delegate: CardWidget()),
          autofocus: false,
          hoverColor: Colors.transparent,
        )
      ],
    ));
  }
}

class CardWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(CupertinoIcons.clear_thick),
          onPressed: () => this.query = '',
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => this.close(context, null),
      icon: Icon(CupertinoIcons.back));

  @override
  Widget buildResults(BuildContext context) {
    print(query); 
    return Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) => ListTile(
        title: Text('Suggestions'),
      );
    //    @override
    //  PreferredSizeWidget buildBottom(BuildContext context) {
    //    return const PreferredSize(
    //       preferredSize: Size.fromHeight(56.0),
    //       child: Text('bottom'));
    // }
  @override
  ThemeData appBarTheme(BuildContext context) => ThemeData();
}
