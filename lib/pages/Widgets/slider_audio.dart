import 'package:flutter/material.dart';

class VolumenSlider extends StatelessWidget {
  final double volume;
  final ValueChanged<double> onChanged;
  VolumenSlider({required this.volume, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: volume,
          label: volume.round().toString(),
          onChanged: onChanged,
          divisions: 100,
          max: 100,
        ),
      ],
    );
  }
}
