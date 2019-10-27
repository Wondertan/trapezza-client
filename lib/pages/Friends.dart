import 'package:flutter/material.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class Friends extends StatefulWidget {
  FriendsState createState(){
    return FriendsState();
  }
}

class FriendsState extends State<Friends> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
            'Coming soon... : )',
            style: TextStyle(
              fontSize: 24,
              color: CustomColors.cherry
            )
        ),
      ),
    );
  }
}