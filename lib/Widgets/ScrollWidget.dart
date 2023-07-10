import 'Widgets.dart';

class ContainerScrollResult extends StatefulWidget {
  const ContainerScrollResult({super.key});

  @override
  State<ContainerScrollResult> createState() => _ContainerScrollResultState();
}

class _ContainerScrollResultState extends State<ContainerScrollResult> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: color_1,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: Container(
                    child: Text(
                      'Most recent',
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.amaticSc(color: iconcolor, fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  )),
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
}