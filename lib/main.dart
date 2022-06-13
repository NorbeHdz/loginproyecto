import 'package:flutter/material.dart';
import 'package:loginproyectoflutter/Screens/home_creen.dart';
import 'package:loginproyectoflutter/Screens/login_screen.dart';
import 'package:loginproyectoflutter/providers/usuario_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/agregar_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Usuario_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login' : (_) => const LoginScreen(),
          'home' : (_) =>  HomeScreen(),
          'agregar': (_) => AgregarScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}