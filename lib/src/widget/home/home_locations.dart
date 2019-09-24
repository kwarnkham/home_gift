import 'package:flutter/material.dart';

class HomeLocations extends StatelessWidget {
  final List<String> states = [
    'Kacin',
    'Kayar',
    'Kayin',
    'Chin',
    'Mon',
    'Burma',
    'Rakhine',
    'Shan'
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 10,
      children: states
          .map(
            (location) => RaisedButton(
              color: Colors.cyan[200],
              onPressed: () {},
              child: Text(location),
            ),
          )
          .toList(),
    );
  }
}
