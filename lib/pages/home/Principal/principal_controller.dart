import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class principalController extends GetxController {
  
  
  principalController() {
    
  }
  void goToNivelesActividades() {
    Get.toNamed('/nivelesActividades');
  }

  void goToNivelesRutinaDiaria() {
    Get.toNamed('/nivelesRutinaDiaria');
  }
}
