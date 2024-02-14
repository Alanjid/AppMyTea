import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:soundpool/soundpool.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/utils/colors.dart' as utils;

class movi_conejo extends StatefulWidget {
  const movi_conejo({super.key});

  //_HomePageState createState()=> _HomePageState();
  // const movi_conejo(  { required this.photo, required this.onTap, required this.width}) : super();
  // _HomePageState createState()=> _HomePageState();


  /* final String photo;
  final VoidCallback onTap;
  final double width;*/


  @override
  _HomePageState createState()=> _HomePageState();

}


class _HomePageState extends State {
  String Instruccion="VAMOS A MOVERNOS";
  String audioUrl="assets/audios/vamos_a_movernosH.mp3";
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue=50.0;
  double _volume = 0.5; // Agrega _volume como una propiedad y establece el valor inicial
  int _selectedSwitch = 0;
  int menos =15;

  @override
  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer)   {
      if (menos > 0) {
        // musicamovimiento();
        setState(()  {
          //if(menos==15||menos==10){musicamovimiento();}
          menos = menos - 1;
        });
      }
      else {
        timer.cancel();
        //menos=15;
      }
    });
    menos=16;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: Instruccion,
              strokeWidth: 6,
              strokeColor: Colors.deepPurpleAccent,
              textStyle: const TextStyle(
                fontSize: 30,
                fontFamily: 'lazydog',
              ),
            ),
            IconButton(
              onPressed: () {

                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Cambiamos la voz',
                          textAlign: TextAlign.center,),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ToggleSwitch(
                              minWidth: 100.0,
                              initialLabelIndex: _selectedSwitch,
                              cornerRadius: 20.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              totalSwitches: 2,
                              labels: const ['Hombre', 'Mujer'],
                              icons: const [Icons.male, Icons.female],
                              activeBgColors: const [[Colors.blue],[Colors.pink]],
                              onToggle: (index) {
                                setState(() {
                                  _selectedSwitch=index!;
                                });
                                print('switched to: $index');
                                if(index == 0){
                                  audioUrl="assets/audios/vamos_a_movernosH.mp3";
                                }
                                else{
                                  if(index == 1){
                                    audioUrl="assets/audiosM/vamos_a_movernosM.mp3";
                                  }
                                }
                              },
                            ),

                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cerrar",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: utils.Colors.azulitoArriba,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
              icon: Image.asset('assets/img/iconobocina.gif'),
              iconSize: 70,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover
          ),
        ),
        child:Column(
          children: [
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Slider(
                    value: _sliderValue,
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.redAccent,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _sliderValue.round().toString(),
                    onChanged: (double newVolume) {
                      setState(() {
                        _setVolume(newVolume / 100);
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menos==0?'  ¡BIEN ''\n''HECHO!':menos.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                    MaterialButton(onPressed: () {
                      _startCountDown();
                    },
                      color: Colors.deepPurpleAccent,
                      child: const Text('COMENZAR',style: TextStyle(fontSize: 27,color:Colors.white),
                        // color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 4,color: Colors.deepPurpleAccent),
                      color: Colors.white
                  ),
                  child: Image.asset(
                    'assets/img/movimiento1.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }


  Future<void> musicamovimiento() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/musicamovi.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> _setVolume(double newVolume) async {
    await _soundpool.setVolume(soundId: _soundId, volume: newVolume);
    setState(() {
      _volume = newVolume;
      _sliderValue=newVolume *100;
    });
  }


  void startTimer() {
    Repite =Timer.periodic(const Duration(seconds: 10), (timer) {
      _initializeSound();
    });
  }

  @override
  void dispose() {
    Repite.cancel();  // Cancelar el temporizador antes de liberar el widget
    _soundpool.release();
    super.dispose();
  }

  void _initializeSound() async {
    _soundpool = Soundpool();
    _soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
    await _setVolume(_volume);
    _streamId = await _soundpool.play(_soundId);
  }
}