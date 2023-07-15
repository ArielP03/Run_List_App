// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_list/Widgets/Widgets.dart';
import 'package:intl/intl.dart';
import '../Providers/DBProvider.dart';

final Color color_1 = Color.fromARGB(255, 43, 120, 164);
final Color color_3 = Color.fromARGB(255, 55, 156, 212);
final Color iconcolor = Colors.black;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //DateTime _currentSelectDate = DateTime.now();
  // void callDatePicker() async {
  //   DateTime? a = await getDataPickerWidgets();
  //   setState(() {
  //     _currentSelectDate = a;
  //   });
  // }

  // Future<DateTime?> getDataPickerWidgets() {
  //   return showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2100),
  //   );
  // }

  final a = null;
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
        centerTitle: false,
        backgroundColor: color_1,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shape: null,
        elevation: 0,
        title: Transform(
          transform:  Matrix4.translationValues(-40.0, 0.0, 0.0),
          child: Text('Home',style: GoogleFonts.courgette(color: iconcolor,fontSize: 40),)),
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
        child: FutureBuilder(
            future: DBProvider.db.getAllTask(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final list = snapshot.data;
              if (list!.length == 0) {
                return Center(
                  child: noData(),
                );
              }
              return Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    gradient: LinearGradient(
                      colors: [color_1, Colors.white],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 25,
                        child: Text(
                          'All',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.amaticSc(
                              color: iconcolor, fontSize: 20),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, i) {
                            return Dismissible(
                              onDismissed: (direction) {
                                DBProvider.db.deleteTask(list[i]!.id);
                              },
                              background: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          'assets/trash-1-svgrepo-com.svg',
                                          width: 40,
                                          height: 40,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        )),
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          'assets/trash-1-svgrepo-com.svg',
                                          width: 40,
                                          height: 40,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        ))
                                  ],
                                ),
                              ),
                              key: UniqueKey(),
                              child: CardView(
                                id : list[i]!.id,
                                name: list[i]!.name,
                                date: list[i]!.date,
                                tarea: list[i]!.tarea,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: color_3,
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

  Widget cardDialog(
    BuildContext context,
  ) {
    // DateTime fecha = DateTime.now();
    TextEditingController name = TextEditingController();
    TextEditingController date1 = TextEditingController();
    TextEditingController tarea = TextEditingController();
    var _id = 0;
    String _name = '';
    String _date = '';
    String _tarea = '';

    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Dialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
              padding: EdgeInsets.only(left: 15, right: 5),
              width: 550,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 40,
                        child: TextField(
                          textAlign: TextAlign.justify,
                          autofocus: true,
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 15, right: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Name',
                          ),
                          controller: name,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 40,
                        child: TextField(
                          textAlign: TextAlign.justify,
                          autofocus: true,
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_month_outlined),
                            contentPadding:
                                EdgeInsets.only(left: 15, right: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Select date',
                          ),
                          controller: date1,
                          onTap: () async {
                            DateTime? aF = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100));
                            if (aF != null) {
                              setState(
                                () {
                                  date1.text = DateFormat.yMd().format(aF);
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        height: 70,
                        child: TextField(
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Tasks'),
                          controller: tarea,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          _name = name.text;
                          _date = date1.text;
                          _tarea = tarea.text;
                          _id = await DBProvider.db.a_1();
                          print(_id);
                          Navigator.pop(context);
                          final list = ListModel(
                              id: _id, name: _name, date: _date, tarea: _tarea);
                          return DBProvider.db.addNewTask(list);
                        },
                        icon: SvgPicture.asset(
                            'assets/392530_add_create_cross_new_plus_icon.svg'),
                      )
                    ],
                  )
                ],
              )));
    });
  }
  
  Widget noData() {
    return Center(child: Text('have no data',style: GoogleFonts.courgette(color:color_3,fontSize: 30),),);
  }
}
