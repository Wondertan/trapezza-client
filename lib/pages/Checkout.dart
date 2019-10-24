import 'package:flutter/material.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class Checkout extends StatefulWidget {
  CheckoutState createState() {
    return CheckoutState();
  }
}

class CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
      child: Container(
          width: 300,
          height: 380,
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  width: 300,
                  height: 50,
                  color: CustomColors.grey,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Your total:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: <Widget>[
                              Text('41',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Roboto',
                                      color: CustomColors.cherry,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.attach_money,
                                  color: CustomColors.cherry, size: 35.0),
                            ],
                          )
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: 280,
                  height: 50,
                  child: RaisedButton(
                    child: Text('Pay via card',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: CustomColors.cherry,
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  child: Text('or',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          color: CustomColors.darkGrey,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: 280,
                  height: 50,
                  child: RaisedButton(
                    child: Text('Pay with cash',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    color: CustomColors.grey,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
      )
    );
  }
}
