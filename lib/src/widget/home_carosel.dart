import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeCarosel extends StatelessWidget {
  final List<String> images = [
    'carosel-image-1.jpg',
    'carosel-image-2.jpg',
    'carosel-image-3.jpg',
    'carosel-image-4.jpg',
    'carosel-image-5.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 2),
      height: 200.0,
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.amber),
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.cover,
              ),
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
            );
          },
        );
      }).toList(),
    );
  }
}
