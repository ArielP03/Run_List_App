import 'package:flutter/material.dart';
import 'src/Screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tareas',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'setting':(_)=>SettingPage(),
      }
    );
  }
}
