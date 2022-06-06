// ignore: file_names
// ignore_for_file: unused_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/GlobalPrams/params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        const DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.lightBlue])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/im.jfif"),
                radius: 50,
              ),
            )),
        ...(Globalparams.menus).map((item) {
          return ListTile(
            leading: item['icon'],
            trailing: const Icon(Icons.arrow_right, color: Colors.blue),
            title: Text(
              '${item['title']}',
              style: const TextStyle(fontSize: 22),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '${item['route']}');
            },
          );
        })
      ],
    ));
  }
}
