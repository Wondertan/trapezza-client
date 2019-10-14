import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class Join extends StatefulWidget {
  JoinState createState(){
    return JoinState();
  }
}

class JoinState extends State<Join> {

  String scanQrCode(){
    Future<String> futureString = new QRCodeReader()
        .setAutoFocusIntervalInMs(200) // default 5000
        .setForceAutoFocus(true) // default false
        .setTorchEnabled(true) // default false
        .setHandlePermissions(true) // default true
        .setExecuteAfterPermissionGranted(true) // default true
        .scan();
    
    futureString.then((value) {
      print("qr-code value: $value");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: FlatButton(
        onPressed: () {
          scanQrCode();
        },
        child: Text(
          "Scan Qr",
        ),
      )
    );
  }
}