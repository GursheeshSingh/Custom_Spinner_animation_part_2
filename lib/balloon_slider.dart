import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'RoundedRectangleThumbShape.dart';
import 'constants.dart';

class BallonSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new BalloonSlider(),
      ),
    );
  }
}

enum Direction { LEFT, RIGHT }

class BalloonSlider extends StatefulWidget {
  @override
  _BalloonSliderState createState() => _BalloonSliderState();
}

class _BalloonSliderState extends State<BalloonSlider>
    with TickerProviderStateMixin {
  GlobalKey _sliderKey = GlobalKey();

  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: RoundedRectangleThumbShape(
          thumbRadius: 12,
          roundness: 5,
          thickness: 12,
        ),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 2),
        inactiveTrackColor: Colors.grey.shade200,
        activeTrackColor: kCoolPurple,
        thumbColor: kCoolPurple,
      ),
      child: Center(
        child: Slider(
          key: _sliderKey,
          value: _value,
          min: 0,
          max: 100,
          label: '$_value',
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ),
      ),
    );
  }
}
