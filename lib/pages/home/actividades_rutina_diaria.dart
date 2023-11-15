import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:untitled/pages/Actividades/act_afectividad.dart';
import 'package:untitled/pages/Actividades/aprende_poy_real.dart';
import 'package:untitled/pages/Widgets/grabar_instrucciones.dart';

class rutina_diaria extends StatefulWidget {
  @override
  _actR_diariaState createState() => _actR_diariaState();
}

class _actR_diariaState extends State<rutina_diaria> {
  String texto_dictar="Realizamos las actividades de rutina diaria";
  String audioUrl="assets/audios/audio_rutina_diariaH.mp3";
  ValueNotifier<bool> isAudioPlaying = ValueNotifier<bool>(false);
  late List<String> ActividadesList;
  void initState() {
    super.initState();
    startTimer();
    ActividadesList = ['assets/img/alimento.png','assets/img/bebidas.png','assets/img/acciones.png','assets/img/bebidas.png','assets/img/bebidas.png','assets/img/bebidas.png'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            sonido_grabar(
              texto_grabar: texto_dictar,
              audioPath: audioUrl,
              onVolumeChanged: (newVolume){
                print('Nuevo volumen: $newVolume');
              },
            ),
            SizedBox(width: 8),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StrokeText(
              text: texto_dictar,
              strokeWidth: 6,
              strokeColor: Colors.green,
              textStyle: TextStyle(
                fontSize: 38,
                fontFamily: 'lazydog',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 150,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ActividadesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Image.asset(
                            ActividadesList[index],
                            width: 120,
                            height: 120,
                          ),
                          onPressed: () {
                            // Tu lógica cuando se presiona el botón
                          },
                          iconSize: 120, // Ajusta el tamaño del icono según tus necesidades
                          padding: EdgeInsets.all(8), // Ajusta el relleno según tus necesidades
                          color: Colors.blue, // Ajusta el color del icono según tus necesidades
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> audioFondo() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      audioFondo();
    });
  }
}
