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
        title: Card(
          child: Container(
            margin: EdgeInsets.only(bottom: 15, left: 5, right: 5),
            height: 20,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Icon(
                    Icons.search,
                    color: CustomColors.darkGrey,
                    size: 20.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Icon(
                    Icons.mic,
                    color: CustomColors.darkGrey,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        )
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
                                    color: CustomColors.cherry
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
                                                            fontSize: 12.0,
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
              margin: EdgeInsets.only(bottom: 4),
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
                                    color: CustomColors.cherry
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
              margin: EdgeInsets.only(bottom: 15, left: 18, top: 10),
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
            Container(
              child: SizedBox(
                  height: 120,
                  child: ListView.separated(
                      key: Key('recent reviews list'),
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                          height: 0,
                          color: Colors.transparent),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 410,
                          key: Key('recent reviews widget'),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.only(left: 6, bottom: 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(left: 20, bottom: 2),
                                                    child: CircleAvatar(
                                                      radius: 25,
                                                      backgroundImage: NetworkImage('https://i.stack.imgur.com/kdrpp.png'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                            'Walter White',
                                                            style: TextStyle(
                                                                color: CustomColors.black,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold
                                                            )
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: 14, top: 1),
                                                          child: Text(
                                                              'Restaurant Forsage',
                                                              style: TextStyle(
                                                                color: CustomColors.darkGrey,
                                                                fontSize: 12,
                                                              )
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: new EdgeInsets.symmetric(horizontal: 22.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                              Icons.star,
                                              color: CustomColors.yellow,
                                              size: 22.0
                                          ),
                                          Icon(
                                              Icons.star,
                                              color: CustomColors.yellow,
                                              size: 22.0
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: CustomColors.yellow,
                                            size: 22.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: CustomColors.yellow,
                                            size: 22.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: CustomColors.yellow,
                                            size: 22.0,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 250,
                                      margin: EdgeInsets.only(top: 6, left: 45, right: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'This is the best place I’ve ever seen.'
                                            'The stuff is so polite and fabulous,'
                                            'location of this place is incredible.'
                                            'I’m definetely coming back!',
                                        style: TextStyle(
                                            color: CustomColors.darkGrey,
                                            fontSize: 12
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: FlatButton(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 35, right: 5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(right: 5.0),
                                                child: Text(
                                                    'Forsage',
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: CustomColors.cherry
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
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
