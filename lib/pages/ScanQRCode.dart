import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:trapezza_client_app/properties/ButtonNames.dart';
import 'package:trapezza_client_app/proxies/MainProxy.dart';
import 'package:trapezza_client_app/types/MainProxyData.dart';
import 'package:trapezza_client_app/types/StatesWrapper.dart';

class ScanQRCode extends StatefulWidget {

  var updateJoinButton;

  ScanQRCode(this.updateJoinButton);

  @override
  ScanQRCodeState createState() => ScanQRCodeState();
}

class ScanQRCodeState extends State<ScanQRCode> {
  MainProxyData _mainProxyData;
  StatesWrapper _statesWrapper;

  @override
  Widget build(BuildContext context) {
    _mainProxyData = MainProxy.of(context).data;
    _statesWrapper = MainProxy.of(context).statesWrapper;

    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: scanQrCode,
                splashColor: Colors.blueGrey,
                child: const Text('START SCAN')),
          ),
        ],
      ),
    );
  }

  scanQrCode() {
    Future<String> futureString = new QRCodeReader()
        .setAutoFocusIntervalInMs(200) // default 5000
        .setForceAutoFocus(true) // default false
        .setTorchEnabled(true) // default false
        .setHandlePermissions(true) // default true
        .setExecuteAfterPermissionGranted(true) // default true
        .scan()
        .catchError((e){
          print(e);
      }
    );

    futureString.then((value) {
        setState(() {
            _mainProxyData.sessionData.qrCodeData = value;

            //addClient();
            _statesWrapper.scanQRCodeSuccessState.enter();
            widget.updateJoinButton(ButtonNames.checkout);
          }
        );
      }
    ).catchError((e) {
      print(e);
    });
  }
}
