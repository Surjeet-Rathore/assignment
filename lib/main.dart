import 'package:assignment/Theme/Color.dart';
import 'package:assignment/scoped_model/app_model.dart';
import 'package:assignment/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'inherited_widget/app_inherited_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AppModel _model = AppModel();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return InjectInheritedWidget(
      appModel: _model,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Roboto-Regular",
            cursorColor: baseColor,
            primaryColor: baseColor),
        home: Login(),
      ),
    );
  }
}
