// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final Color color_1 = Color.fromARGB(255, 43, 120, 164);
final Color color_3 = Color.fromARGB(255, 55, 156, 212);
final Color iconcolor = Color.fromARGB(255, 19, 41, 62);

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
    return SingleChildScrollView(
      child: Container(
        color: color_1,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width:  MediaQuery.of(context).size.width,
                height: 30,
                child:Container(child: 
                 Text(
                  'Most recent',
                  textAlign: TextAlign.center ,
                  style: GoogleFonts.amaticSc(color: iconcolor, fontSize: 20),
                  
                ),
                alignment: Alignment.center,
                
                )
              ),
              CardView(),
              CardView(),
              CardView(),
              CardView(),
              CardView(),
              CardView(),
              CardView(),
              CardView(),
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
        ),
      ),
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
        foregroundColor: iconcolor,
        shape: null,
      ),
    );
  }
}

class CardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5 , bottom: 5),
      width: MediaQuery.of(context).size.width*0.96,
      height: MediaQuery.of(context).size.height*0.15,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey[850]!.withOpacity(0.30),blurRadius: 10, blurStyle: BlurStyle.outer),]),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 5, 5, 5),
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Pedrito Perez',textAlign: TextAlign.center, style:GoogleFonts.courgette(color: color_3,fontSize:  25, )),
        Row(
          children:[
        IconButton(padding: EdgeInsets.all(0),onPressed: ()=>'', icon:Icon(Icons.edit_outlined, color: iconcolor,size: 20,)),
        IconButton(padding: EdgeInsets.all(0), onPressed: ()=>'', icon: SvgPicture.asset('assets/trash-1-svgrepo-com.svg', color:iconcolor,width: 20,height: 20,)),
        ])
        ],
          ),
        ],
        ),
      ),
    );
  }
}
