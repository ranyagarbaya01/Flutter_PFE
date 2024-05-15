import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/controller/medicament_controller.dart';
import 'package:pharmacy_app/Patient/model/medicament_model.dart';
import 'package:pharmacy_app/Patient/view/panier_screen.dart';

import '../../core/navigation_with_transition.dart';
import 'medicament_details.dart';

class MedicamentCommand extends StatefulWidget {
  const MedicamentCommand({super.key});

  @override
  State<MedicamentCommand> createState() => _MedicamentCommandState();
}

class _MedicamentCommandState extends State<MedicamentCommand> {
  //final MedicamentController controller = Get.find();
  final MedicamentController controller = Get.put(MedicamentController());
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar("Liste de médicaments", () {
        navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
            context, PanierScreen());
      }),
      body: Obx(() {
        if (controller.isMedicamentLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.medicamentList.length,
            itemBuilder: (context, index) {
              Medicament medicament = controller.medicamentList[index];
              return ListTile(
                onTap: () {
                  navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
                      context,
                      MedicamentDetails(
                          id: (int.parse(medicament.id) - 1).toString()));
                },
                title: Text(
                  medicament.nom,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // leading: Checkbox(
                //   value: medicament.isSelected,
                //   onChanged: (value) {
                //     if (value != null) {
                //       if (value) {
                //         controller.medicamentList[index].select();
                //       } else {
                //         controller.medicamentList[index].deselect();
                //       }
                //     }
                //   },
                // ),
                // trailing: SizedBox(
                //   width: 100,
                //   child: TextField(
                //     decoration: InputDecoration(labelText: 'Quantité'),
                //     keyboardType: TextInputType.number,
                //     onChanged: (value) {
                //       // controller.medicamentList[index].quantite =
                //       //     int.parse(value);
                //     },
                //   ),
                // ),
              );
            },
          );
        }
      }),
      // floatingActionButton: Stack(
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         // // Action de commande des médicaments sélectionnés
      //         // List<LigneCommande> selectedMedicaments = controller.medicamentList
      //         //     .where((medicament) => medicament.isSelected)
      //         //     .toList();
      //         // // Logique de commande ici...
      //       },
      //       child: Icon(Icons.shopping_cart),
      //     ),
      //     Positioned(
      //       right: 0,
      //       top: 0,
      //       child: Container(
      //           width: 20,
      //           height: 20,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: Colors.red,
      //           ),
      //           child: Center(
      //             child: Obx(
      //               () => Text(
      //                 controller.commandList.length.toString(),
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             ),
      //           )),
      //     ),
      //   ],
      // ),
    );
  }
}

PreferredSizeWidget ReusableAppBar(
  title,
  OnPressed,
) {
  final MedicamentController controller = Get.find();
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title,
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
    actions: <Widget>[
      Stack(
        children: [
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.grey[100],
            onPressed: OnPressed,
            child: Icon(Icons.shopping_cart),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 22, 219, 101),
                ),
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.commandList.length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ),
        ],
      ),
    ],
  );
}
