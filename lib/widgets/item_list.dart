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

      items?.sort((a, b) => a.name.compareTo(b.name));

      setState(() {
        isLoaded = true;
      });
    }
  }

  checkItem(Item item) async {

    print(item.name);
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
          Item item = items![index];

          return ListItem(name: item.name, quantity: item.quantity.toString(), id: item.id, checked: item.checked, onClick: () { checkItem(item); });
        },
        itemCount: items?.length,
      ),
    );
  }
}