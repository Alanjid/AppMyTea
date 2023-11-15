import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/colors.dart' as utils;

class sonido_grabar extends StatefulWidget {
  const sonido_grabar({ required this.onVolumeChanged,required this.audioPath, required this.texto_grabar}) : super();
  final ValueChanged<double> onVolumeChanged;
  final String audioPath;
  final String texto_grabar;

  @override
  _sonido_grabarState createState() => _sonido_grabarState();
}

class _sonido_grabarState extends State<sonido_grabar> {
  late Soundpool _soundpool;
  late int _soundId;
  double _volume = 50;
  bool _isPlaying = false;
  bool switchvalue=true;

  @override
  void initState() {
    super.initState();
    _soundpool = Soundpool();
    loadAudio();
  }

  Future<void> loadAudio() async {
    ByteData data = await rootBundle.load(widget.audioPath); // Usamos la ruta proporcionada en lugar de una ruta fija
    _soundId = await _soundpool.load(data);
  }

  Future<void> playAudio() async {
    if (_isPlaying) {
      await _soundpool.stop(_soundId);
      await _soundpool.release();
    }

    double volumeNormalized = _volume / 100;

    ByteData data = await rootBundle.load(widget.audioPath); // Usamos la ruta proporcionada en lugar de una ruta fija
    _soundId = await _soundpool.load(data);

    await _soundpool.play(_soundId, rate: volumeNormalized);
    _isPlaying = true;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ajustar Volumen"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    value: _volume,
                    min: 0,
                    max: 100,
                    onChanged: (double newVolume) {
                      if (_isPlaying) {
                        _soundpool.setVolume(soundId: _soundId, volume: newVolume / 100);
                      }
                      setState(() {
                        _volume = newVolume;
                      });
                      widget.onVolumeChanged(newVolume);
                    },
                  ),
                ],
              ),
              actions: [
                Text("Volumen: ${_volume.round()}%"),


                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cerrar"),
                ),

              ],
            );
          },
        );
      },
      icon: Image.asset('assets/img/iconobocina.gif'),
      iconSize: 70,
    );
  }

  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }
}