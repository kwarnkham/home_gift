import 'package:flutter/material.dart';
import '../../model/item.dart';
import '../../appData.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../bloc/item_bloc.dart';
import '../../ui/item_detail.dart';

class HomeItems extends StatefulWidget {
  @override
  _HomeItemsState createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  itemDetail(context, name) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ItemDetail(
              name: name,
            )));
  }

  @override
  void initState() {
    itemBloc.getItems();
    super.initState();
  }

  @override
  void dispose() {
    itemBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Item>>(
        stream: itemBloc.items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SliverGrid(
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
                            child: GestureDetector(
                                onTap: () {
                                  itemDetail(
                                      context, snapshot.data[index].name);
                                },
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: snapshot.data[index].images.length > 0
                                      ? '${AppData.imageHost}/${snapshot.data[index].images[0].name}'
                                      : '${AppData.imageHost}/image-1.jpg',
                                  fit: BoxFit.cover,
                                )),
                            height: 130,
                          ),
                          Text(
                            '${snapshot.data[index].name} ${snapshot.data[index].description}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Price: ${snapshot.data[index].price} kyat'),
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
                childCount: snapshot.data.length,
              ),
            );
          }
          return SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ]),
          );
        });
  }
}
