import 'package:flutter/material.dart';
import 'package:water_reminder/style.dart';

class StatusBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'daily goal',
              style: HomePageTextStyle,
            ),
            Text(
              '12',
              style: HomePageValueTextStyle,
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: <Widget>[
            Text(
              'completed',
              style: HomePageTextStyle,
            ),
            Text(
              '12',
              style: HomePageValueTextStyle,
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: <Widget>[
            Text(
              'Status',
              style: HomePageTextStyle,
            ),
            Text(
              'not enough',
              style: HomePageValueTextStyle,
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}