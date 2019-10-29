import 'package:statemachine/statemachine.dart';

class StatesWrapper {
  Machine machine;
  State scanQRCodeActiveState;
  State scanQRCodeInActiveState;
  State scanQRCodeSuccessState;
  State scanQRCodeErrorState;
  State currentRestaurantState;
  State checkoutWaitingState;
  State checkoutSuccessState;

  StatesWrapper();

  initStates() {
    scanQRCodeActiveState = machine.newState("scanQRCodeActiveState");
    scanQRCodeInActiveState = machine.newState("scanQRCodeInActiveState");
    scanQRCodeSuccessState = machine.newState("scanQRCodeSuccessState");
    scanQRCodeErrorState = machine.newState("scanQRCodeErrorState");
    currentRestaurantState = machine.newState("currentRestaurantState");
    checkoutWaitingState = machine.newState("checkoutWaitingState");
    checkoutSuccessState = machine.newState("checkoutSuccessState");
  }
}
