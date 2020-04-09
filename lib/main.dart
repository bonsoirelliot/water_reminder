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

class HomePage extends StatelessWidget {
  static const String id = 'HOMESCREEN';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            StatusBar(),
          ],
        )),
        decoration: CommonDecoration,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

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
