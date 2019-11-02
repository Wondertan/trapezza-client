import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trapezza_client_app/pages/Menu.dart';
import 'package:trapezza_client_app/pages/Review.dart';
import 'package:trapezza_client_app/pages/Bill.dart';

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

    // 2 - number of the tab "Menu", opening by default
    _tabController.animateTo(2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
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
                      padding: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              'Best place in town',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2),
                        ],
                      )
                    ),
                    Container(
                      padding: new EdgeInsets.symmetric(horizontal: 25.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                          'Location 1, Odessa, UA',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey
                          ),
                          maxLines: 2),
                    ),
                    Container(
                      padding: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
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
                            padding: new EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                                '(5 reviews)',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey
                                ),
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
              width: 95,
              height: 95,
              margin: new EdgeInsets.only(right: 25),
              child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: RawMaterialButton(
                      fillColor: Color(0xfff40c00),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 8.0
                          ),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                                Icons.call_end,
                                color: Colors.white,
                                size: 25.0
                            ),
                            Text(
                                'Request Waiter',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0),
                                maxLines: 2)
                          ],
                        ),
                      ),
                      shape: CircleBorder(),
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/request_waiter');
                      },
                    ),
                  )
              ),
            )
          ],
        ),
        Container(
          height: 70,
          color: Color(0xFFF3F3F3),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xfff40c00),
            labelColor: Color(0xfff40c00),
            unselectedLabelStyle: TextStyle(
                color: Colors.green,
                decorationColor: Colors.grey
            ),
            //isScrollable: true,
            tabs: [
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.stars,
                          color: Color(0xfff40c00),
                          size: 25.0,
                        ),
                      ),
                      Container(
                        child: Text('Review'),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color(0xfff40c00),
                          size: 25.0,
                        ),
                      ),
                      Container(
                        child: Text('Bill'),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.local_dining,
                          color: Color(0xfff40c00),
                          size: 25.0,
                        ),
                      ),
                      Container(
                        child: Text('Menu'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Review(),
              Bill(),
              Menu(),
            ],
          ),
        )
      ],
    );
  }
}