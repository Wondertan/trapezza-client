import 'package:flutter/material.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class Events extends StatefulWidget {
  EventsState createState() {
    return EventsState();
  }
}

class EventsState extends State<Events> {
  final List<String> featuredItems = <String>[
    'http://xobi.com.ua/uploads/posts/2011-12/1322748249_bf.jpg',
    'https://img1.liveinternet.ru/images/attach/d/0/139/886/139886699_RRSSRSR_RRRRRSSRR_SRSR_5.jpg',
    'https://live.staticflickr.com/2899/33441231301_7c610f4934_b.jpg',
    'https://www.instagram.com/p/BvoI8S0FVuV/media/?size=m'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.cherry,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: FlatButton(
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Best offers',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: CustomColors.black,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 1),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            child: Text(
                                'View all',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.redAccent
                                ),
                                maxLines: 1
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xfff40c00),
                            size: 12.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.0),
              child: SizedBox(
                  height: 175,
                  child: ListView.separated(
                      key: Key('best offers'),
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                          height: 2,
                          color: Colors.transparent),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Card(
                                  elevation: 5.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Container(
                                      width: 170,
                                      height: 160,
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 170,
                                            height: 110,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(bottom: 15.0),
                                                    child: Text(
                                                        'Bloody Mary',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        )
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(bottom: 15.0),
                                                    child: Text(
                                                        '-20%',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage('https://www.gastronom.ru/binfiles/images/20171229/b54543d9.jpg'),
                                                fit: BoxFit.fill
                                              )
                                            ),
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 6),
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                        'Laungle bar "Sanset"',
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: CustomColors.darkGrey,
                                                            fontWeight: FontWeight.bold),
                                                        maxLines: 2),
                                                ),
                                                Container(
                                                  padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(
                                                          Icons.star,
                                                          color: CustomColors.yellow,
                                                          size: 11.0
                                                      ),
                                                      Icon(
                                                          Icons.star,
                                                          color: CustomColors.yellow,
                                                          size: 11.0
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: CustomColors.yellow,
                                                        size: 11.0,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: CustomColors.yellow,
                                                        size: 11.0,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: CustomColors.yellow,
                                                        size: 11.0,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                )
                            ),
                          ],
                        );
                      }
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6),
              child: FlatButton(
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Trending restaurants',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: CustomColors.black,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 1),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            child: Text(
                                'View all',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.redAccent
                                ),
                                maxLines: 1
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xfff40c00),
                            size: 12.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.0),
              child: SizedBox(
                  height: 175,
                  child: ListView.separated(
                      key: Key('trending restaurants'),
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                          height: 2,
                          color: Colors.transparent),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        width: 170,
                                        height: 160,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: 170,
                                              height: 100,
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        margin: EdgeInsets.only(bottom: 15.0),
                                                        child: Text(
                                                            'Bloody Mary',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold
                                                            )
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        margin: EdgeInsets.only(bottom: 15.0),
                                                        child: Text(
                                                            '-20%',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 14
                                                            )
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                              ),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage('https://www.gastronom.ru/binfiles/images/20171229/b54543d9.jpg'),
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 6),
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                          'Laungle bar "Sanset"',
                                                          textAlign: TextAlign.center,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: CustomColors.black,
                                                              fontWeight: FontWeight.bold),
                                                          maxLines: 2),
                                                  ),
                                                  Container(
                                                    padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                        'Odessa UA',
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 11.0,
                                                            color: CustomColors.darkGrey),
                                                        maxLines: 2),
                                                  ),
                                                  Container(
                                                    padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Icon(
                                                            Icons.star,
                                                            color: CustomColors.yellow,
                                                            size: 11.0
                                                        ),
                                                        Icon(
                                                            Icons.star,
                                                            color: CustomColors.yellow,
                                                            size: 11.0
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: CustomColors.yellow,
                                                          size: 11.0,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: CustomColors.yellow,
                                                          size: 11.0,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: CustomColors.yellow,
                                                          size: 11.0,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  elevation: 5.0
                                )
                            ),
                          ],
                        );
                      }
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6),
              child: FlatButton(
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Recent reviews',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: CustomColors.cherry,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 1)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
