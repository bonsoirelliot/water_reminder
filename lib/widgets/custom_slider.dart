import 'package:flutter/material.dart';
import 'custom_slider_thumb.dart';
import 'package:water_reminder/style.dart';
import 'round_slider_track_shape.dart';

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