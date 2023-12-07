import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../moldes/user.dart';

class saludoController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  saludoController() {
    print('USUARIO EN SESION: ${user.toJson()}');
  }
  void goToMenuPage() {
    Get.toNamed('/principal');
  }
}
