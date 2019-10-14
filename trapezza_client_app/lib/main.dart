import 'package:flutter/cupertino.dart';
import 'package:trapezza_client_app/app/AppState.dart';
import 'package:trapezza_client_app/graphql/GraphqlConfiguration.dart';
import 'package:trapezza_client_app/graphql/QueryMutation.dart';
import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() => runApp(
      GraphQLProvider(
        client: graphQLConfiguration.client,
        child: CacheProvider(child: App()),
      ),
    );
