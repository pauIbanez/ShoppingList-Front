import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/widgets/item_list.dart';


class ListPage extends StatelessWidget {
  const ListPage({Key? key, required this.changePage}) : super(key: key);

  final void Function(String, [Item?]) changePage;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: ItemList(changePage: changePage),
      floatingActionButton: FloatingActionButton(onPressed: () => changePage("create"), child: const Icon(Icons.add, color: Colors.white, size: 40,),),
    );
  }
}
