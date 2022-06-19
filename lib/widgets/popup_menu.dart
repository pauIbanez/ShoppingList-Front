

import 'package:flutter/material.dart';

class ItemPopupMenu extends StatelessWidget {
  const ItemPopupMenu({Key? key, required this.onDelete, required this.onEdit}) : super(key: key);

  final void Function() onDelete;
  final void Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => [
        PopupMenuItem(
          onTap: onEdit,
          child: const ListTile(
            leading: Icon(Icons.edit, size: 20, color: Colors.black,),
            title: Text("Edit"),
          ),
        ),
        PopupMenuItem(
          onTap: onDelete,
          child: const ListTile(
            leading: Icon(Icons.delete, size: 20, color: Colors.black,),
            title: Text("Delete"),
          )
        ),
      ])
    );  
  }
}