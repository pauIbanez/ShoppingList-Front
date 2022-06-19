

import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/item_list.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: const ItemList()
    );
  }
}