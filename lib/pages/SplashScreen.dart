import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trapezza_client_app/app/AppState.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';
import 'package:trapezza_client_app/utils/Accessor.dart';

class SplashScreen extends StatefulWidget {

  final Accessor _accessor;

  SplashScreen(this._accessor);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1500),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => App(widget._accessor))));
  }

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
        child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 150),
                child: Center(
                  child: SvgPicture.asset('lib/assets/svg/splash_icon.svg'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 100, bottom: 10),
                  child: Text(
                      'TrapeZza',
                      style: TextStyle(
                          color: CustomColors.cherry,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SpinKitThreeBounce(
                  itemBuilder: (_, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: CustomColors.cherry,
                      ),
                    );
                  },
                  size: 25.0,
                ),
              )
            ]
        ),
      ),
    );
  }
}