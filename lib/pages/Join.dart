import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:qrcode_reader/qrcode_reader.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:trapezza_client_app/graphql/GraphqlConfiguration.dart';
import 'package:trapezza_client_app/graphql/QueryMutation.dart';
import 'package:trapezza_client_app/pages/CurrentRestaurant.dart';

class Join extends StatefulWidget {
  JoinState createState() {
    return JoinState();
  }
}

class JoinState extends State<Join> {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  bool isResVisible = false;

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

      addClient();
    });
  }

  @override
  void initState() {
    super.initState();
  }

//  void addClient() {
//    QueryMutation queryMutation = QueryMutation();
//    GraphQLClient _client = graphQLConfiguration.clientToQuery();
//    Future<QueryResult> result = _client.mutate(
//      MutationOptions(
//        document: queryMutation.checkSession(_qrCodeData, "1234"),
//      ),
//    );
//
//    result.then((result) {
//      if (result.hasErrors) {
//
//        for(GraphQLError error in result.errors) {
//
//          String e = error.toString();
//          print('GRAPHQL ERRORS: $e');
//        }
//      } else {
//        bool isSessionValid = result.data["addClient"];
//
//        print('session status: $isSessionValid');
//      }
//    });
//  }

  void addClient() async {
    QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        document: queryMutation.checkSession(_qrCodeData, "1234"),
      ),
    );

    if (result.hasErrors) {

      for(GraphQLError error in result.errors) {
        print(error.toString());
      }
    } else {
      bool isSessionValid = result.data["addClient"];

      print('session status: $isSessionValid');

      setState(() {
        isResVisible = isSessionValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR Code Scanner'),
        ),
        body: switchPage());
  }

  Widget switchPage() {

    Widget currentRestaurant = CurrentRestaurant();

    Widget qrCodeScan = Center(
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
    );

    return isResVisible ? currentRestaurant : qrCodeScan;
  }
}