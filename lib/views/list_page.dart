

import 'package:flutter/material.dart';
import 'package:shopping_list/views/create_page.dart';
import 'package:shopping_list/widgets/item_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  bool create = false;

  gotoCreateItem() {
    setState(() {
      create = true;
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: !create ? const ItemListPage() : const CreateItemPage(),
      floatingActionButton: !create ? FloatingActionButton(onPressed: gotoCreateItem, child: const Icon(Icons.add, color: Colors.white, size: 40,),) : Container(),
    );
  }
}