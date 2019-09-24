import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../home_gift_theme.dart';

class ItemDetail extends StatefulWidget {
  final String name;

  ItemDetail({this.name});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final List<String> images = [
    'carosel-image-1.jpg',
    'carosel-image-2.jpg',
    'carosel-image-3.jpg',
    'carosel-image-4.jpg',
    'carosel-image-5.jpg'
  ];

  int quantity;

  upQty() {
    setState(() {
      quantity++;
    });
  }

  downQty() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  void initState() {
    quantity = 1;
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
              color: HomeGiftTheme.secondayColor,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  enableInfiniteScroll: false,
                  viewportFraction: 0.8,
                  height: 200.0,
                  enlargeCenterPage: true,
                  items: images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/$image',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('1500 MMK'),
                    Text('1 Kg'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Merchant'),
                    Text('Location'),
                  ],
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 30),
                ),
                Text(description),
                Text(
                  'Notice',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                    'If there is some information needed to be disclosed, we will put it here as notice. For example, expiration date.'),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Colors.green[300], Colors.green[100]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text(
                            'Quantity: $quantity',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                upQty();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: quantity > 1
                                  ? () {
                                      downQty();
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: HomeGiftTheme.primaryColor,
                      child: Row(
                        children: <Widget>[
                          Text('Add to cart'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.add_shopping_cart),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
