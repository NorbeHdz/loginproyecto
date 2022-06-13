import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
    Usuario({
        required this.id,
        this.usuario,
        required this.contrasena,
    });

    String id;
    String? usuario;
    String contrasena;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        contrasena: json["contrasena"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasena": contrasena,
    };
}
