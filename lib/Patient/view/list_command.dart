import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/Patient/controller/list_command_controller.dart';
import 'package:pharmacy_app/Patient/view/list_medicament_details.dart';
import 'package:pharmacy_app/Patient/view/list_ordonnances_details.dart';

class ListCommand extends StatefulWidget {
  const ListCommand({Key? key}) : super(key: key);

  @override
  _ListCommandState createState() => _ListCommandState();
}

class _ListCommandState extends State<ListCommand> {
  final ListCommandeController listCommandController =
      Get.put(ListCommandeController());

  @override
  void initState() {
    // TODO: implement initState
    listCommandController.getCommand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des commandes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              // Mettez ici la logique pour effectuer la déconnexion
            },
            icon: Icon(
              Icons.logout,
              color: Color.fromARGB(255, 22, 219, 101),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (listCommandController.isListCommandLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Nom Patient',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Prenom Patient',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Medicament',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Ordonnance',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: listCommandController.commandeList.map((commande) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(commande.patient.nom.toString())),
                      DataCell(Text(commande.patient.prenom.toString())),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListMedicDetails()));
                          },
                          child: Text("Details sur les medicaments"),
                        ),
                      ),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListOrdonnancesDetails()));
                          },
                          child: Text("Details sur les ordonnances"),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
      }),
    );
  }
}
