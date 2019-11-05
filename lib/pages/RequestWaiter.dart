import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:trapezza_client_app/graphql/Mutations.dart';
import 'package:trapezza_client_app/graphql/Subscriptions.dart';
import 'package:trapezza_client_app/utils/Accessor.dart';

import '../main.dart';

class RequestWaiter extends StatefulWidget {

  final Accessor _accessor;

  RequestWaiter(this._accessor);

  RequestWaiterState createState() {
    return RequestWaiterState();
  }
}

class RequestWaiterState extends State<RequestWaiter> {
  @override
  void initState() {
    widget._accessor.waiterStatesWrapper.callWaiterRequest.onEntry(() {
      callWaiter();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapezza #3012'),
        backgroundColor: Color(0xfff40c00),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 35),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(
                child: CircleAvatar(
              radius: 110.0,
              backgroundImage: NetworkImage(
                  "https://image.businessinsider.com/589dbb873149a101788b4c85?width=1100&format=jpeg&auto=webp"),
              backgroundColor: Colors.transparent,
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 80.0),
              child: Subscription(
                Subscriptions.opTrapezzaSessionUpdates,
                Subscriptions.onTrapezzaSessionUpdates(widget._accessor.sessionData.trapezzaId),
                builder: ({
                  bool loading,
                  dynamic payload,
                  dynamic error,
                }) {
                  if (widget._accessor.waiterMachine.current == widget._accessor.waiterStatesWrapper.callWaiterInit) {
                      widget._accessor.waiterStatesWrapper.callWaiterRequest.enter();
                  }

                  if (payload != null && payload["trapezzaSessionUpdates"]["event"].length != 0) {
                    print(payload);

                    return loadWaiterInfo('Waiter Casandra is coming to you');
                  } else {
                    print(payload);
                    return loadWaiterInfo('Summoning waiter...');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 80.0),
              child: Text(
                '00:31',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: 200,
        height: 40,
        child: RaisedButton(
          color: Color(0xfff40c00),
          child: Text(
              'CANCEL',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
              )
          ),
          onPressed: () {
            widget._accessor.waiterStatesWrapper.callWaiterInit.enter();
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget loadWaiterInfo(String data){
    return Text(
      data,
      style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey),
    );
  }

  callWaiter() async {
    GraphQLClient client = graphQLConfiguration.wsClient.value;

    QueryResult result = await client.mutate(
      MutationOptions(
        document: Mutations.waiterCall(widget._accessor.sessionData.trapezzaId, widget._accessor.sessionData.userId, ""),
      ),
    );

    if (result.hasErrors) {
      for (GraphQLError error in result.errors) {
        print(error.toString());
      }
    } else {
      bool isOk = result.data["waiterCall"];

      print('waiter call status: $isOk');
    }
  }
}
