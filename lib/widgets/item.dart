
import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/popup_menu.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.name, required this.quantity, required this.id, required this.checked, required this.onClick, required this.onDelete, required this.onEdit}) : super(key: key);

  final String name;
  final String quantity;
  final String id;
  final bool checked;
  final void Function() onClick;
  final void Function() onDelete;
  final void Function() onEdit;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
            child: Row(
              children: [
                Visibility(
                  visible: checked,
                  replacement: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[300],
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 30),
                  ),
                ),                
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:  const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Quantity: $quantity")
                    ],
                  ),
                ),
                ItemPopupMenu(onDelete: onDelete, onEdit: onEdit)
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
  }
}