import 'package:uuid/uuid.dart';

class SessionData {
  String userId;
  String trapezzaId;

  SessionData() {
    userId = Uuid().v4();

    print("USER_ID: $userId");

    trapezzaId = "";
  }
}
