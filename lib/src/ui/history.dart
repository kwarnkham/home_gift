import 'package:flutter/material.dart';
import '../bloc/order_bloc.dart';
import '../model/user.dart';
import '../model/order.dart';
import 'package:intl/intl.dart';
import '../widget/auth_data.dart';
import './order_amount_detail.dart';
import '../appData.dart';

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
  OrderBloc _orderBloc;
  String _filter;
  @override
  void initState() {
    _filter = 'this week';
    _orderBloc = OrderBloc();
    super.initState();
  }

  @override
  void dispose() {
    _orderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User _user = AuthData.of(context).user;
    if (_user.apiToken != null) _orderBloc.getOrders(_user);
    return _user.apiToken == null
        ? Center(
            child: Text('Login to see history'),
          )
        : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _filter == 'this week'
                        ? OutlineButton(
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            child: Text('This Week'),
                            onPressed: () {},
                          )
                        : OutlineButton(
                            child: Text('This Week'),
                            onPressed: () {
                              setState(() {
                                _filter = 'this week';
                              });
                            },
                          ),
                    _filter == 'last week'
                        ? OutlineButton(
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            child: Text('Last Week'),
                            onPressed: () {},
                          )
                        : OutlineButton(
                            child: Text('Last Week'),
                            onPressed: () {
                              setState(() {
                                _filter = 'last week';
                              });
                            },
                          ),
                    _filter == 'last month'
                        ? OutlineButton(
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            child: Text('Last Month'),
                            onPressed: () {},
                          )
                        : OutlineButton(
                            child: Text('Last Month'),
                            onPressed: () {
                              setState(() {
                                _filter = 'last month';
                              });
                            },
                          ),
                    _filter == 'all'
                        ? OutlineButton(
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            child: Text('All'),
                            onPressed: () {},
                          )
                        : OutlineButton(
                            child: Text('All'),
                            onPressed: () {
                              setState(() {
                                _filter = 'all';
                              });
                            },
                          ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<List<Order>>(
                    stream: _orderBloc.orders,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data.length > 0
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (_, index) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.orangeAccent,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  '${DateFormat('yMMMd').format(snapshot.data[index].createdAt)}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                // PopupMenuItem(
                                                //   child: Text('Items'),
                                                //   value: 'items',
                                                // ),
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
                                                'Amount: ${snapshot.data[index].amount + AppData.deliveryFees} MMK'),
                                            IconButton(
                                              icon: Icon(Icons.visibility),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            OrderAmountDetail(
                                                                snapshot.data[
                                                                    index])));
                                              },
                                            ),
                                            Flexible(
                                              child: SizedBox(),
                                              fit: FlexFit.tight,
                                            ),
                                            if (snapshot.data[index].cNote ==
                                                null)
                                              Text(
                                                  'ID:  ${snapshot.data[index].id}')
                                          ],
                                        ),
                                        if (snapshot.data[index].cNote != null)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Note: ${snapshot.data[index].cNote}',
                                                style:
                                                    TextStyle(wordSpacing: 2),
                                              ),
                                              Text(
                                                  'ID:  ${snapshot.data[index].id}')
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text('You have no order history'),
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
