import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';
import '../ui/cart.dart';
import '../bloc/cart_item_bloc.dart';
import '../model/cart_item.dart';
import '../bloc/order_bloc.dart';

enum PaymentMethod { cash, visa, mpu }

class MakeOrder extends StatefulWidget {
  @override
  _MakeOrderState createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder>
    with SingleTickerProviderStateMixin {
  final _formKey = new GlobalKey<FormState>();
  PaymentMethod _method = PaymentMethod.cash;
  bool _hasNote;
  Map<String, dynamic> _inputData = Map();
  List<CartItem> _cartItem;
  OrderBloc orderBloc;
  User user;

  @override
  void initState() {
    orderBloc = OrderBloc();
    userBloc.user.listen((value) {
      orderBloc.getOrders(value);
    });
    userBloc.getAppUser();
    
    
    _hasNote = false;
    userBloc.getAppUser();
    cartItemBloc.items.listen((value) {
      _cartItem = value;
    });
    cartItemBloc.getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_cartItem);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: HomeGiftTheme.gradientStart,
            end: HomeGiftTheme.graidentEnd,
            colors: [
              HomeGiftTheme.gradientFirstColor,
              HomeGiftTheme.gradientSecondColor
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Make Order'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: StreamBuilder<User>(
                stream: userBloc.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Form(
                      autovalidate: false,
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            onSaved: (value) {
                              _inputData['name'] = value;
                            },
                            initialValue: snapshot.data.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              _inputData['address'] = value;
                            },
                            initialValue: snapshot.data.address,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_city),
                              border: OutlineInputBorder(),
                              labelText: 'Delivery Address',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Address cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              _inputData['mobile'] = value;
                            },
                            initialValue: snapshot.data.mobile,
                            autofocus: false,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_iphone),
                                prefix: Text('09'),
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Phone Number cannot be empty';
                              }
                              if (int.tryParse(value) == null ||
                                  int.parse(value) < 0 ||
                                  value.length < 7 ||
                                  value.length > 9) {
                                return 'Enter real Phone Number';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Switch(
                                value: _hasNote,
                                onChanged: (value) {
                                  setState(() {
                                    _hasNote = value;
                                    if (!value) {
                                      _inputData.remove('note');
                                    }
                                  });
                                },
                              ),
                              Text(
                                'Add Note',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          if (_hasNote)
                            TextFormField(
                              onSaved: (value) {
                                _inputData['note'] = value;
                              },
                              autofocus: false,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.note),
                                  border: OutlineInputBorder(),
                                  labelText: 'Note'),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Payment Method',
                                style: TextStyle(fontSize: 25),
                              ),
                              RadioListTile<PaymentMethod>(
                                title: const Text('VISA'),
                                value: PaymentMethod.visa,
                                groupValue: _method,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _method = value;
                                  });
                                },
                              ),
                              RadioListTile<PaymentMethod>(
                                title: const Text('Cash'),
                                value: PaymentMethod.cash,
                                groupValue: _method,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _method = value;
                                  });
                                },
                              ),
                              RadioListTile<PaymentMethod>(
                                title: const Text('MPU'),
                                value: PaymentMethod.mpu,
                                groupValue: _method,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _method = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              OutlineButton(
                                borderSide: BorderSide(
                                    color: HomeGiftTheme.primaryColor,
                                    width: 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.navigate_before,
                                      color: HomeGiftTheme.secondayColor,
                                    ),
                                    Text('Items'),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Cart()));
                                },
                              ),
                              OutlineButton(
                                borderSide: BorderSide(
                                    color: HomeGiftTheme.primaryColor,
                                    width: 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Next'),
                                    Icon(
                                      Icons.navigate_next,
                                      color: HomeGiftTheme.secondayColor,
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _inputData['payment'] =
                                        _method.toString().split('.').last;
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
