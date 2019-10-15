class QueryMutation {
  String addPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getAll() {
    return """ 
      {
        hello
      }
    """;
  }

  String checkSession(String sessionId, String clientId) {
    return """ 
      mutation {
        addClient(session: "$sessionId", client: "$clientId") 
      }
    """;
  }

  String deletePerson(id) {
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      } 
    """;
  }

  String editPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }    
     """;
  }
}
