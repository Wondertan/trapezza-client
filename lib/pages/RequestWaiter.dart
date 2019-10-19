import 'package:flutter/material.dart';

class RequestWaiter extends StatefulWidget {
  RequestWaiterState createState() {
    return RequestWaiterState();
  }
}

class RequestWaiterState extends State<RequestWaiter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapezza #3012'),
        backgroundColor: Color(0xfff40c00),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 35),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(
                child: CircleAvatar(
              radius: 110.0,
              backgroundImage: NetworkImage(
                  "https://image.businessinsider.com/589dbb873149a101788b4c85?width=1100&format=jpeg&auto=webp"),
              backgroundColor: Colors.transparent,
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 80.0),
              child: Text(
                'Summoning waiter...',
                 style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              width: 250,
              height: 50,
              child: RaisedButton(
                  color: Color(0xfff40c00),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.blueGrey,
                  child: const Text('CANCEL')),
            )
          ],
        ),
      ),
    );
  }
}
