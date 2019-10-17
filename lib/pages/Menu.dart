import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<String> menu = <String>['Popular items', 'Salads', 'Pizza', 'Item4', 'Item4', 'Item4', 'Item4'];
  final List<String> featuredItems = <String>[
    'http://xobi.com.ua/uploads/posts/2011-12/1322748249_bf.jpg',
    'https://img1.liveinternet.ru/images/attach/d/0/139/886/139886699_RRSSRSR_RRRRRSSRR_SRSR_5.jpg',
    'https://live.staticflickr.com/2899/33441231301_7c610f4934_b.jpg',
    'https://www.instagram.com/p/BvoI8S0FVuV/media/?size=m'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          alignment: Alignment.topLeft,
          child: Text(
              'Featured items:',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0),
              maxLines: 1),
        ),
        Container(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
                key: Key('photos of popular items'),
                separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.transparent),
                scrollDirection: Axis.horizontal,
                itemCount: featuredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 100,
                          child: Image.network(
                            featuredItems[index],
                            width: 160,
                            fit: BoxFit.fill,
                          )
                      ),
                    ],
                  );
                }
            )
          )
        ),
        Container(
            margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
                'Menu',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.redAccent
                ),
                maxLines: 1)
        ),
        Expanded(
          child: ListView.separated(
            key: Key('menu'),
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.transparent),
            padding: const EdgeInsets.all(2),
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 45,
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(menu[index]),
                  dense: true,
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
