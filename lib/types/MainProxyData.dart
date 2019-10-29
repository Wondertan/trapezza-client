import 'package:trapezza_client_app/types/SessionData.dart';

class MainProxyData {
  SessionData _sessionData;

  MainProxyData() {
    _sessionData = SessionData();
  }

  SessionData get sessionData => _sessionData;
}
