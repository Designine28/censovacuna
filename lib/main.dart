import 'package:censovacunas/src/pages/datos/datos_page.dart';
import 'package:censovacunas/src/pages/home/home_page.dart';
import 'package:censovacunas/src/pages/registro/registro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Censo de Vacunas',
      initialRoute: 'home',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0, brightness: Brightness.dark),
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'register': (BuildContext context) => RegisterPage(),
        'datos': (BuildContext context) => DatosPage()
      },
    );
  }
}
