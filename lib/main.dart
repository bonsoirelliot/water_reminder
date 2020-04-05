import 'package:flutter/material.dart';
import 'round_slider_track_shape.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterReminder',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ocean.png"),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
        child: InitialPage(),
      ),
      theme: ThemeData(backgroundColor: Colors.blue[100]),
    );
  }
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(children: <Widget>[
            SizedBox(height: 40),
            SpaceWithSlider(text: "age"),
            SpaceWithSlider(text: "weight"),
            SpaceWithSlider(text: "height"),
            CustomButton(text: "continue", callback: () {}),
          ]),
        ));
  }
}

class SpaceWithSlider extends StatelessWidget {
  final String text;

  const SpaceWithSlider({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(text, style: MediumTextStyle),
      SizedBox(height: 25),
      CustomSlider(),
      SizedBox(height: 20),
    ]);
  }
}

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _continuousValue = 10;
  int intvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xFFFF1E56),
          inactiveTrackColor: Color(0xFFFF1E56),
          trackShape: RoundSliderTrackShape(radius: 8),
          trackHeight: 8.0,
          thumbColor: Colors.white,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Color(0xFFFF1E56),
          valueIndicatorTextStyle: SmallTextStyle,
        ),
        child: Slider(
            value: _continuousValue,
            min: 10,
            max: 200,
            label: intvalue.toString(),
            divisions: 191,
            onChanged: (value) {
              setState(() {
                _continuousValue = value;
                intvalue = _continuousValue.toInt();
              });
            }),
      ),
    );
  }
}

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
          minWidth: 200.0,
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
