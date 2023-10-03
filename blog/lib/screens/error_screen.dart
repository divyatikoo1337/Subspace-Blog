import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key, required this.error});

  var error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We're Sorry!"),
      ),
      body: const Center(
        child: Text('Sorry for the inconvinience. Please try again later.'),
      ),
    );
  }
}
