import 'package:flutter/material.dart';

class ItemDetailQuantity extends StatelessWidget {
  final int quantity;
  final upQty;
  final downQty;
  ItemDetailQuantity(this.quantity, this.upQty, this.downQty);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [Colors.green[300], Colors.green[100]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: quantity > 1
                  ? () {
                      downQty();
                    }
                  : null,
            ),
            Text(
              'Quantity: $quantity',
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                upQty();
              },
            ),
          ],
        ),
      ),
    );
  }
}
