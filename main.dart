

import 'package:flutter/material.dart';

import 'package:myproject/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Google Maps",
      home: HomePage(),

    );


    
  }
}

