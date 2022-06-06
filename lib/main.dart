import 'package:flutter/material.dart';
import 'package:my_app/ui/pages/About.dart';
import 'package:my_app/ui/pages/Contact.dart';
import 'package:my_app/ui/pages/Home.dart';

void main(List<String> args) {
  runApp(const myhomepage());
}

// ignore: camel_case_types
class myhomepage extends StatelessWidget {
  const myhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const myhome(),
        "/about": (context) => const About(),
        "/contact": (context) => const Contact()
      },
      title: 'my first app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
