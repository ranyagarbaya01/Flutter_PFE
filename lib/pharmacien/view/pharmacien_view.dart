import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/pharmacien/controller/pharmacien_controller.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';
import 'package:pharmacy_app/pharmacien/service/pharmacien_service.dart';

class DemandPharmacie extends StatefulWidget {
  const DemandPharmacie({super.key});

  @override
  State<DemandPharmacie> createState() => _DemandPharmacieState();
}

class _DemandPharmacieState extends State<DemandPharmacie> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController latitudeTextEditingController = TextEditingController();
  TextEditingController longitudeTextEditingController =
      TextEditingController();
  TextEditingController codesecuriteTextEditingController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var hour = 0;
  var minute = 0;
  var hour1 = 0;
  var minute1 = 0;
  var timeformat = "AM";
  var timeformate = "AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
          },
        ),
        title: const Center(
          child: Text(
            "Demande du pharmacien ",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Bienvenue à PharmaEase",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  "Ajouter votre",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const Text(
                  "Pharmacie",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: userNameTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Nom du pharmacie",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Votre Email",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText:
                      true, // Ajout de cette ligne pour masquer le texte
                  decoration: const InputDecoration(
                    labelText: "Votre mot de passe",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: latitudeTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Latitude du pharmacie",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: longitudeTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "longitude du pharmacie",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: codesecuriteTextEditingController,
                  keyboardType: TextInputType.number,
                  obscureText:
                      true, // Ajout de cette ligne pour masquer le texte
                  decoration: const InputDecoration(
                    labelText: "Code de sécurité",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Heure d'ouverture:",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 219, 101),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberPicker(
                        minValue: 0,
                        maxValue: 12,
                        value: hour1,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            hour1 = value;
                          });
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
                        )),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        value: minute1,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            minute1 = value;
                          });
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
                        )),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                timeformat = "AM";
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                  color: timeformat == "AM"
                                      ? const Color.fromARGB(255, 56, 55, 55)
                                      : Colors.grey.shade700,
                                  border: Border.all(
                                    color: timeformat == "AM"
                                        ? Colors.grey
                                        : Colors.grey.shade700,
                                  )),
                              child: const Text(
                                "AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                timeformat = "PM";
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                  color: timeformat == "PM"
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade700,
                                  border: Border.all(
                                    color: timeformat == "PM"
                                        ? Colors.grey
                                        : Colors.grey.shade700,
                                  )),
                              child: const Text(
                                "PM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Heure de fermeture:",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 219, 101),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberPicker(
                        minValue: 0,
                        maxValue: 12,
                        value: hour,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            hour = value;
                          });
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
                        )),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        value: minute,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          setState(() {
                            minute = value;
                          });
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
                        )),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                timeformate = "AM";
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                  color: timeformate == "AM"
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade700,
                                  border: Border.all(
                                    color: timeformate == "AM"
                                        ? Colors.grey
                                        : Colors.grey.shade700,
                                  )),
                              child: const Text(
                                "AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                timeformate = "PM";
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                  color: timeformate == "PM"
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade700,
                                  border: Border.all(
                                    color: timeformate == "PM"
                                        ? Colors.grey
                                        : Colors.grey.shade700,
                                  )),
                              child: const Text(
                                "PM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (userNameTextEditingController.text.trim().length <
                          3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Le nom du pharmacie doit contenir au moins 3 caractères."),
                          ),
                        );
                      } else if (!emailTextEditingController.text
                          .contains("@")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Votre email est invalide."),
                          ),
                        );
                      } else if (passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez entrer un mot de passe."),
                          ),
                        );
                      } else if (codesecuriteTextEditingController
                          .text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Veuillez entrer le code de sécurité."),
                          ),
                        );
                      } else if (latitudeTextEditingController.text.isEmpty) {
                        // Assuming you have a latitudeTextEditingController for the latitude field
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez entrer la latitude."),
                          ),
                        );
                      } else if (longitudeTextEditingController.text.isEmpty) {
                        // Assuming you have a longitudeTextEditingController for the longitude field
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez entrer la longitude."),
                          ),
                        );
                      } else {
                        try {
                          // Fetch the list of codesec from the backend
                          List<int> codesecList =
                              await PharmacieService.getAllCodesec();

                          if (!codesecList.contains(int.parse(
                              codesecuriteTextEditingController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Code de sécurité invalide."),
                              ),
                            );
                            return;
                          }

                          await PharmacieController.savePharmacie(
                            User(
                              username: userNameTextEditingController.text,
                              password: passwordController.text,
                              isActive: true,
                            ),
                            emailTextEditingController.text,
                            DateTime.now(),
                            DateTime.now().add(Duration(hours: 8)),
                            double.parse(
                                double.parse(latitudeTextEditingController.text)
                                    .toStringAsFixed(6)),
                            double.parse(double.parse(
                                    longitudeTextEditingController.text)
                                .toStringAsFixed(6)),
                            int.parse(codesecuriteTextEditingController.text),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Pharmacie ajoutée avec succès."),
                            ),
                          );

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        } catch (e) {
                          print("Erreur lors de l'ajout de pharmacie : $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Pharmacie ajoutée avec succès."),
                            ),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 22, 219, 101),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
                    ),
                    child: const Text(
                      "Ajouter",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
