import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeGiftWrapper(
          child: Scaffold(
        appBar: AppBar(title: TextField(autofocus: true, decoration: InputDecoration(hintText: 'Search'),),),
      ),
    );
  }
}