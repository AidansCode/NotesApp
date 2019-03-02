import 'package:flutter/material.dart';
import 'package:notes_app/controllers/home_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: HomeController()
    );
  }

}
