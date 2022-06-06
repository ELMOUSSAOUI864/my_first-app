// ignore: file_names, unnecessary_import
import 'dart:convert';

// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final controller = TextEditingController();
  String query = '';
  bool notvisible = true;
  dynamic data;
  int currentPage = 0;
  int totalePage = 0;
  int pageSize = 20;
  ScrollController scroolController = ScrollController();

  void onchange() {
    setState(() {
      query = controller.text;
    });
  }

  // ignore: unused_element
  void _searche(String query) {
    // ignore: unused_local_variable
    String url =
        "https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";

    http.get(Uri.parse(url)).then((response) {
      setState(() {
        data = json.decode(response.body);
        if (data['total_count'] % pageSize == 0) {
          totalePage = (data['total_count'] / pageSize).floor();
        } else {
          totalePage = (data['total_count'] / pageSize).floor() + 1;
        }
      });
    }).catchError((err) {
      // ignore: avoid_print
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    scroolController.addListener(() {
      if (scroolController.position.pixels ==
          scroolController.position.maxScrollExtent) {
        if (currentPage < totalePage - 1) {
          ++currentPage;
        }
        _searche(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact=>$currentPage/$totalePage")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    obscureText: notvisible,
                    controller: controller,
                    onChanged: (text) => onchange(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            notvisible = !notvisible;
                          });
                        },
                        icon: Icon(notvisible == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue)),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      query = controller.text;
                      _searche(query);
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 30,
                  )),
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: scroolController,
              itemCount: (data == null) ? 0 : data['items'].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(
                                data['items'][index]['avatar_url']),
                            radius: 40),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${data['items'][index]['login']}"),
                      ]),
                      CircleAvatar(
                          child: Text("${data['items'][index]['type']}"))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
