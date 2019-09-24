import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextField(autofocus: true, decoration: InputDecoration(hintText: 'Search'),),),
    );
  }
}