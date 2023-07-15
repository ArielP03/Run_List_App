// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';

import '../src/Providers/DBProvider.dart';
import 'Widgets.dart';

class ContainerScrollResult extends StatefulWidget {
  final query;
  const ContainerScrollResult({super.key, this.query});

  @override
  State<ContainerScrollResult> createState() => _ContainerScrollResultState();
}

class _ContainerScrollResultState extends State<ContainerScrollResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_1,
      child: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [color_1, Colors.white]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        ),
        child: FutureBuilder(
            future: DBProvider.db.getTaskId(widget.query),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final list = snapshot.data;
              if (list!.length == 0) {
                return Center(
                  child: noDataS(),
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
                      child: Container(
                        height: 25,
                        child: Text(
                          'Result',
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
                                DBProvider.db.deleteTask(list[i].id);
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
                                id: list[i].id,
                                name: list[i].name,
                                date: list[i].date,
                                tarea: list[i].tarea,
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
      )),
    );
  }

  Widget noDataS() {
    return Center(child: Text('have no data',style: GoogleFonts.courgette(color:color_3,fontSize: 25),),);
  }
}

class ContainerScrollSuggestions extends StatefulWidget {
  const ContainerScrollSuggestions({super.key});

  @override
  State<ContainerScrollSuggestions> createState() =>
      _ContainerScrollSuggestionsState();
}

class _ContainerScrollSuggestionsState
    extends State<ContainerScrollSuggestions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: color_1,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: Container(
                    child: Text(
                      'Suggestions',
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.amaticSc(color: iconcolor, fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  )),
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
}
