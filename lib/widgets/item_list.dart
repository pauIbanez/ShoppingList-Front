import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/services/use_api.dart';

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

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             items![index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Quantity: " + items![index].quantity.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: items?.length,
      ),
      replacement: const Center(child: CircularProgressIndicator(),),
    );
  }
}