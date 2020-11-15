import 'package:flutter/material.dart';
import 'package:water_reminder/style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 6.0,
        color: Color(0xFFFF1E56),
        borderRadius: BorderRadius.circular(50.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 260.0,
          height: 45.0,
          child: Text(
            text,
            style: MediumTextStyle,
          ),
        ),
      ),
    );
  }
}