// ignore_for_file: file_names

import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int inc = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
          child: Text(
        'hello in About page=> $inc ',
        style: const TextStyle(fontSize: 26),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                setState(() {
                  --inc;
                });
              },
              child: const Icon(Icons.remove)),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  ++inc;
                });
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
