

import 'package:shopping_list/models/item.dart';
import 'package:http/http.dart' as http;

class UseAPI {
  Future<List<Item>?> getAllItems() async {
    var client = http.Client();

    var uri = Uri.parse("http://10.0.2.2:8081/items/all");
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;

      return itemFromJson(json);
    }
  }
}