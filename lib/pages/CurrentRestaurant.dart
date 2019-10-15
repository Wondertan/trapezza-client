import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trapezza_client_app/pages/Menu.dart';
import 'package:trapezza_client_app/pages/MyBill.dart';
import 'package:trapezza_client_app/pages/Participants.dart';

class CurrentRestaurant extends StatefulWidget {
  CurrentRestaurantState createState() {
    return CurrentRestaurantState();
  }
}

class CurrentRestaurantState extends State<CurrentRestaurant> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Best place in town',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18.0),
                            maxLines: 2),
                        ),
                        Container(
                          padding: new EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Location 1, Odessa, UA',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0),
                              maxLines: 2),
                        ),
                        Container(
                          padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 24.0
                              ),
                              Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 24.0
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                              ),
                              Container(
                                padding: new EdgeInsets.symmetric(horizontal: 8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                    '(5 reviews)',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14.0),
                                    maxLines: 1),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: new EdgeInsets.symmetric(horizontal: 8.0),
                      child: RawMaterialButton(
                        fillColor: Colors.deepOrangeAccent,
                        child: Text(
                          'Request waiter',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16.0),
                          maxLines: 2),
                        shape: CircleBorder(),
                        elevation: 0.0,
                        onPressed: (){},
                      ),
                    )
                  ),
                )
              ],
            )
          ),

          Expanded(
            child: Container(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                      bottom: TabBar(
                        tabs: [
                          Tab(text: 'Menu'),
                          Tab(text: 'My bill'),
                          Tab(text: 'Participants')
                        ],
                      )
                  ),
                  body: TabBarView(
                    children: [
                      Menu(),
                      MyBill(),
                      Participants()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}