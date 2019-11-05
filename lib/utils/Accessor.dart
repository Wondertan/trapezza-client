import 'package:statemachine/statemachine.dart' as stMachine;
import 'package:trapezza_client_app/statewrappers/BottomNavBarStatesWrapper.dart';
import 'package:trapezza_client_app/statewrappers/JoinButtonStatesWrapper.dart';
import 'package:trapezza_client_app/statewrappers/WaiterStatesWrapper.dart';
import 'package:trapezza_client_app/types/SessionData.dart';

enum callType {
  cash,
  card
}

class Accessor{
  stMachine.Machine joinButtonStateMachine;
  JoinButtonStatesWrapper joinButtonStatesWrapper;

  stMachine.Machine bottomNavBarStateMachine;
  BottomNavBarStatesWrapper bottomNavBarStatesWrapper;

  stMachine.Machine waiterMachine;
  WaiterStatesWrapper waiterStatesWrapper;

  SessionData sessionData;

  callType waiterCallType;

  Accessor(){
    sessionData = SessionData();

    joinButtonStateMachine = stMachine.Machine();
    joinButtonStatesWrapper = JoinButtonStatesWrapper();

    joinButtonStatesWrapper.machine = joinButtonStateMachine;
    joinButtonStatesWrapper.initStates();
    joinButtonStateMachine.start();

    bottomNavBarStateMachine = stMachine.Machine();
    bottomNavBarStatesWrapper = BottomNavBarStatesWrapper();

    bottomNavBarStatesWrapper.machine = bottomNavBarStateMachine;
    bottomNavBarStatesWrapper.initStates();
    bottomNavBarStateMachine.start();

    waiterMachine = stMachine.Machine();
    waiterStatesWrapper = WaiterStatesWrapper();

    waiterStatesWrapper.machine = waiterMachine;
    waiterStatesWrapper.initStates();
    waiterMachine.start();

    waiterStatesWrapper.callWaiterInit.enter();

    bottomNavBarStatesWrapper.bottomNavBarActiveState.enter();
    joinButtonStatesWrapper.scanQRCodeInActiveState.enter();
  }
}