import 'package:flutter/material.dart';
import 'package:my_app/ui/widgets/Drawer.dart';

// ignore: camel_case_types
class myhome extends StatelessWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[const textinput()],
      ),
    );
  }
}

// ignore: camel_case_types
class textinput extends StatefulWidget {
  const textinput({Key? key}) : super(key: key);

  @override
  State<textinput> createState() => _textinputState();
}

// ignore: camel_case_types
class _textinputState extends State<textinput> {
  final controller = TextEditingController();
  String text = '';
  void onPressed() {
    setState(() {
      text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.message),
                  suffixIcon: IconButton(
                      onPressed: onPressed, icon: const Icon(Icons.send)))),
        ),
        Text(controller.text,
            style: const TextStyle(color: Colors.green, fontSize: 26))
      ],
    );
  }
}
