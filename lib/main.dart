import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:trapezza_client_app/graphql/GraphqlConfiguration.dart';
import 'package:trapezza_client_app/utils/AppInitializer.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(
          GraphQLProvider(
            client: graphQLConfiguration.client,
            child: CacheProvider(child: AppInitializer()),
          ),
        );
      }
  );
}
