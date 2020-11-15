import 'package:flutter/material.dart';

const MediumTextSize = 20.0;
const SmallTextSize = 12.0;
const HomePageSize = 16.0;
const IndicatorTextSize = 50.0;

const String FontNameDefault = 'Montserrat';

const MediumTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: MediumTextSize,
  color: Colors.white,
);

const MediumBlackTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const SmallTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: SmallTextSize,
  color: Colors.white,
);

const HomePageTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: HomePageSize,
  color: Colors.white70,
);

const HomePageValueTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: HomePageSize,
  color: Colors.white,
);

const IndicatorTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: IndicatorTextSize,
  color: Colors.white,
);

const CommonDecoration = BoxDecoration(
    image: DecorationImage(
  image: AssetImage("assets/images/ocean.png"),
  fit: BoxFit.cover,
  alignment: Alignment.centerRight,
));
