import 'package:calculator/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {MyApp.routename: (buildContext) => MyApp()},
    initialRoute: MyApp.routename,
  ));
}

class MyApp extends StatelessWidget {
  static const String routename = 'myapp';

  @override
  Widget build(BuildContext context) {
    return home_screen();
  }
}
