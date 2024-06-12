import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/view/panier_screen.dart';

import '../../core/navigation_with_transition.dart';
import '../controller/medicament_controller.dart';
import 'medicament_command.dart';

class MedicamentDetails extends StatelessWidget {
  late String id;

  MedicamentDetails({super.key, required this.id});

  final MedicamentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ReusableAppBar('Détails du médicament', () {
          navigateToAnotherScreenWithSlideTransitionFromRightToLeft(
              context, PanierScreen());
        }),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                  image: controller.medicamentList[int.parse(id)].medicImage !=
                          ""
                      ? NetworkImage(
                          controller.medicamentList[int.parse(id)].medicImage)
                      : AssetImage('images/1.jpg') as ImageProvider),
              SizedBox(height: 20),
              Text('Nom du médicament',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(controller.medicamentList[int.parse(id)].nom,
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(height: 10),
              // Text('Nom de la pharmacie',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Text(controller.medicamentList[int.parse(id)].nomPharmacie,
              //     style: TextStyle(
              //       fontSize: 20,
              //     )),
              // SizedBox(height: 10),
              Text('Prix',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(controller.medicamentList[int.parse(id)].prix.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(height: 10),
              Text('Quantité que vous souhaitez commander : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (controller.medicamentList[int.parse(id)]
                              .quantiteACommander! >
                          0) {
                        controller.medicamentList[int.parse(id)]
                            .quantiteACommander?.value--;
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Obx(
                    () => Text(controller
                        .medicamentList[int.parse(id)].quantiteACommander
                        .toString()),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.medicamentList[int.parse(id)]
                          .quantiteACommander?.value++;
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                height: 80,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 22, 219, 101),
                  )),
                  onPressed: () {
                    // Ajouter le médicament à la liste des médicaments commandés
                    controller.addMedicamentToCommandList(
                        controller.medicamentList[int.parse(id)]);
                    print(controller.commandList.length);
                  },
                  child: Text('Ajouter au panier',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
