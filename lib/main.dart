

import 'package:flutter/material.dart';
import 'package:shopping_list/views/create_page.dart';
import 'package:shopping_list/views/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String currentPage = "list";

  changePage(String page) {
    setState(() {
      currentPage = page;
    });
  }

  

  @override
  Widget build(BuildContext context) {

    Widget currentPageWidget;

    switch (currentPage) {
      case "create":
        currentPageWidget = CreateItemPage(changePage: () => changePage("list"),);
        break;
      default:
        currentPageWidget = ListPage(changePage: () => changePage("create"));
    }

    return MaterialApp(
      title: "Shopping List",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentPageWidget,
    );
  }
}