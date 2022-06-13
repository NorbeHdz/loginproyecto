import 'package:flutter/material.dart';
import 'package:loginproyectoflutter/Screens/home_creen.dart';
import 'package:loginproyectoflutter/providers/usuario_provider.dart';
import 'package:loginproyectoflutter/widgets/input_decoration.dart';
import 'package:http/http.dart' as http;


class AgregarScreen extends StatelessWidget{
   AgregarScreen ({ Key? key}) : super(key:key);


  TextEditingController controlcorreo = new TextEditingController();
  TextEditingController controlcontrasena=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text ('Agregar Usuario'),
      ),
      body: Container(
        padding:const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget> [
               TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: controlcorreo,
                decoration: InputDecorations.inputDecoration(
                hintext: 'ejemplo@hotmail.com', 
                labeltext: 'Correo electronico', 
                icono: const Icon(Icons.alternate_email_rounded)),
                validator: (value){
                String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'El valor ingresado no es un correo';
                },
                ),
                 const SizedBox(height: 30),
                 TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  controller: controlcontrasena,
                  decoration: InputDecorations.inputDecoration(
                  hintext: '********', 
                  labeltext: 'Contraseña', 
                  icono: const Icon(Icons.lock_outline)),
                  validator: (value) {
                  return (value != null && value.length >= 6)
                  ? null
                  : 'La contaseña debe ser mayor o igual a los 6 caracteres';
                  }
                  ),
                  const SizedBox( height: 30),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    color: Colors.blue,                    
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                      child: const Text('Agregar',style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: (){
                    agregarusuario();
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen()));
                    }),
                    const SizedBox( height: 30),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      color: Colors.red,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                      child: const Text('Cancelar',style: TextStyle(color: Colors.white),),
                      ),
                      onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen()));                                      },
                      ),
                ]),
        ),
      ),
    );
  }

 void agregarusuario(){
  final url2 = Uri.http(urlapi, 'login/agregar.php');
  http.post(url2,body: {
    "usuario": controlcorreo.text,
    "contrasena":controlcontrasena.text,
  });
}
}