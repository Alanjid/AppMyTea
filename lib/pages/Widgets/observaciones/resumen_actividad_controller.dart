import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


// ignore: camel_case_types
class resumen_controller extends GetxController {
  resumen_controller();
  
  void goToObservaciones(){
    Get.toNamed('/observaciones');
  }
  void goToMenu(){
    Get.toNamed('/principal');
  }
}
