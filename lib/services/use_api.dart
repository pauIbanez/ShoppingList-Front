

import 'dart:convert';

import 'package:shopping_list/models/item.dart';
import 'package:http/http.dart' as http;

class UseAPI {
  var client = http.Client();

  Future<List<Item>?> getAllItems() async {

    var uri = Uri.parse("http://10.0.2.2:8081/items/all");
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;

      return itemFromJson(json);
    }
  }

  Future<bool> toggleItem(Item item) async {
    var uri = Uri.parse("http://10.0.2.2:8081/items/modify");
    var response = await client.put(uri,
      headers: <String, String> {
        "content-type": "application/json"
      },
      body: jsonEncode(<String, Object>{
        "id": item.id,
        "checked": !item.checked,
      })
    );

    if(response.statusCode == 202) {
      return true;
    }

    return false;
  }

  Future<void> createItem(String name, int quantity) async {
    var uri = Uri.parse("http://10.0.2.2:8081/items/create");
    await client.put(uri,
      headers: <String, String> {
        "content-type": "application/json"
      },
      body: jsonEncode(<String, Object>{
        "name": name,
        "quantity": quantity,
      })
    );
  }

   Future<void> modifyItem(String id, String name, int quantity) async {
    var uri = Uri.parse("http://10.0.2.2:8081/items/modify");
    await client.put(uri,
      headers: <String, String> {
        "content-type": "application/json"
      },
      body: jsonEncode(<String, Object>{
        "id": id,
        "name": name,
        "quantity": quantity,
      })
    );
  }
  

  Future<bool> deleteItem(String itemId) async {
    var uri = Uri.parse("http://10.0.2.2:8081/items/delete");
    var response = await client.put(uri,
      headers: <String, String> {
        "content-type": "application/json"
      },
      body: jsonEncode(<String, Object>{
        "id": itemId,
      })
    );

    if(response.statusCode == 200) {
      return true;
    }

    return false;
  }
}