import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trapezza_client_app/pages/CurrentRestaurant.dart';
import 'package:trapezza_client_app/pages/Events.dart';
import 'package:trapezza_client_app/pages/Friends.dart';
import 'package:trapezza_client_app/pages/Profile.dart';
import 'package:trapezza_client_app/pages/RequestWaiter.dart';
import 'package:trapezza_client_app/pages/Restaurants.dart';
import 'package:trapezza_client_app/pages/SplashScreen.dart';

import 'Accessor.dart';

class AppInitializer extends StatefulWidget {

  final Accessor _accessor = Accessor();

  AppInitializerState createState() => AppInitializerState();
}

class AppInitializerState extends State<AppInitializer> {
  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {

    return OverlaySupport(
      child: MaterialApp(
          title: 'Trapezza',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/events': (context) => Events(),
            '/restaurants': (context) => Restaurants(),
            '/events': (context) => Events(),
            '/friends': (context) => Friends(),
            '/profile': (context) => Profile(),
            '/current_restaurant': (context) => CurrentRestaurant(),
            '/request_waiter': (context) => RequestWaiter(widget._accessor)
          },
          home: SplashScreen(widget._accessor)
      ),
    );
  }
}