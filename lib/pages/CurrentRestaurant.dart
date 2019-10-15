import 'package:flutter/material.dart';

class CurrentRestaurant extends StatefulWidget {
  CurrentRestaurantState createState(){
    return CurrentRestaurantState();
  }
}

class CurrentRestaurantState extends State<CurrentRestaurant> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Text("Curr res"),
    );
  }
}