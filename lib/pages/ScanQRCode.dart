import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:trapezza_client_app/graphql/Mutations.dart';
import 'package:trapezza_client_app/main.dart';
import 'package:trapezza_client_app/properties/ButtonNames.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';
import 'package:trapezza_client_app/statewrappers/JoinButtonStatesWrapper.dart';
import 'package:trapezza_client_app/utils/Accessor.dart';

class ScanQRCode extends StatefulWidget {
  final Accessor _accessor;
  final updateJoinButton;

  ScanQRCode(
      this._accessor,
      this.updateJoinButton);

  @override
  ScanQRCodeState createState() => ScanQRCodeState();
}

class ScanQRCodeState extends State<ScanQRCode> {
  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        .catchError((e) {
      print(e);
    });

    futureString.then((value) {
      setState(() {
        widget._accessor.sessionData.trapezzaId = value;

        print("TRAPEZZA_ID: $value");

        newGroupHandle(value);
      });
    }).catchError((e) {
      print(e);
    });
  }

  newGroupHandle(String trapezzaId) async {
    GraphQLClient client = graphQLConfiguration.wsClient.value;

    QueryResult result = await client.mutate(
      MutationOptions(
        document: Mutations.newGroupOrder(
            trapezzaId, widget._accessor.sessionData.userId),
      ),
    );

    if (result.hasErrors) {
      for (GraphQLError error in result.errors) {
        print(error.toString());

        widget._accessor.joinButtonStatesWrapper.scanQRCodeErrorState.enter();

        showSimpleNotification(
            Container(
              height: 50,
              child: Center(
                child: Text(
                  'Invalid TrapezzaId!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
              ),
            ),
          background: CustomColors.green
        );
      }
    } else {
      bool isOk = result.data["newGroupOrder"];

      print('new group status: $isOk');

      widget._accessor.joinButtonStatesWrapper.scanQRCodeSuccessState.enter();
      widget.updateJoinButton(ButtonNames.checkout);
    }
  }
}
