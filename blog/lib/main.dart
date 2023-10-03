import 'package:blog/screens/blog_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        backgroundColor: const Color.fromRGBO(219, 214, 238, 1),
        primaryColor: Color.fromRGBO(52, 35, 118, 1),
        accentColor: const Color.fromRGBO(183, 173, 221, 1),
      ),
      // home: ComplaintsScreen(),
      home: BlogScreen(),
    );
  }
}

