import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  ReviewState createState(){
    return ReviewState();
  }
}

class ReviewState extends State<Review> {
  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}