import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';
import '../model/order.dart';
import 'package:intl/intl.dart';
import '../appData.dart';
import '../ui/item_detail.dart';

class OrderAmountDetail extends StatelessWidget {
  final Order order;
  showItemDetail(context, OrderItem item) {
    item.item.name = item.name;
    item.item.price = item.price;
    item.item.description = item.description;
    item.item.notice = item.notice;
    item.item.weight = item.weight;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ItemDetail(
              item: item.item,
              canBeAdded: false,
            )));
  }

  OrderAmountDetail(this.order);
  @override
  Widget build(BuildContext context) {
    return HomeGiftWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Id: ${order.id}'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('assets/images/item_placeholder.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: ${order.name}'),
                        Text('Address: ${order.address}'),
                        Text(
                            'Date: ${DateFormat('yMMMd').format(order.createdAt)}'),
                      ],
                    )
                  ],
                ),
                DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(
                      label: Text('#'),
                    ),
                    DataColumn(
                      label: Text('Item'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                    ),
                    DataColumn(
                      label: Text('Amount'),
                    ),
                  ],
                  rows: order.items.map((item) {
                    int counter = 1;
                    return DataRow(
                      cells: [
                        DataCell(Text('$counter'), onTap: () {
                          showItemDetail(context, item);
                        }),
                        DataCell(Text('${item.name}'), onTap: () {
                          showItemDetail(context, item);
                        }),
                        DataCell(Text('${item.price}'), onTap: () {
                          showItemDetail(context, item);
                        }),
                        DataCell(Text('${item.quantity}'), onTap: () {
                          showItemDetail(context, item);
                        }),
                        DataCell(
                            SizedBox(
                              width: 50,
                                child: Text('${item.quantity * item.price}', textAlign: TextAlign.end,)),
                            onTap: () {
                          showItemDetail(context, item);
                        }),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Total',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        '${order.amount} MMK',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Delivery Fees',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        '${AppData.deliveryFees} MMK',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Grand Total',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        '${AppData.deliveryFees + order.amount} MMK',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
