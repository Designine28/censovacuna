import 'package:censovacunas/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _con = new HomeController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Censo Vacunas'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              _textSelectOption(),
              SizedBox(height: 50),
              _optionApp(context, 'assets/note.png', 'register'),
              SizedBox(height: 10),
              _optionText('Registro'),
              SizedBox(height: 30),
              _optionApp(context, 'assets/registered.png', 'datos'),
              SizedBox(height: 10),
              _optionText('Ver Datos')
            ],
          ),
        )),
      ),
    );
  }

  Widget _textSelectOption() {
    return Text(
      'Selecciona una opcion',
      style: TextStyle(fontSize: 25, fontFamily: 'OneDay'),
    );
  }

  Widget _optionApp(BuildContext context, String image, String option) {
    return GestureDetector(
        onTap: () => _con.goToOptionPage(option),
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 40,
          backgroundColor: Colors.white,
        ));
  }

  Widget _optionText(String optionText) {
    return Text(optionText,
        style: TextStyle(color: Colors.black, fontSize: 16));
  }
}
