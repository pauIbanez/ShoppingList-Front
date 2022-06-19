import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    Item({
        required this.id,
        required this.name,
        required this.quantity,
        required this.checked,
    });

    String id;
    String name;
    int quantity;
    bool checked;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        checked: json["checked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "checked": checked,
    };
}