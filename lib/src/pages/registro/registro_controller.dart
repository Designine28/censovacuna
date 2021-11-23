import 'package:censovacunas/db/db.dart';
import 'package:censovacunas/models/registro_db.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistroController {
  late BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController totalHabitantes = new TextEditingController();
  TextEditingController numPersonasVacunadas = new TextEditingController();
  TextEditingController direc = new TextEditingController();
  TextEditingController codigo = new TextEditingController();
  TextEditingController fecha = new TextEditingController();

  void init(BuildContext context) {
    this.context = context;
  }

  void register() {
    String nombreCompleto = name.text;
    String correo = email.text;
    String total = totalHabitantes.text;
    String personVacu = numPersonasVacunadas.text;
    String direccion = direc.text;
    String codigoPostal = numPersonasVacunadas.text;
    String fechaRegistro = fecha.text;

    print(nombreCompleto);
    print(correo);
    print(total);
    print(personVacu);
    print(direccion);
    print(codigoPostal);
    print(fechaRegistro);

    if (nombreCompleto.isEmpty ||
        correo.isEmpty ||
        total.isEmpty ||
        personVacu.isEmpty ||
        direccion.isEmpty ||
        codigoPostal.isEmpty ||
        fechaRegistro.isEmpty) {
      Fluttertoast.showToast(
          msg: "Debes de llenar todos los campos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    try {
      Db.insert(RegistroDb(
          nombre: nombreCompleto,
          email: correo,
          total: total,
          personVacu: personVacu,
          direccion: direccion,
          codigo: codigoPostal,
          fecha: fechaRegistro));

      print("Registro Exitoso");

      Fluttertoast.showToast(
          msg: "Registro Exitoso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    } catch (e) {
      print("A ocurrido un error");
    }
  }
}
