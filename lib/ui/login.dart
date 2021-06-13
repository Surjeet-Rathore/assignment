import 'package:assignment/Theme/Color.dart';
import 'package:assignment/inherited_widget/app_inherited_widget.dart';
import 'package:assignment/scoped_model/app_model.dart';
import 'package:assignment/ui/home.dart';
import 'package:assignment/utils/SharedPrefs.dart';
import 'package:assignment/utils/common_widgets.dart';
import 'package:assignment/utils/const.dart';
import 'package:assignment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameControlller = new TextEditingController();
  TextEditingController _passwordControlller = new TextEditingController();
  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AppModel appModel;
  String _username, _password;

  @override
  void initState() {
    super.initState();

    getPref();

    Future.delayed(Duration.zero, () {
      if (_username != null && _password != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appModel = InjectInheritedWidget.of(context).appModel;
    return Scaffold(
        body: SafeArea(
            child: ScopedModel<AppModel>(
      model: appModel,
      child: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                buildSpaceWidget(height: 20.0),
                roundShapeEditText(
                    context: context,
                    hintText: 'Username',
                    myController: _usernameControlller,
                    type: TextInputType.text,
                    isValidate: _validate),
                buildSpaceWidget(height: 5.0),
                roundShapeEditTextPassword(
                    context: context,
                    hintText: 'Password',
                    myController: _passwordControlller,
                    type: TextInputType.visiblePassword,
                    isValidate: _validate),
                buildSpaceWidget(height: 20.0),
                roundShapeButton(
                    buttonClick: _onSubmitClick,
                    buttonColor:
                        appModel.getButtonVisibility ? baseColor : dimColor,
                    buttonText: "Submit".toUpperCase(),
                    context: context,
                    textColor: Colors.white),
              ],
            ),
          ),
        );
      }),
    )));
  }

  _onSubmitClick() {
    final form = _formKey.currentState;
    if (form.validate()) {
      appModel.setButtonBg(true);
      print("username ${_usernameControlller.text} password ${_password}");
      saveToSharedprefsString(prefUsername, _usernameControlller.text);
      saveToSharedprefsString(prefPassword, _passwordControlller.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      appModel.setButtonBg(false);
    }
  }

  void getPref() {
    SharedPrefs.initSharedPres().then((onValue) {
      SharedPrefs.getString(prefUsername).then((it) {
        _username = it;
        print("username $_username");
      });
    });

    SharedPrefs.initSharedPres().then((onValue) {
      SharedPrefs.getString(prefPassword).then((it) {
        _password = it;
        print("password $_password");
      });
    });
  }
}
