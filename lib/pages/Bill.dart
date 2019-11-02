import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  BillState createState(){
    return BillState();
  }
}

class BillState extends State<Bill> {

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