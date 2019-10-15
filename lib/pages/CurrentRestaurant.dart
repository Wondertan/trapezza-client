import 'package:flutter/material.dart';
import 'package:trapezza_client_app/pages/Menu.dart';
import 'package:trapezza_client_app/pages/MyBill.dart';
import 'package:trapezza_client_app/pages/Participants.dart';

class CurrentRestaurant extends StatefulWidget {
  CurrentRestaurantState createState() {
    return CurrentRestaurantState();
  }
}

class CurrentRestaurantState extends State<CurrentRestaurant> with TickerProviderStateMixin {

  double screenSize;
  double screenRatio;
  int _currentPageIndex = 0;
  AppBar appBar;
  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {

    tabList.add(Tab(text: 'Menu'));
    tabList.add(Tab(text: 'My bill'));
    tabList.add(Tab(text: 'Participants'));

    _tabController = new TabController(vsync: this, length: tabList.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size.width;
    appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );

    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.transparent,
          ),

          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: Stack(
              children: <Widget>[
                Positioned(
                  width: screenSize,
                  top: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: new Column(
                      key: Key("tabBarColumn"),
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
                          child: new TabBar(
                              controller: _tabController,
                              indicatorColor: Colors.pink,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: tabList,
                              onTap: (value) {
                                setState(() {
                                  _currentPageIndex = value;
                                });
                              },
                          ),
                        ),
                        new Container(
                          height: 20.0,
                          child: new TabBarView(
                            controller: _tabController,
                            children: tabList.map((Tab tab){
                              return _getPage();
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getPage() {
    switch(_currentPageIndex){
      case 0: return Menu();
      case 1: return MyBill();
      case 2: return Participants();
    }
  }
}