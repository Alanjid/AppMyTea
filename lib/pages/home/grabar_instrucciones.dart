import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pages/Widgets/slider_audio.dart';
import 'package:untitled/utils/colors.dart' as utils;

class sonido_grabar extends StatefulWidget {
  const sonido_grabar({required this.audioPath, required this.texto_grabar}) : super();

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
                  VolumenSlider(
                    volume: _volume,
                    onChanged: (double newVolume) {
                      if (_isPlaying) {
                        _soundpool.setVolume(soundId: _soundId, volume: newVolume / 100);
                      }
                      setState(() {
                        _volume = newVolume;
                      });
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
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 500,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Repite el siguiente texto:",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                widget.texto_grabar,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  ElevatedButton(
                                    child: const Text("Grabar"),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    child: const Text("Pausar"),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    child: const Text("Guardar"),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    child: const Text("Cerrar"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.mic_rounded,
                    color: utils.Colors.azulitoArriba,
                  ),
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