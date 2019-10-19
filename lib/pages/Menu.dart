import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  MenuState createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  final List<String> menu = <String>['Salads', 'Pizza', 'Item4', 'Item4', 'Item4', 'Item4'];
  final List<String> featuredItems = <String>[
    'http://xobi.com.ua/uploads/posts/2011-12/1322748249_bf.jpg',
    'https://img1.liveinternet.ru/images/attach/d/0/139/886/139886699_RRSSRSR_RRRRRSSRR_SRSR_5.jpg',
    'https://live.staticflickr.com/2899/33441231301_7c610f4934_b.jpg',
    'https://www.instagram.com/p/BvoI8S0FVuV/media/?size=m'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
                'Featured items:',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
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
            height: 30,
            margin: EdgeInsets.only(left: 14, right: 14, top: 16),
            alignment: Alignment.topLeft,
            child: FlatButton(
              onPressed: () {print("View all");},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      'Menu',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold
                      ),
                      maxLines: 1),
                  Text(
                      'View all',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.redAccent
                      ),
                      maxLines: 1),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              key: Key('menu'),
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.black),
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.black,
                  child: EntryItem(data[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
          title: Text(root.title)
      );
    }

    return Container(
      color: Colors.white,
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

final List<Entry> data = <Entry>[
  Entry(
    'Salads',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    "Pizza's",
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    "Breakfast",
    <Entry>[
      Entry('Hawaiian Breakfast'),
      Entry('Bacon and Egg'),
    ],
  ),
  Entry(
    "Dinner",
    <Entry>[
      Entry('Thai Chicken Dinner'),
      Entry('Beef Stew Dinner'),
    ],
  ),
  Entry(
    "Breakfast",
    <Entry>[
      Entry('Hawaiian Breakfast'),
      Entry('Bacon and Egg'),
    ],
  ),
  Entry(
    "Lunch",
    <Entry>[
      Entry('Thai Chicken Lunch'),
      Entry('Beef Stew Lunch'),
    ],
  ),
  Entry(
    'Soups',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];