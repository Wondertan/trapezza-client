import 'package:statemachine/statemachine.dart';

class WaiterStatesWrapper{
  Machine machine;

  State callWaiterInit;
  State callWaiterRequest;
  State callWaiterResponse;

  initStates(){
    callWaiterInit = machine.newState("callWaiterInit");
    callWaiterRequest = machine.newState("callWaiterRequest");
    callWaiterResponse = machine.newState("callWaiterResponse");
  }
}