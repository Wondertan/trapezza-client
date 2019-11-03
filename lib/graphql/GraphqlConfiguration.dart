import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink _httpLink = HttpLink(
    uri: 'http://192.168.0.116:8080/session',
  );

  ValueNotifier<GraphQLClient> httpClient = ValueNotifier(
    GraphQLClient(
      link: _httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: _httpLink,
    );
  }

  static final WebSocketLink _wsLink = WebSocketLink(
    url: 'ws://192.168.1.55:8080/query',
    config: SocketClientConfig(
      autoReconnect: true,
    ),
  );

  ValueNotifier<GraphQLClient> wsClient = ValueNotifier(
    GraphQLClient(
      link: _wsLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );
}