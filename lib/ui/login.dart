import 'package:assignment/Theme/Color.dart';
import 'package:assignment/ui/home.dart';
import 'package:assignment/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameControlller = new TextEditingController();
  TextEditingController _passwordControlller = new TextEditingController();
  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
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
                isValidate: _validate
              ),
              buildSpaceWidget(height: 5.0),
              roundShapeEditText(
                context: context,
                hintText: 'Password',
                myController: _passwordControlller,
                type: TextInputType.visiblePassword,
                isValidate: _validate
              ),
              buildSpaceWidget(height: 20.0),
              roundShapeButton(
                  buttonClick: _onSubmitClick,
                  buttonColor: baseColor,
                  buttonText: "Submit".toUpperCase(),
                  context: context,
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    ));
  }

  _onSubmitClick() {
    final form = _formKey.currentState;
    if (form.validate()) {
      print('form is valid');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }else
    {
        print('form is invalid');
    }
    
  }
}
