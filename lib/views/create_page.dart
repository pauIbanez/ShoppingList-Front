import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/item_form.dart';

class CreateItemPage extends StatefulWidget {
  const CreateItemPage({Key? key, required this.changePage}) : super(key: key);

  final void Function() changePage;

  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Item")),
      body: ItemForm(changePage: widget.changePage),
    );
  }
}