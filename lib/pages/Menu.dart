import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<String> entries = <String>['Popular items', 'Salads', 'Pizza'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            color: Colors.transparent,
            child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                          entries[index],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                          maxLines: 1),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 30.0,
                    )
                  ],
                )));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
