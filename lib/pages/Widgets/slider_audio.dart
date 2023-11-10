import 'package:flutter/material.dart';

class VolumenSlider extends StatelessWidget {
  final double volume;
  final ValueChanged<double> onChanged;

  VolumenSlider({
    required this.volume,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: volume,
          min: 0.0,
          max: 1.0,
          onChanged: onChanged,
        ),
        Text('Volumen: ${(volume * 100).toInt()}%'),
      ],
    );
  }
}
