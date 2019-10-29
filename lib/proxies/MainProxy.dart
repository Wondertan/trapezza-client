import 'package:flutter/widgets.dart';
import 'package:trapezza_client_app/types/MainProxyData.dart';
import 'package:trapezza_client_app/types/StatesWrapper.dart';

class MainProxy extends InheritedWidget {
  final MainProxyData data;
  final joinButtonStateMachine;
  final StatesWrapper statesWrapper;

  MainProxy({
    this.data,
    this.joinButtonStateMachine,
    this.statesWrapper,
    Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(MainProxy oldWidget) => data != oldWidget.data;

  static MainProxy of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(MainProxy);
}
