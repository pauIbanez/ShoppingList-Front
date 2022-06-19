import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/services/use_api.dart';
import 'package:shopping_list/widgets/item.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Item>? items;
  bool isLoaded = false;


  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    items = await UseAPI().getAllItems();

    if(items != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  checkItem(Item item) async {
    await UseAPI().toggleItem(item);

    setState(() {
      isLoaded = false;
    });

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListItem(name: items![index].name, quantity: items![index].quantity.toString(), id: items![index].id, checked: items![index].checked, onClick: () { checkItem(items![index]); });
        },
        itemCount: items?.length,
      ),
    );
  }
}