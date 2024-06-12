import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pharmacy_app/Patient/controller/list_command_controller.dart';


class ListMedicDetails extends StatefulWidget {
  const ListMedicDetails({super.key});

  @override
  State<ListMedicDetails> createState() => _ListMedicDetailsState();
}

class _ListMedicDetailsState extends State<ListMedicDetails> {
  final ListCommandeController listCommandController =
      Get.put(ListCommandeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des médicaments en details'),
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
                      'Liste des medicaments',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: listCommandController.commandeList.map((commande) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(commande.reservations.toString())),
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
