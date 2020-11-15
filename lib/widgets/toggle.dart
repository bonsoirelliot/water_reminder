import 'package:flutter/material.dart';
import '../style.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  List<bool> isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        children: <Widget>[
          Container(
            child: Text(
              'man',
              style: MediumTextStyle,
              textAlign: TextAlign.center,
            ),
            width: 130,
            height: 45,
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            child: Text(
              'woman',
              style: MediumTextStyle,
              textAlign: TextAlign.center,
            ),
            width: 130,
            height: 45,
            padding: EdgeInsets.only(top: 10),
          )
        ],
        fillColor: Color(0xFFFF1E56),
        disabledColor: Colors.white,
        selectedColor: Colors.transparent,
        renderBorder: false,
        isSelected: isSelected,
        borderRadius: BorderRadius.circular(50),
        onPressed: (int index) {
          setState(() {
            for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
              if (indexBtn == index) {
                isSelected[indexBtn] = !isSelected[indexBtn];
              } else {
                isSelected[indexBtn] = false;
              }
            }
          });
        });
  }
}