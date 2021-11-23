import 'package:censovacunas/src/pages/registro/registro_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegistroController _con = new RegistroController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        title: Text('Registro de Vacunas'),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      bottomNavigationBar: _buttonRegister(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            _text('Registro', Colors.black, 25, FontWeight.bold),
            _textField('Nombre', Icons.person_outline, _con.name,
                TextInputType.text, false),
            _textField('Correo electrónico', Icons.email_outlined, _con.email,
                TextInputType.emailAddress, false),
            _textField('Total de Habitantes', Icons.vpn_key_sharp,
                _con.totalHabitantes, TextInputType.number, false),
            _textField('Núm personas Vacunadas', Icons.person_rounded,
                _con.numPersonasVacunadas, TextInputType.number, false),
            _textField('Dirección', Icons.location_on, _con.direc,
                TextInputType.text, false),
            _textField('Codigo Postal', Icons.location_on, _con.codigo,
                TextInputType.number, false),
            _textField('Fecha de encuesta', Icons.date_range, _con.fecha,
                TextInputType.text, false),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          _con.register();
        },
        child: Text('Registrar'),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }

  Widget _textField(String hint, IconData icono,
      TextEditingController controller, TextInputType tipo, bool obscure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        obscureText: obscure,
        keyboardType: tipo,
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(
            icono,
            color: Colors.blue.shade900,
          ),
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }

  Widget _text(String texto, Color color, double size, FontWeight x) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        texto,
        style: TextStyle(
          color: color,
          fontWeight: x,
          fontSize: size,
        ),
      ),
    );
  }
}
