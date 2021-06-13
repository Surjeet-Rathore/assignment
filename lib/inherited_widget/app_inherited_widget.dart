import 'package:assignment/scoped_model/app_model.dart';
import 'package:flutter/material.dart';



class InjectInheritedWidget extends InheritedWidget {
  final Widget child;
  final AppModel appModel;

  InjectInheritedWidget({this.appModel, this.child}) : super(child: child);

  @override
  bool updateShouldNotify(InjectInheritedWidget oldWidget) => true;

  static InjectInheritedWidget of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InjectInheritedWidget);
}
