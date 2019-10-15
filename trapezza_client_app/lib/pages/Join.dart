import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:trapezza_client_app/graphql/GraphqlConfiguration.dart';
import 'package:trapezza_client_app/graphql/QueryMutation.dart';

class Join extends StatefulWidget {
  JoinState createState() {
    return JoinState();
  }
}

class JoinState extends State<Join> {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  String _qrCodeData = "";

  String scanQrCode() {
    Future<String> futureString = new QRCodeReader()
        .setAutoFocusIntervalInMs(200) // default 5000
        .setForceAutoFocus(true) // default false
        .setTorchEnabled(true) // default false
        .setHandlePermissions(true) // default true
        .setExecuteAfterPermissionGranted(true) // default true
        .scan();

    futureString.then((value) {
      print("qr-code value: $value");

      setState(() {
        _qrCodeData = value;
      });

      checkSession();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void checkSession() async {
    QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        document: queryMutation.checkSession("xx8ew1", "1234"),
      ),
    );

    if (result.hasErrors) {

      for(GraphQLError error in result.errors) {
        print(error.toString());
      }
    } else {
      bool isSessionValid = result.data["addClient"];

      print('session status: $isSessionValid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR Code Scanner'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: scanQrCode,
                    child: const Text('START SCAN')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Session code: $_qrCodeData",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
