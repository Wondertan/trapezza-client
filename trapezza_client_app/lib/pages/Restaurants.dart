import 'package:flutter/material.dart';

class Restaurants extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      scrollDirection: Axis.horizontal,

      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(

            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,

            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('He\'d have you all unravel at the'),
                color: Colors.green[100],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Heed not the rabble'),
                color: Colors.green[200],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Sound of screams but the'),
                color: Colors.green[300],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Who scream'),
                color: Colors.green[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution is coming...'),
                color: Colors.green[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution, they...'),
                color: Colors.green[600],
              ),
            ],
          ),
        ),
      ],
    );
  }
}