import 'package:flutter/material.dart';
import 'style.dart';
import 'widgets/toggle.dart';
import 'widgets/custom_slider.dart';
import 'widgets/custom_button.dart';
import 'widgets/button_panel.dart';
import 'widgets/status_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WaterReminder',
        home: Container(decoration: CommonDecoration),
        theme: ThemeData(backgroundColor: Colors.blue[100]),
        initialRoute: InitialPage.id,
        routes: {
          InitialPage.id: (context) => InitialPage(),
          HomePage.id: (context) => HomePage(),
        });
  }
}

class InitialPage extends StatelessWidget {
  static const String id = 'INITIALSCREEN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                'choose your sex',
                style: MediumTextStyle,
              ),
              SizedBox(height: 20),
              Toggle(),
              SpaceWithSlider(
                  text: "age", minSliderValue: 0, maxSliderValue: 100),
              SpaceWithSlider(
                  text: "weight", minSliderValue: 10, maxSliderValue: 300),
              SpaceWithSlider(
                  text: "height", minSliderValue: 50, maxSliderValue: 300),
              CustomButton(
                  text: "continue",
                  callback: () {
                    Navigator.of(context).pushNamed(HomePage.id);
                  }),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        decoration: CommonDecoration,
      ),
    );
  }
}

class SpaceWithSlider extends StatelessWidget {
  final String text;
  final double minSliderValue;
  final double maxSliderValue;

  const SpaceWithSlider(
      {Key key, this.text, this.minSliderValue, this.maxSliderValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(text, style: MediumTextStyle),
      SizedBox(height: 25),
      CustomSlider(minValue: minSliderValue, maxValue: maxSliderValue),
    ]);
  }
}

class HomePage extends StatelessWidget {
  static const String id = 'HOMESCREEN';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            StatusBar(),
            DailyGoalIndicator(),
            ButtonsPanel(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )),
        decoration: CommonDecoration,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

double percent = 3;
double goal = 4;

class DailyGoalIndicator extends StatelessWidget {
  const DailyGoalIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularPercentIndicator(
        radius: 300,
        progressColor: Color(0xFFFF1E56),
        percent: percent / goal,
        lineWidth: 10,
        center: new Text(
          "$percent/$goal",
          style: IndicatorTextStyle,
        ),
      ),
    );
  }
}
