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

class CurrentRestaurantState extends State<CurrentRestaurant> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              'Best place in town',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18.0),
                              maxLines: 2),
                          Row(
                            children: <Widget>[
                              Icon(
                                  Icons.attach_money,
                                  color: Colors.black,
                                  size: 20
                              ),
                              Icon(
                                  Icons.attach_money,
                                  color: Colors.black,
                                  size: 20
                              ),
                              Icon(
                                  Icons.attach_money,
                                  color: Colors.black,
                                  size: 20
                              )
                            ],
                          )
                        ],
                      )
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
              margin: new EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 5.0),
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
                      onPressed: () {},
                    ),
                  )
              ),
            )
          ],
        ),
        Container(
          color: Color(0xFFF3F3F3),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.redAccent,
            labelColor: Colors.redAccent,
            unselectedLabelStyle: TextStyle(
                color: Colors.green,
                decorationColor: Colors.black
            ),
            //isScrollable: true,
            tabs: [
              Tab(text: "Menu"),
              Tab(text: "My Bill"),
              Tab(text: "Participants")
            ],
          )
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Menu(),
              MyBill(),
              Participants()
            ],
          ),
        )
      ],
    );
  }
}