import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/widgets/item_form.dart';

class EditItemPage extends StatefulWidget {
  const EditItemPage({Key? key, required this.changePage, required this.item}) : super(key: key);

  final void Function(String) changePage;
  final Item? item;

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Item")),
      body: ItemForm(changePage: () => widget.changePage("list"), name: widget.item!.name, quantity: widget.item!.quantity.toString()),
    );
  }
}