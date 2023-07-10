// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';
import 'Widgets.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width * 0.96,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.30),
                blurRadius: 10,
                blurStyle: BlurStyle.outer),
          ]),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 5, 5, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pedrito Perez',
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
                      onPressed: () => '',
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