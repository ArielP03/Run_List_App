// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';
import '../src/Providers/DBProvider.dart';
import 'Widgets.dart';

class CardView extends StatelessWidget {
final name;
  final date;
  final tarea;

  const CardView(
      {super.key, required this.name, required this.date, required this.tarea});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5,right: 10,left: 10, bottom: 5),
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
                Row(children: [
                  IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => '',
                      icon: Icon(
                        Icons.edit_outlined,
                        color: iconcolor,
                        size: 20,
                      )),
                  IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        
                        // DBProvider.db.deleteTask();
                      },
                      icon: SvgPicture.asset(
                        'assets/trash-1-svgrepo-com.svg',
                        color: iconcolor,
                        width: 20,
                        height: 20,
                      )),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
