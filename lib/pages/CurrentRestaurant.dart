import 'package:flutter/material.dart';
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
            height: 200,
            color: Colors.green,
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