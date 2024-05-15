import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/livreur/controller/livraison_controller.dart';

class LivraisonListDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LivraisonController());
    LivraisonController livraisonController = Get.find<LivraisonController>();
    return GetBuilder<LivraisonController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          title: Text(
            'Liste de Livraisons',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                // Mettez ici la logique pour effectuer la déconnexion
              },
              icon: Icon(
                Icons.logout,
                color: Color.fromARGB(255, 22, 219, 101),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(8.0), // Add padding around the DataTable
          child: Obx(() {
            if (livraisonController.isListLivraisonLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(label: Text('#')),
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Nom')),
                      DataColumn(label: Text('Prénom')),
                      DataColumn(label: Text('Numéro de téléphone')),
                      DataColumn(label: Text('Adresse')),
                      DataColumn(label: Text('Etat de la commande')),
                      DataColumn(label: Text('Code confirmation')),
                    ],
                    rows: livraisonController.livraisonList.map((livraisons) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  livraisons.orderStatus == "en livraison"
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                              onPressed:
                                  livraisons.orderStatus == "en livraison"
                                      ? () {
                                          livraisonController.updateLivraison(
                                              livraisons.id_livraison!);
                                        }
                                      : null,
                              child: Row(
                                children: [
                                  Text("Livrer"),
                                  livraisonController.isLivraisonUpdating ==
                                          true
                                      ? SizedBox(width: 5)
                                      : SizedBox(width: 0),
                                  livraisonController.isLivraisonUpdating ==
                                          true
                                      ? SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(),
                                        )
                                      : SizedBox(width: 0),
                                ],
                              ))),
                          DataCell(Text(livraisons.patientId.toString())),
                          DataCell(Text(livraisons.patientName.toString())),
                          DataCell(
                              Text(livraisons.patientFamilyName.toString())),
                          DataCell(Text(livraisons.patientPhone.toString())),
                          DataCell(Text(livraisons.patientAddress.toString())),
                          DataCell(Text(livraisons.orderStatus.toString())),
                          DataCell(
                              Text(livraisons.confirmationcode.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
