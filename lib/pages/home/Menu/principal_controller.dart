import 'package:get/get.dart';

class principalController extends GetxController {
  // RUTA PARA IR A ACTIVIDADES
  void goToActividades() {
    Get.toNamed('/nivelesActividades');
  }

  //RUTA PARA IR A RUTINA DIARIA
  void goToRutinaDiaria() {
    Get.toNamed('/nivelesRutinaDiaria');
  }
}
