import 'package:censovacunas/models/registro_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static Future<Database> openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'censo.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE registros ( nombre TEXT PRIMARY KEY, email TEXT, total TEXT, personvacu TEXT, direccion TEXT, codigo TEXT, fecha TEXT)");
    }, version: 1);
  }

  static Future<dynamic> insert(RegistroDb registro) async {
    Database database = await openDB();

    return database.insert("registros", registro.toMap());
  }

  static Future<List<RegistroDb>> registrosDb() async {
    Database database = await openDB();

    final List<Map<String, dynamic>> registrosMap =
        await database.query("registros");

    for (var n in registrosMap) {
      print("_______" + n["nombre"]);
    }

    return List.generate(
        registrosMap.length,
        (i) => RegistroDb(
            nombre: registrosMap[i]['nombre'],
            email: registrosMap[i]['email'],
            total: registrosMap[i]['total'],
            personVacu: registrosMap[i]['personvacu'],
            direccion: registrosMap[i]['direccion'],
            codigo: registrosMap[i]['codigo'],
            fecha: registrosMap[i]['fecha']));
  }
}
