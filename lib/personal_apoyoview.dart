import 'package:flutter/material.dart';
import 'package:sig_proyect_cco/global_var.dart';
import 'package:sig_proyect_cco/models/asignar_solicitud_register.dart';
import 'package:sig_proyect_cco/models/personal_apoyo_register.dart';
import 'package:sig_proyect_cco/services/asignar_solicitud_personal_services.dart';
import 'package:sig_proyect_cco/services/personal_apoyo_list_services.dart';

class ListadoPersonalView extends StatefulWidget {
  const ListadoPersonalView({Key? key}) : super(key: key);

  @override
  _ListadoPersonalViewState createState() => _ListadoPersonalViewState();
}

class _ListadoPersonalViewState extends State<ListadoPersonalView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Apoyo Disponible'),
          actions: const <Widget>[],
        ),
        body: FutureBuilder<List<Listadopersonal>>(
          future: PersonalApoyoService().getlistadopersonal(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Listadopersonal>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Listadopersonal item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_rtl_outlined),
                        title: Text('Intentificador del Personal#:   ' +
                            item.id.toString()),
                        subtitle: const Text('Click para enviar apoyo '),
                        onTap: () async {
                          ApoyoSolicitudEmergencia apoyoSolicitudEmergencia =
                              ApoyoSolicitudEmergencia(
                                  ubicacion: ubicacioncliente,
                                  tipoApoyo: item.nombre,
                                  clienteId: idcliente,
                                  personalCcoId: idusuario,
                                  personalApoyoId: item.id);
                          bool assignsucces = await AsignarApoyoServices()
                              .asignarapoyo(apoyoSolicitudEmergencia);
                          if (assignsucces) {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => const AlertDialog(
                                  title: Text('Asignado Con exito'),
                                  content: Text('Back')),
                            );
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => const AlertDialog(
                                  title: Text('Something went wrong xd'),
                                  content: Text('Back')

                                  //backgroundColor: Colors.redAccent,
                                  //shape: CircleBorder(),
                                  ),
                            );
                          }
                        }),
                    ListTile(
                        leading: const Icon(Icons.person_add_alt_1_rounded),
                        title: Text(
                          'Nombre:   ' + item.nombreCompleto,
                        )),
                    ListTile(
                      leading: const Icon(Icons.directions_bike_rounded),
                      title: Text(
                          'Identificador:   ' + item.tipoApoyoId.toString()),
                    ),
                    ListTile(
                        leading: const Icon(Icons.local_police_outlined),
                        title: Text('Ocupacion:   ' + item.nombre),
                        //subtitle: const Text('Click para ver fotos'),
                        onTap: () {}),
                    ListTile(
                      leading: const Icon(Icons.directions_bus_filled_outlined),
                      title: Text('Vehiculo en que se desplaza:   ' +
                          item.vehiculoId.toString()),
                      // subtitle: const Text('Click para comprar album'),
                      // tileColor: (Colors.greenAccent),
                      onTap: () {
                        /*Navigator.pushReplacementNamed(
                            context, '/payment_stack');*/
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.social_distance),
                        title: Text('Celular de Emergencia:   ' + item.celular),
                        // tileColor: (Colors.yellowAccent),
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
