import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql/internal.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_lib;
import 'package:trapezza_client_app/graphql/GraphqlConfiguration.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      graphql_lib.GraphQLProvider(
        client: graphQLConfiguration.wsClient,
        child: graphql_lib.CacheProvider(child: MyApp()),
      ),
    );
  }
  );
}


class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  final String subscribeQuery = '''
    subscription test{
      updates(id: "DHY1e"){
        event{
          ... on NewGroupEvent {
            trapezza,
            payer,
            type
          }
        }
      }
    }
    ''';

  Stream<FetchResult> stream;
  Operation operation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    operation = Operation(document: subscribeQuery, operationName: 'test');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
              color: Colors.transparent,
              width: 300,
              height: 300,
              child: Center(
                child: graphql_lib.Subscription(
                  "test",
                  subscribeQuery,
                  builder: ({
                    bool loading,
                    dynamic payload,
                    dynamic error,
                  }) {
                    if (payload != null) {

                      print(payload);

                      return Expanded(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Text(payload['updates']['event']['payer']),
                        ),
                      );
                    } else {
                      print(payload);

                      return Text("Fetching Online Users");
                    }
                  },
                ),
              ),
            )
        )
    );
  }
}


//Center(
//child: graphql_lib.GraphQLConsumer(
//builder: (GraphQLClient client) {
//
//stream = client.subscribe(operation);
//stream.listen((onData) {
//print(onData);
//});
//
//
//return Container(
//width: 300,
//height: 300,
//child: Text(
//'DATA NOT FOUND',
//style: TextStyle(
//fontSize: 20,
//color: Colors.black
//),
//)
//);
//},
//),
//)

// notifications
//import 'package:flutter/material.dart';
//import 'package:graphql_flutter/graphql_flutter.dart';
//import 'package:overlay_support/overlay_support.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  bool isShow = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return OverlaySupport(
//        child: MaterialApp(
//          home: new Scaffold(
//              appBar: new AppBar(
//                title: const Text('Plugin example app'),
//              ),
//              body: Column(
//                children: <Widget>[
//                  Container(
//                      width: 300,
//                      height: 300,
//                      margin: EdgeInsets.only(top: 300),
//                      child: Container(
//                        margin: EdgeInsets.only(top: 150),
//                        width: 100,
//                        height: 40,
//                        child: FlatButton(
//                          onPressed: () {
//                            showSimpleNotification(
//                                Text(
//                                    "this is a message from simple notification"),
//                                background: Colors.green);
//                          },
//                          child: Text('Test'),
//                        ),
//                      )
//                  ),
//
//                ],
//              )
//          ),
//        )
//    );
//  }
//}
//
//
//
//class MessageNotification extends StatelessWidget {
//  final VoidCallback onReplay;
//
//  const MessageNotification({Key key, this.onReplay}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      margin: const EdgeInsets.symmetric(horizontal: 4),
//      child: SafeArea(
//        child: ListTile(
//          leading: SizedBox.fromSize(
//              size: const Size(40, 40),
//              child: ClipOval(child: Image.asset('assets/avatar.png'))),
//          title: Text('Lily MacDonald'),
//          subtitle: Text('Do you want to see a movie?'),
//          trailing: IconButton(
//              icon: Icon(Icons.reply),
//              onPressed: () {
//                ///TODO i'm not sure it should be use this widget' BuildContext to create a Dialog
//                ///maybe i will give the answer in the future
//                if (onReplay != null) onReplay();
//              }),
//        ),
//      ),
//    );
//  }
//}
//
//class IosStyleToast extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: DefaultTextStyle(
//        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
//        child: Padding(
//          padding: const EdgeInsets.all(16),
//          child: Center(
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(10),
//              child: Container(
//                color: Colors.black87,
//                padding: const EdgeInsets.symmetric(
//                  vertical: 8,
//                  horizontal: 16,
//                ),
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Icon(
//                      Icons.check,
//                      color: Colors.white,
//                    ),
//                    Text('Succeed')
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}