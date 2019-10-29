import 'package:trapezza_client_app/types/UserData.dart';

class SessionData {
  UserData _userData;
  String _qrCodeData;

  SessionData() {
    _userData = UserData();
    _qrCodeData = "";
  }

  String get qrCodeData => _qrCodeData;

  UserData get userData => _userData;

  set qrCodeData(String value) {
    _qrCodeData = value;
  }
}
