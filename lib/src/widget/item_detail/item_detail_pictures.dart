import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../appData.dart';
import '../../model/item.dart';

class ItemDetailPictures extends StatelessWidget {
  final Item item;
  ItemDetailPictures(this.item);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      enableInfiniteScroll: false,
      viewportFraction: 0.8,
      height: 200.0,
      enlargeCenterPage: true,
      items: item.images.length > 0
          ? item.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/item_placeholder.png',
                        image: '${AppData.imageHost}/${image.name}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList()
          : [Image.asset('assets/images/item_placeholder.png')],
    );
  }
}
