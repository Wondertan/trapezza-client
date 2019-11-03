class Subscriptions {
  static final String opSessionUpdates = "sessionUpdates";

  static String onSessionUpdates() {
    return '''
    subscription $opSessionUpdates{
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
  }

  static final String opRestaurantEvents = "restaurantEvents";

  static String onRestaurantEvents() {
    return '''
    subscription $opRestaurantEvents{
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
  }
}
