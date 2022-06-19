
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.name, required this.quantity}) : super(key: key);

  final String name;
  final String quantity;


  @override
  Widget build(BuildContext context) {
    return Column(
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
            );
  }
}