import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:loginproyectoflutter/models/usuario.dart';
import 'package:loginproyectoflutter/constants.dart';
import 'package:http/http.dart' as http;

const urlapi = url;
class Usuario_provider with ChangeNotifier{
  List<Usuario> usuarios = [];

  Usuario_provider(){
    getUsuarios();
  }

  getUsuarios() async{
    final url1 = Uri.http(urlapi, 'login/usuario.php');
    final resp = await http.get(url1, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final response = usuarioFromJson(resp.body);
    usuarios = response;
    notifyListeners();
  }

}