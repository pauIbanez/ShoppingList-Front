

import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/views/create_page.dart';
import 'package:shopping_list/views/edit_page.dart';
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
  Item? currentItem;

  changePage(String page, [Item? item]) {
    setState(() {
      currentPage = page;
      currentItem = item;
    });
  }

  

  @override
  Widget build(BuildContext context) {

    Widget currentPageWidget;

    switch (currentPage) {
      case "create":
        currentPageWidget = CreateItemPage(changePage: () => changePage("list"),);
        break;
      
      case "edit":
        currentPageWidget = EditItemPage(changePage: changePage, item: currentItem);
        break;

      default:
        currentPageWidget = ListPage(changePage: changePage);
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