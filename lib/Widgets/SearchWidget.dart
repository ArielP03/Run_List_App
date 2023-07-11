import 'package:flutter/cupertino.dart';
import 'Widgets.dart';

class SearchWidget extends SearchDelegate {
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
    return ContainerScrollResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) => ContainerScrollSuggestions();
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