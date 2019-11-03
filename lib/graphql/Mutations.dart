class Mutations {
  static String newGroup(String trapezzaId, String payerId) {
    return """
    mutation{
      newGroup(trapezza: "$trapezzaId", payer: "$payerId")
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
