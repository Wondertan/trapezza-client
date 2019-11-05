class Subscriptions {
  static final String opTrapezzaSessionUpdates = "sessionUpdates";

  static String onTrapezzaSessionUpdates(String trapezzaId) {
    return '''
    subscription $opTrapezzaSessionUpdates{
      trapezzaSessionUpdates(id: "$trapezzaId"){
        event{
          ... on WaiterCallAnswer {
            waiter
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
