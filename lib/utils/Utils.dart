import 'package:flutter/material.dart';
import 'package:trapezza_client_app/popups/CommonPopup.dart';
import 'package:trapezza_client_app/popups/CommonPopupContent.dart';

showPopup(BuildContext context, Widget widget, String title,
    {BuildContext popupContext}) {
  Navigator.push(
    context,
    CommonPopup(
      top: 30,
      left: 30,
      right: 30,
      bottom: 30,
      child: CommonPopupContent(
        content: Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: new Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  try {
                    Navigator.pop(context); //close the popup
                  } catch (e) {
                    print(e);
                  }
                },
              );
            }),
            backgroundColor: Color(0xfff40c00),
            brightness: Brightness.light,
          ),
          resizeToAvoidBottomPadding: false,
          body: widget,
        ),
      ),
    ),
  );
}

showCheckoutPopup(BuildContext context, Widget widget, String title,
    {BuildContext popupContext}) {
  Navigator.push(
    context,
    CommonPopup(
      top: 150,
      left: 30,
      right: 30,
      bottom: 30,
      child: CommonPopupContent(
        content: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Container(
              alignment: Alignment.centerRight,
              color: Colors.transparent,
              child: RaisedButton(
                color: Colors.transparent,
                elevation: 0.0,
                child: Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.white
                ),
                onPressed: (){
                  try {
                    Navigator.pop(context); //close the popup
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            leading: Container(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            //brightness: Brightness.light,
          ),
          resizeToAvoidBottomPadding: false,
          body: Container(
            height: 420,
            alignment: Alignment.center,
            child: widget,
          ),
        ),
      ),
    ),
  );
}
