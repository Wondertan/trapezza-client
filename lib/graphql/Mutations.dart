class Mutations {
  static String newGroupOrder(String trapezzaId, String payerId) {
    return """
    mutation{
      newGroupOrder(trapezza: "$trapezzaId", payer: "$payerId")
    }
    """;
  }

  static String waiterCall(String trapezzaId, String clietnId, String message) {
    return """
    mutation{
      waiterCall(trapezza: "$trapezzaId", client: "$clietnId", message: "$message")
    }
    """;
  }
}
