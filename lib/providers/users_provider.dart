import 'package:get/get.dart';
import 'dart:convert';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:untitled/models/response_api.dart';
import '../enviroment/enviroment.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends GetConnect {
  String get url => Enviroment.API_URL + "api/token/";

  // //MOTODO DE CREAR USUARIO MEDIANTE APP, NO SE USA PERO DEJO IMPLEMENTADO PARA FUTURO
  // Future<Response> create(User user) async {
  //   Response response = await post('$url/create', user.toJson(),
  //       headers: {'Content-Type': 'application/json'});
  //   return response;
  // }

//   //Response normal
    
      Future<ResponseApi> login1(String username, String password) async {
      try {
        final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/token/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password
        }),
      );
      print(response.body);
      print(response.statusCode);
       if (response.statusCode == 200) {
        return ResponseApi.fromJson(jsonDecode(response.body) );
         } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Error al procesar la solicitud');
  }
      } catch (e) {
        print(e);
        return throw Exception('Error al procesar la solicitud');
        
      }
      
    }
  //METODO DE INICIO DE SESION/LOGIN
  // Future<ResponseApi> login(String username, String password) async {
  //   Response response = await post('$url', {
  //     'username': username,
  //     'password': password
  //   }, headers: {
  //     'content-length': 'application/json',
  //     'HttpHeaders': 'authorizationHeader'
  //   });

  //   if (response.body == null) {
  //     print(response);
  //     print('Error: No se pudo ejecutar la peticion');
  //     return ResponseApi();
  //   }
  //   ResponseApi responseApi = ResponseApi.fromJson(response.body);
  //   print(responseApi.data);
  //   return responseApi;
  // }
}
