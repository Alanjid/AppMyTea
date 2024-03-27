import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/models/user.dart';

class principalController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
  
  principalController() {
    print('Usuario en sesion: ${user.toJson()}');
  }
  void goToNivelesActividades() {
    Get.toNamed('/nivelesActividades');
  }

  void goToNivelesRutinaDiaria() {
    Get.toNamed('/nivelesRutinaDiaria');
  }
}
