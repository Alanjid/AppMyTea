import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/user.dart';

class saludoController extends GetxController {
  

  saludoController() {
    
  }
  void goToMenuPage() {
    Get.toNamed('/principal');
  }
}
