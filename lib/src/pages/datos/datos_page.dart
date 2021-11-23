import 'package:censovacunas/models/registro_db.dart';
import 'package:censovacunas/src/pages/datos/datos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DatosPage extends StatefulWidget {
  @override
  _DatosPageState createState() => _DatosPageState();
}

class _DatosPageState extends State<DatosPage> {
  DatosController _con = new DatosController();

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
          title: Text("Registro de Vacunas"),
          backgroundColor: Colors.blue[700],
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _con.getAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RegistroDb>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (_, index) {
                  return _cardHistoryInfo(
                      snapshot.data![index].nombre,
                      snapshot.data![index].email,
                      snapshot.data![index].total,
                      snapshot.data![index].personVacu,
                      snapshot.data![index].direccion,
                      snapshot.data![index].codigo,
                      snapshot.data![index].fecha);
                });
          },
        ));
  }

  Widget _cardHistoryInfo(
    String name,
    String email,
    String total,
    String numVac,
    String dir,
    String codigo,
    String fecha,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.person_pin_sharp),
                SizedBox(width: 5),
                Text(
                  'Nombre: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.email),
                SizedBox(width: 5),
                Text(
                  'email: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.person_outline_sharp),
                SizedBox(width: 5),
                Text(
                  'Habitantes: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    total,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.person),
                SizedBox(width: 5),
                Text(
                  'Vacunadas: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    numVac,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.location_on_outlined),
                SizedBox(width: 5),
                Text(
                  'Dirección: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    dir,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(
                  'Codigo Postal: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    codigo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Icon(Icons.date_range),
                SizedBox(width: 5),
                Text(
                  'Fecha: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    fecha,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
