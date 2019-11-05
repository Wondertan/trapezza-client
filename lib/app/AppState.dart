import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trapezza_client_app/pages/Checkout.dart';
import 'package:trapezza_client_app/pages/CurrentRestaurant.dart';
import 'package:trapezza_client_app/pages/Events.dart';
import 'package:trapezza_client_app/pages/Friends.dart';
import 'package:trapezza_client_app/pages/Profile.dart';
import 'package:trapezza_client_app/pages/Restaurants.dart';
import 'package:trapezza_client_app/pages/ScanQRCode.dart';
import 'package:trapezza_client_app/properties/ButtonNames.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';
import 'package:trapezza_client_app/utils/Accessor.dart';
import 'package:trapezza_client_app/utils/CustomBottomAppBar.dart';
import 'package:trapezza_client_app/utils/Utils.dart';

class App extends StatefulWidget {

  final Accessor _accessor;

  App(this._accessor);

  AppState createState() => AppState();
}

class AppState extends State<App> {

  int _currentPageIndex = 0;
  String _joinButtonName;

  Widget callPage(BuildContext context) {
    switch (_currentPageIndex) {
      case 0: {
        if (widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState) {
            widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState.enter();
        }

        if(widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {
           widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();
        }

        return Events();
      }
      case 1: {
        if (widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState) {
            widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState.enter();
        }

        if(widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {
           widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();
        }

        return Restaurants();
      }
      case 2: {
        if (widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState) {
            widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState.enter();
        }

        if(widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {
           widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();
        }

        return Friends();
      }
      case 3: {
        if (widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState) {
            widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState.enter();
        }

        if(widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {
           widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();
        }

        return Profile();
      }
      case 4: return joinButtonHandler();
    }
  }

  updateJoinButton(value) {
    setState(() {
      _joinButtonName = value;
    });
  }

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  initState() {
    super.initState();

    widget._accessor.joinButtonStatesWrapper.checkoutWaitingState.onEntry(() {
      checkout().then((value) {
        widget._accessor.joinButtonStatesWrapper.checkoutSuccessState.enter();
        setState(() {
        });
      });
    });

    _joinButtonName = ButtonNames.join;
  }

  Future checkout() {
    return new Future.delayed(const Duration(seconds: 2), () {
    });
  }

  @override
  Widget build(BuildContext context) {

    widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState.onEntry(() {
      widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState.enter();
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Container(
              child: Text('Trapezza')
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: CustomColors.cherry,
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            checkoutPopupSwitcher();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 21),
            child: Column(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset(
                      'lib/assets/svg/join_icon.svg',
                      height: 22,
                      width: 22
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                      _joinButtonName,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: CustomColors.cherry,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: callPage(context),
      bottomNavigationBar: CustomBottomAppBar(
        accessor: widget._accessor,
        onTabSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
          CustomBottomAppBarItem(
              mText: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                      'Events',
                      style: TextStyle(
                          fontSize: 11
                      )
                  )
              )
          ),
          CustomBottomAppBarItem(
              mText: Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                    'Restaurants',
                    style: TextStyle(
                        fontSize: 11
                    )
                ),
              )
          ),
          CustomBottomAppBarItem(
              mText: Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                    'Friends',
                    style: TextStyle(
                        fontSize: 11
                    )
                ),
              )
          ),
          CustomBottomAppBarItem(
              mText: Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 11
                    )
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget joinButtonHandler() {

    Widget result = ScanQRCode(widget._accessor, updateJoinButton);

    if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.currentRestaurantState &&
        widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState) {

      widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState.enter();

      result = CurrentRestaurant();
    }

    if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.currentRestaurantState){
      result = CurrentRestaurant();
    }

    if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.checkoutSuccessState &&
        widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {

      widget._accessor.bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();

      updateJoinButton(ButtonNames.join);

      result = ScanQRCode(widget._accessor, updateJoinButton);
    }

    if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState) {

      widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState.enter();

    } else if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeSuccessState) {

      widget._accessor.joinButtonStatesWrapper.currentRestaurantState.enter();

      updateJoinButton(ButtonNames.checkout);

      result = CurrentRestaurant();
    } else if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.scanQRCodeErrorState) {

      widget._accessor.joinButtonStatesWrapper.scanQRCodeActiveState.enter();

    } else if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.checkoutSuccessState) {

      widget._accessor.joinButtonStatesWrapper.scanQRCodeInActiveState.enter();

      // back to the Events page
      setState(() {
        _currentPageIndex = 0;
      });
    } else if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.checkoutWaitingState) {
      result = CurrentRestaurant();
    }

    return result;
  }

  checkoutPopupSwitcher() {
    if(widget._accessor.joinButtonStateMachine.current == widget._accessor.joinButtonStatesWrapper.currentRestaurantState &&
       widget._accessor.bottomNavBarStateMachine.current == widget._accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState) {

      showCheckoutPopup(context, Checkout(widget._accessor), '');
    } else {
      setState(() {
        _currentPageIndex = 4;
      });
    }
  }
}