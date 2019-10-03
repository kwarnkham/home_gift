import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';
import '../bloc/order_bloc.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';
import '../model/order.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  static Map<String, dynamic> routeInfo = {
    'title': 'History',
    'routeName': '/history',
    'icon': Icons.history,
  };

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  OrderBloc orderBloc;
  User _user = User();

  @override
  void initState() {
    orderBloc = OrderBloc();
    userBloc.user.listen((value) {
      if (_user.id != value.id) {
        _user = value;
        orderBloc.getOrders(value);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    orderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlineButton(
                textColor: Colors.blue,
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                child: Text('This Week'),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text('Last Week'),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text('Last Month'),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text('All'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<List<Order>>(
              stream: orderBloc.orders,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.orangeAccent,
                                  radius: 30,
                                  child: Text(
                                    '${snapshot.data[index].status}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '${DateFormat('yMMMd').format(snapshot.data[index].createdAt)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        '${DateFormat('jm').format(snapshot.data[index].createdAt)}'),
                                  ],
                                ),
                                Flexible(
                                  child: SizedBox(),
                                  fit: FlexFit.tight,
                                ),
                                PopupMenuButton(
                                  onSelected: (value) {
                                    print(value);
                                  },
                                  itemBuilder: (_) => [
                                    PopupMenuItem(
                                      child: Text('Items'),
                                      value: 'items',
                                    ),
                                    PopupMenuItem(
                                      child: Text('Re-order'),
                                      value: 're-order',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Delivery Address: ${snapshot.data[index].address}'),
                            Row(
                              children: <Widget>[
                                Text(
                                    'Amount: ${snapshot.data[index].amount} MMK'),
                                IconButton(
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {},
                                ),
                                Flexible(
                                  child: SizedBox(),
                                  fit: FlexFit.tight,
                                ),
                                if (snapshot.data[index].cNote == null)
                                  Text('ID:  ${snapshot.data[index].id}')
                              ],
                            ),
                            if (snapshot.data[index].cNote != null)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Note: ${snapshot.data[index].cNote}',
                                    style: TextStyle(wordSpacing: 2),
                                  ),
                                  Text('ID:  ${snapshot.data[index].id}')
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        )
      ],
    );
  }
}
