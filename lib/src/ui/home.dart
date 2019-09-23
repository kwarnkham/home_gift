import 'package:flutter/material.dart';
import '../widget/search_item.dart';
import '../widget/home_carosel.dart';
import '../widget/bottom_navbar.dart';


class Home extends StatelessWidget {
  static const String routeName = '/';
  searchItem(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchItem()));
  }

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
    return Scaffold(
      bottomNavigationBar: BottomNavbar(index:0),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.shopping_cart), onPressed: (){},),
      body: Container(
        color: Colors.brown[200],
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: Text('Home Gift'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchItem(context);
                  },
                  iconSize: 40,
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                HomeCarosel(),
                Wrap(
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
                ),
              ]),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 10 / 11),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              'assets/images/carosel-image-${index + 1}.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 130,
                          ),
                          Text(
                              'This is the description of the food with the name'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Price: ${(index + 1) * 1000} kyat'),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.greenAccent),
                                child: Icon(Icons.add_shopping_cart),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
