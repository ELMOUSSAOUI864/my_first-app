import 'package:flutter/material.dart';

class Globalparams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Home",
      "icon": const Icon(Icons.home, color: Colors.blue),
      "route": "/"
    },
    {
      "title": "Contact",
      "icon": const Icon(Icons.home, color: Colors.blue),
      "route": "/contact"
    },
    {
      "title": "About",
      "icon": const Icon(Icons.home, color: Colors.blue),
      "route": "/about"
    }
  ];
}
