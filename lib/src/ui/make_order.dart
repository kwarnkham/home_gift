import 'package:flutter/material.dart';
import 'package:home_gift/src/widget/make_order/submit_order.dart';
import '../home_gift_theme.dart';
import '../widget/make_order/make_order_bottom_app_bar.dart';

class MakeOrder extends StatefulWidget {
  @override
  _MakeOrderState createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder> {
  GlobalKey _formKey = new GlobalKey<FormState>();
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              autovalidate: false,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
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
                    autofocus: true,
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
                  SizedBox(height: 20,),
                  SubmitOrder()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
