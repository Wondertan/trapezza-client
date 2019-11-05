import 'package:flutter/material.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';

class Review extends StatefulWidget {
  ReviewState createState(){
    return ReviewState();
  }
}

class ReviewState extends State<Review> {

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
      padding: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
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
                                                width: 90,
                                                height: 90,
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
                                          width: 275,
                                          height: 100,
                                            child: ListTile(
                                            title: Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      'Pizza special',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: <Widget>[
                                                            Icon(
                                                                Icons.star,
                                                                color: CustomColors.yellow,
                                                                size: 14.0
                                                            ),
                                                            Icon(
                                                                Icons.star,
                                                                color: CustomColors.yellow,
                                                                size: 14.0
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: CustomColors.yellow,
                                                              size: 14.0,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: CustomColors.yellow,
                                                              size: 14.0,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: CustomColors.yellow,
                                                              size: 14.0,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ],
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
        ],
      )
    );
  }
}