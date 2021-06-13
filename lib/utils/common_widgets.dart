// for space b/w widgets
import 'package:assignment/Theme/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildSpaceWidget({double height}) {
  return SizedBox(
    height: height,
  );
}

roundShapeEditText(
    {BuildContext context,
      String hintText,
      TextEditingController myController,
      TextInputType type,
      bool isValidate
      }) {
  return Container(
    width: MediaQuery.of(context).size.width - 20,
    child: TextFormField(
      decoration: new InputDecoration(
        focusColor: bgColor,
        hoverColor: bgColor,
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.black45),
          hintText: hintText,
          fillColor: Colors.white70,
          contentPadding:
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0)),
      controller: myController,
      maxLength: 10,
      validator: (value) {
        return value.isEmpty ? 'Please enter $hintText' : value.length < 3 || value.length > 10 ? "$hintText's length should be min 3 and max 10 characters" : null;
      },
      keyboardType: type,
    ),
  );
}

roundShapeButton(
    {BuildContext context,
      Function buttonClick,
      String buttonText,
      Color textColor,
      Color buttonColor}) {
  return Container(
    width: MediaQuery.of(context).size.width - 20,
    height: 50.0,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: buttonColor)),
      onPressed: () {
        buttonClick();
      },
      color: buttonColor,
      textColor: textColor,
      child: buildTextWidget(text: buttonText,textColor: Colors.white,fontSize: normalText),
    ),
  );
}

Widget buildTextWidget({String text, Color textColor,double fontSize}) {
  return Text(
    text,
    style: TextStyle(color: textColor, fontSize: fontSize),
    textAlign: TextAlign.center,
  );
}

Widget buildBoldTextWidget({String text, Color textColor,double fontSize}) {
  return Text(
    text,
    style: TextStyle(color: textColor, fontSize: fontSize,fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Future<bool> toast(String msg) {
  return Fluttertoast.showToast(msg: msg);
}

buildRoundShapeCardWidget(
    {double height,
    double width,
    Color color,
    Widget child,
    double radius,
    double padding}) {
  return Container(
    padding: padding != null ? EdgeInsets.all(padding) : EdgeInsets.all(0.0),
    height: height,
    width: width,
    child: Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      color: color,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: child,
      ),
    ),
    margin: EdgeInsets.all(1.0),
  );
}
