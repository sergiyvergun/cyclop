import 'package:flutter/material.dart';

import '../../tabbar.dart';
import 'channel_slider.dart';
import 'hsl_sliders.dart';

typedef ChannelValueGetter = double Function(Color value);

typedef ValueLabelGetter = String Function(Color value);

class ChannelSliders extends StatefulWidget {
  final Color selectedColor;
  final String redTitle;
  final String greenTitle;
  final String blueTitle;
  final String hueTitle;
  final String saturationTitle;
  final String lightnessTitle;

  final ValueChanged<Color> onChange;

  const ChannelSliders(
      {required this.selectedColor,
      required this.onChange,
      Key? key,
      required this.redTitle,
      required this.greenTitle,
      required this.blueTitle,
      required this.hueTitle,
      required this.saturationTitle,
      required this.lightnessTitle})
      : super(key: key);

  @override
  _ChannelSlidersState createState() => _ChannelSlidersState();
}

class _ChannelSlidersState extends State<ChannelSliders> {
  bool hslMode = true;

  Color get color => widget.selectedColor;

  @override
  Widget build(BuildContext context) => Tabs(
        labels: const ['HSL', 'RGB'],
        views: [
          HSLSliders(
            color: color,
            onColorChanged: widget.onChange,
            hueTitle: widget.hueTitle,
            lightnessTitle: widget.lightnessTitle,
            saturationTitle: widget.saturationTitle,
          ),
          _buildRGBSliders(),
        ],
      );

  Column _buildRGBSliders() => Column(
        children: [
          ChannelSlider(
            label: widget.redTitle,
            selectedColor: color,
            colors: [color.withRed(0), color.withRed(255)],
            channelValueGetter: (color) => color.red / 255,
            labelGetter: (color) => '${color.red}',
            onChange: (value) => widget.onChange(
              color.withRed((value * 255).toInt()),
            ),
          ),
          ChannelSlider(
            label: widget.greenTitle,
            selectedColor: color,
            colors: [color.withGreen(0), color.withGreen(255)],
            channelValueGetter: (color) => color.green / 255,
            labelGetter: (color) => '${color.green}',
            onChange: (value) => widget.onChange(
              color.withGreen((value * 255).toInt()),
            ),
          ),
          ChannelSlider(
            label: widget.blueTitle,
            selectedColor: color,
            colors: [color.withBlue(0), color.withBlue(255)],
            channelValueGetter: (color) => color.blue / 255,
            labelGetter: (color) => '${color.blue}',
            onChange: (value) => widget.onChange(
              color.withBlue((value * 255).toInt()),
            ),
          ),
        ],
      );
}
