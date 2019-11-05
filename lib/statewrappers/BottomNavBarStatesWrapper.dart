import 'package:statemachine/statemachine.dart';

class BottomNavBarStatesWrapper {
  Machine machine;
  State bottomNavBarActiveState;
  State bottomNavBarInActiveState;

  initStates() {
    bottomNavBarActiveState = machine.newState("bottomNavBarActiveState");
    bottomNavBarInActiveState = machine.newState("bottomNavBarInActiveState");
  }
}
