import 'package:flutter/material.dart';
import 'package:trapezza_client_app/pages/Events.dart';
import 'package:trapezza_client_app/pages/Friends.dart';
import 'package:trapezza_client_app/pages/Join.dart';
import 'package:trapezza_client_app/pages/Profile.dart';
import 'package:trapezza_client_app/pages/Restaurants.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  AppState createState() => AppState();
}

class AppState extends State<App> {

  int _currentPageIndex = 0;

  Widget callPage() {

    switch (_currentPageIndex) {
      case 0: return Events();
      break;

      case 1: return Restaurants();
      break;

      case 2: return Join();
      break;

      case 3: return Friends();
      break;

      case 4: return Profile();
      break;

      default: return Restaurants();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'Trapezza',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Trapezza'),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
          ),

          body: callPage(),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.redAccent,
                primaryColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: Colors.black)
                )
            ),

            child: BottomNavigationBar(

              currentIndex: _currentPageIndex,

              type: BottomNavigationBarType.fixed,

              onTap: (value) {

                print(value);

                _currentPageIndex = value;

                setState(() {

                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_indent_increase),
                  title: Text('События'),
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    title: Text('Рестораны')
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.local_dining),
                    title: Text('Трапеза')
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline),
                    title: Text('Друзья')
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    title: Text('Профиль')
                )
              ],
            ),
          ),
        )
    );
  }
}