import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/services/use_api.dart';
import 'package:shopping_list/widgets/item.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
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

  checkItem(Item item, int itemIndex) async {

    bool sucessfull = await UseAPI().toggleItem(item);

    if (sucessfull) {
      setState(() {
        items![itemIndex].checked = !items![itemIndex].checked;
      });
    }
    
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

          return ListItem(name: item.name, quantity: item.quantity.toString(), id: item.id, checked: item.checked, onClick: () { checkItem(item, index); });
        },
        itemCount: items?.length,
      ),
    );
  }
}