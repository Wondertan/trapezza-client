import 'package:flutter/material.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class OrderPayed extends StatefulWidget {
  OrderPayedState createState(){
    return OrderPayedState();
  }
}

class OrderPayedState extends State<OrderPayed> {

  final List<String> featuredItems = <String>[
    'http://xobi.com.ua/uploads/posts/2011-12/1322748249_bf.jpg',
    'https://img1.liveinternet.ru/images/attach/d/0/139/886/139886699_RRSSRSR_RRRRRSSRR_SRSR_5.jpg',
    'https://live.staticflickr.com/2899/33441231301_7c610f4934_b.jpg',
    'https://www.instagram.com/p/BvoI8S0FVuV/media/?size=m'
  ];

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Container(
              child: Text('Trapezza #3012')
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: CustomColors.cherry,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.symmetric(vertical: 30),
              color: CustomColors.grey,
              child: Center(
                child: Text(
                  'Your bill is successfully paid',
                  style: TextStyle(
                      color: CustomColors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Scrollbar(
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              height: 0.4,
                              color: CustomColors.darkGrey,
                            ),
                        scrollDirection: Axis.vertical,
                        itemCount: featuredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Container(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage('https://www.gastronom.ru/binfiles/images/20171229/b54543d9.jpg'),
                                                                fit: BoxFit.cover
                                                            )
                                                        ),
                                                      )
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: 250,
                                                        height: 100,
                                                        child: ListTile(
                                                          title: Container(
                                                            child: Text(
                                                              'Pizza special',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ),
                                                          subtitle: Container(
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                  margin: EdgeInsets.symmetric(vertical: 10),
                                                                  child: Text(
                                                                    '2x chicken sahimi, 3x vegatables, 1x noodle',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: CustomColors.darkGrey
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        child: Text(
                                                                          '29',
                                                                          style: TextStyle(
                                                                              color: CustomColors.cherry,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Icon(
                                                                            Icons.attach_money,
                                                                            color: CustomColors.cherry,
                                                                            size: 18.0
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 8),
                                              alignment: Alignment.centerLeft,
                                              color: Colors.transparent,
                                              child: SizedBox(
                                                width: 200,
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(5.0),
                                                      side: BorderSide(color: CustomColors.whiteGrey)
                                                  ),
                                                  child: Text(
                                                      'Leave a review',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: CustomColors.whiteGrey
                                                      )
                                                  ),
                                                  onPressed: () {
                                                  },
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          );
                        }
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 0.4,
              color: CustomColors.darkGrey,
            ),
            Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.only(top: 25),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: CustomColors.darkGrey)
                  ),
                  child: Text(
                      'Leave a review about place',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: CustomColors.whiteGrey
                      )
                  ),
                  onPressed: () {
                  },
                )
            ),
            Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 25),
                child: RaisedButton(
                  color: CustomColors.cherry,
                  child: Text(
                      'NOT NOW',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}