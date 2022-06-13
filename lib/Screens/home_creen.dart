import 'package:flutter/material.dart';
import 'package:loginproyectoflutter/Screens/agregar_screen.dart';
import 'package:loginproyectoflutter/Screens/editar_screen.dart';
import 'package:loginproyectoflutter/Screens/login_screen.dart';
import 'package:loginproyectoflutter/providers/usuario_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final usuarioprovider = Provider.of<Usuario_provider>(context);
    var usuarios = usuarioprovider.usuarios;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuarios',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuario'),
          ),
          body: ListView.builder(
            itemCount: usuarios.length,
            itemBuilder:(context, index) {
              return ListTile(
                onLongPress: (){
                  borrarUsuario(context, usuarios[index].usuario,usuarios[index].id);
                },
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new EditarScreen(usuarios[index].id,usuarios[index].usuario.toString()),
                    ),
                  ); 
                },
                title: Text(usuarios[index].usuario.toString()),
                subtitle: Text(usuarios[index].contrasena),
                leading: CircleAvatar(
                  child: Text(usuarios[index].id.substring(0,1))
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios)
                  
              );
            }),
            floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'back',
              backgroundColor: Colors.red,
              onPressed: () {cerrarsesion(context);},
              child: const Icon(
                Icons.arrow_left,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  AgregarScreen()));
                  },            
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
            ),
            
    );
}

borrarUsuario(context,usuario,id){
    showDialog(
      context: context,
    builder: (_) => AlertDialog(
      title: const Text('Eliminar usuario'),
      content: Text("¿Estas seguro de eliminar a " + usuario + '?'),
      actions: [
        FlatButton(
          onPressed: () {  Navigator.pop(context);
},
          child: const Text("Cancelar")),
        FlatButton(onPressed: (){
          final url2 = Uri.http(urlapi, 'login/delete.php');
          http.post(url2,body: {
                    "id": id,
                  });
                    Navigator.pop(context);
        }, child: const Text(
          "Eliminar",
          style: TextStyle(color: Colors.red))),
      ],
    ));
  }
}


  cerrarsesion(context){
    showDialog(
      context: context,
    builder: (_) => AlertDialog(
      title: const Text('Salir'),
      content: const Text("¿Deseas cerrar sesion?"),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context, false),  
          child: const Text("Cancelar")),
        FlatButton(onPressed: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );        }, child: const Text(
          "Cerrar sesion",
          style: TextStyle(color: Colors.red))),
      ],
    ));
  }