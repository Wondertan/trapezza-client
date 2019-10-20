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
