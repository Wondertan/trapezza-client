import 'package:flutter/material.dart';
import 'package:trapezza_client_app/pages/Checkout.dart';
import 'package:trapezza_client_app/pages/CurrentRestaurant.dart';
import 'package:trapezza_client_app/pages/Events.dart';
import 'package:trapezza_client_app/pages/Friends.dart';
import 'package:trapezza_client_app/pages/Profile.dart';
import 'package:trapezza_client_app/pages/RequestWaiter.dart';
import 'package:trapezza_client_app/pages/Restaurants.dart';
import 'package:trapezza_client_app/pages/SplashScreen.dart';

class AppInitializer extends StatefulWidget {
  AppInitializerState createState() => AppInitializerState();
}

class AppInitializerState extends State<AppInitializer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/request_waiter': (context) => RequestWaiter(),
        '/checkout': (context) => Checkout(),
        },
        home: SplashScreen()
    );
  }
}