import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


// ignore: camel_case_types
class observaciones_controller extends GetxController {
  observaciones_controller();
  
  void goToResumen(){
    Get.toNamed('/resumen_actividad');
  }
}
