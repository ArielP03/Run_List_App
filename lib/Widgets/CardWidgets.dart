// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../src/Providers/DBProvider.dart';
import 'Widgets.dart';

class CardView extends StatelessWidget {
  final name;
  final date;
  final tarea;
  final id;

  const CardView(
      {super.key,
      required this.name,
      required this.date,
      required this.tarea,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (
              BuildContext context,
            ) {
              return dialogDetails(context, name, date, tarea);
            });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        width: MediaQuery.of(context).size.width * 0.96,
        height: MediaQuery.of(context).size.height * 0.145,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.10),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer),
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 5, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.courgette(
                        color: color_3,
                        fontSize: 25,
                      )),
                    IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          showDialog(context: context, builder: cardDialogEdit);
                         
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          color: iconcolor,
                          size: 20,
                        )),
                ],
              ),
              Row(children: [Container(height:30,width: 340,child: Text(tarea,overflow: TextOverflow.ellipsis,style: GoogleFonts.courgette(color: color_3, fontSize: 15),))],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(date,style: GoogleFonts.courgette(color: color_3, fontSize: 20)),
              ],)
            ],
          ),
        ),
      ),
    );
  }

  dialogDetails(BuildContext context, name, date, tarea) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60), color: Colors.white),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(children: [
            Row(children: [
              Container(
                  padding: EdgeInsets.all(5),
                  width: 250,
                  height: 50,
                  child: Text('Name: $name',
                      style: GoogleFonts.courgette(
                        color: color_3,
                        fontSize: 25,
                      )))
            ]),
            Container(
                width: 250,
                height: 40,
                child: Text('Date: $date',
                    style: GoogleFonts.courgette(
                      color: color_3,
                      fontSize: 25,
                    ))),
            Container(
                width: 250,
                height: 40,
                child: Text('Task:',
                    style:
                        GoogleFonts.courgette(color: color_3, fontSize: 25))),
            Container(
                width: 250,
                height: 320,
                child: SingleChildScrollView(
                    child: Text(
                  tarea,
                  style: GoogleFonts.courgette(fontSize: 17, color: color_3),
                )))
          ]),
        ),
      ),
    );
  }

  Widget cardDialogEdit(
    BuildContext context,
  ) {
    // DateTime fecha = DateTime.now();
    TextEditingController name1 = TextEditingController(text: name);
    TextEditingController date1 = TextEditingController(text: date);
    TextEditingController tarea1 = TextEditingController(text: tarea);
    var _id = id;
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
                          controller: name1,
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
                          controller: tarea1,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          _name = name1.text;
                          _date = date1.text;
                          _tarea = tarea1.text;
                          Navigator.pop(context);
                           final list = ListModel(
                              id: _id, name: _name, date: _date, tarea: _tarea);
                          DBProvider.db.updateTask(list);
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
}
