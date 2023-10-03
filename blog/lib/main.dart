import 'package:blog/provider/favorite_provider.dart';
import 'package:blog/screens/blog_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MaterialApp(
          theme: ThemeData().copyWith(
            useMaterial3: true,
            primaryColor: Color.fromARGB(255, 9, 8, 40),
            backgroundColor: Color.fromRGBO(230, 227, 245, 1),
            accentColor: Color.fromARGB(124, 9, 8, 40),
          ),
          home: BlogScreen(),
        )
    );
  }
}

