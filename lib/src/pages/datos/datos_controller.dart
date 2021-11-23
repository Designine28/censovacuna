import 'package:censovacunas/db/db.dart';
import 'package:censovacunas/models/registro_db.dart';
import 'package:flutter/material.dart';

class DatosController {
  late BuildContext context;

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  init(BuildContext context) {
    this.context = context;
  }

  Future<List<RegistroDb>> getAll() async {
    return await Db.registrosDb();
  }
}
