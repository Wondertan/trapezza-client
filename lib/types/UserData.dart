import 'package:uuid/uuid.dart';

class UserData {
  final String _userId = Uuid().v4();

  String get userId => _userId;
}
