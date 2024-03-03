import 'package:get/get.dart';
import 'package:untitled/models/response_api.dart';
import '../enviroment/enviroment.dart';
import '../models/user.dart';

class UsersProvider extends GetConnect {
  String get url => Enviroment.API_URL + "/paciente";

  //MOTODO DE CREAR USUARIO MEDIANTE APP, NO SE USA PERO DEJO IMPLEMENTADO PARA FUTURO
  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  //METODO DE INICIO DE SESION/LOGIN
  Future<ResponseApi> login(String username, String password) async {
    Response response = await post('$url/login', {
      'username': username,
      'password': password
    }, headers: {
      'content-length': 'application/json',
      'HttpHeaders': 'authorizationHeader'
    });

    if (response.body == null) {
      print('Error: No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    print(responseApi.data);
    return responseApi;
  }
}
