import 'package:flutter/material.dart';
import 'package:sig_proyect_cco/models/solicituds_emergencia_list.dart';
import 'package:sig_proyect_cco/services/solicitud_emergencia_list_services.dart';

class SolicitudEmergenciaListPage extends StatefulWidget {
  const SolicitudEmergenciaListPage({Key? key}) : super(key: key);

  @override
  _SolicitudEmergenciaListPageState createState() =>
      _SolicitudEmergenciaListPageState();
}

class _SolicitudEmergenciaListPageState
    extends State<SolicitudEmergenciaListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitudes de Emergencia Recibidas'),
          actions: const <Widget>[],
        ),
        body: FutureBuilder<List<SolicitudesE>>(
          future: SolicitudesServices().getsolicitudes(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SolicitudesE>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  SolicitudesE item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_rtl_outlined),
                        title: Text('Solicitud #:   ' + item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.person_add_alt_1_rounded),
                        title: Text(
                          'Nombre:   ' + item.nombreCompleto,
                        )),
                    ListTile(
                      leading: const Icon(Icons.directions_bike_rounded),
                      title:
                          Text('Ubicacion del afectado:   ' + item.ubicacion),
                    ),
                    ListTile(
                        leading: const Icon(Icons.local_police_outlined),
                        title:
                            Text('Personal que requiere:   ' + item.tipoApoyo),
                        //subtitle: const Text('Click para ver fotos'),
                        onTap: () {}),
                    ListTile(
                      leading: const Icon(Icons.directions_bus_filled_outlined),
                      title:
                          Text('Detalles de la ubicacion:   ' + item.direccion),
                      // subtitle: const Text('Click para comprar album'),
                      // tileColor: (Colors.greenAccent),
                      onTap: () {
                        /*Navigator.pushReplacementNamed(
                            context, '/payment_stack');*/
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.social_distance),
                        title: Text('Estado de la solicitud:   ' + item.estado),
                        tileColor: (Colors.yellowAccent),
                        onTap: () {}),
                    const ListTile(
                        title: Text(
                            '-------------------------------------------------------------------')),
                  ]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
