import 'package:flutter/material.dart';
import 'round_slider_track_shape.dart';
import 'style.dart';
import 'custom_slider_thumb.dart';

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
          child: Column(
            children: <Widget>[
              Text(
                'choose your sex',
                style: MediumTextStyle,
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  CustomSelectionButton(
                      text: 'man', callback: () {}, right: true),
                  CustomSelectionButton(
                      text: 'woman', callback: () {}, right: false)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SpaceWithSlider(
                  text: "age", minSliderValue: 0, maxSliderValue: 100),
              SpaceWithSlider(
                  text: "weight", minSliderValue: 10, maxSliderValue: 300),
              SpaceWithSlider(
                  text: "height", minSliderValue: 50, maxSliderValue: 300),
              CustomButton(text: "continue", callback: () {}),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
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

class CustomSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;

  const CustomSlider({Key key, this.minValue, this.maxValue}) : super(key: key);
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _continuousValue = 50;
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
          thumbShape: CustomSliderThumbShape(thumbRadius: 11),
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Color(0xFFFF1E56),
          valueIndicatorTextStyle: SmallTextStyle,
        ),
        child: Slider(
            value: _continuousValue,
            min: widget.minValue,
            max: widget.maxValue,
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

class CustomSelectionButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final bool right;

  const CustomSelectionButton({Key key, this.callback, this.text, this.right})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 6.0,
        color: Color(0xFFFF1E56),
        borderRadius: right
            ? BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
            : BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 130.0,
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
