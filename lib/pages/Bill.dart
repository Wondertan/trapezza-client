import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class Bill extends StatefulWidget {
  BillState createState(){
    return BillState();
  }
}

class BillState extends State<Bill> {

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
    return Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          height: 0.4,
                          color: Colors.transparent,
                        ),
                    scrollDirection: Axis.vertical,
                    itemCount: featuredItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            color: CustomColors.grey,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage('https://i.stack.imgur.com/XPOr3.png'),
                                radius: 25,
                              ),
                              title: Text(
                                  'David Arthur',
                                  style: TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              subtitle: Text(
                                '2 items',
                                style: TextStyle(
                                    color: CustomColors.darkGrey
                                ),
                              ),
                              trailing:
                              SvgPicture.asset(
                                  'lib/assets/svg/plus_people_bill_icon.svg',
                                  height: 18,
                                  width: 18
                              ),
                              onTap: () {
                              },
                            ),
                          ),
                          getOrder(),
                          getOrder(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            alignment: Alignment.centerLeft,
                            color: CustomColors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                      'My total:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                      )
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'paid',
                                    style: TextStyle(
                                        color: CustomColors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    )
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                            '29',
                                            style: TextStyle(
                                              color: CustomColors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            )
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                            Icons.attach_money,
                                            color: CustomColors.green,
                                            size: 20.0
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          )
                        ],
                      );
                    }
                )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 0.4,
              color: CustomColors.darkGrey,
            ),
            Container(
                width: 300,
                height: 40,
                margin: EdgeInsets.only(top: 25, bottom: 60),
                child: RaisedButton(
                  color: CustomColors.cherry,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      //side: BorderSide(color: CustomColors.darkGrey)
                  ),
                  child: Text(
                      'Pay for all',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white
                      )
                  ),
                  onPressed: () {
                  },
                )
            ),
          ],
        )
    );
  }

  Widget getOrder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  width: 60,
                  height: 60,
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
            width: 305,
            height: 70,
            child: ListTile(
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Pizza special',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <
                            Widget>[
                          Container(
                            child: Text(
                              '29',
                              style: TextStyle(
                                  color: CustomColors.darkGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                                Icons.attach_money,
                                color: CustomColors.darkGrey,
                                size: 16.0
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 250,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '2x chicken sahimi, 3x vegatables, 1x noodle',
                        maxLines: 2,
                        style: TextStyle(
                            color: CustomColors.darkGrey
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}