import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/controller/panier_controller.dart';
import 'package:pharmacy_app/Patient/view/confirmation_view.dart';
import 'package:pharmacy_app/Patient/view/list_medicament_details.dart';

import '../../core/navigation_with_transition.dart';
import '../controller/medicament_controller.dart';
import '../model/medicament_model.dart';
import 'medicament_command.dart';
import 'medicament_details.dart';

class PanierScreen extends StatelessWidget {
  const PanierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MedicamentController());
    Get.put(CommandController());
    final MedicamentController controller = Get.find();
    return Scaffold(
      appBar: ReusableAppBar("Le panier", () {
        navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
            context, ListMedicDetails());
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.isMedicamentLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.commandList.isEmpty) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: Image(
                            image: AssetImage("images/Empty.png"),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.commandList.length,
                    itemBuilder: (context, index) {
                      Medicament medicament = controller.commandList[index];
                      return ListTile(
                          onTap: () {
                            navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
                                context,
                                MedicamentDetails(
                                    id: (int.parse(medicament.id) - 1)
                                        .toString()));
                          },
                          title: Text(medicament.nom,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              controller.commandList[index].quantiteACommander =
                                  0.obs;
                              controller.commandList.removeAt(index);
                            },
                          ));
                    },
                  );
                }
              }
            }),
            Obx(
              () => controller.commandList.isNotEmpty
                  ? SizedBox(
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 22, 219, 101),
                        )),
                        onPressed: () {
                          // Get.find<CommandController>().createCommand();
                          navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
                              context,
                              Confirmation(
                                confirmation_adresse: '',
                              ));
                        },
                        child: const Text('Suivant',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
