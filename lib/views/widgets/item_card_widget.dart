import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String price;
  final int totalQuantity;
  const ItemCard({
    Key? key,
    required this.id,
    required this.price,
    required this.totalQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 36, 191, 218),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "$id",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Text(
              "$totalQuantity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              "$price\$",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
