import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../widget/submit_button.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';

enum PaymentMethod { cash, visa, mpu }

class MakeOrder extends StatefulWidget {
  @override
  _MakeOrderState createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder>
    with SingleTickerProviderStateMixin {
  GlobalKey _formKey = new GlobalKey<FormState>();
  PaymentMethod _method = PaymentMethod.visa;
  bool _hasNote;

  @override
  void initState() {
    _hasNote = false;
    userBloc.getAppUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        // bottomNavigationBar: MakeOrderBottomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: StreamBuilder<User>(
                stream: userBloc.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Form(
                      autovalidate: false,
                      key: _formKey,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
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
                                  value.length < 9 ||
                                  value.length > 11) {
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
                                  });
                                },
                              ),
                              Text(
                                'Add Note',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          if(_hasNote) TextFormField(
                            autofocus: false,
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
                          SubmitButton(label: 'Send Order', onPressed: () {}),
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
