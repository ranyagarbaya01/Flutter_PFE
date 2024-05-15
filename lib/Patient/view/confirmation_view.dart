import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Patient/controller/list_pharmacies_controller.dart';
import 'package:pharmacy_app/Patient/controller/panier_controller.dart';
import 'package:pharmacy_app/Patient/view/payment_view.dart';
import 'package:pharmacy_app/pharmacien/model/pharmacien_model.dart';

import '../controller/commande_controller.dart';

class Confirmation extends StatefulWidget {
  String confirmation_adresse;

  Confirmation({
    Key? key,
    required this.confirmation_adresse,
  }) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final ListPharmacieController listPharmacieController =
      Get.put(ListPharmacieController());

  Pharmacie? selectedPharmacie;
  String _locationMessage = '';
  Pharmacie? nearestPharmacie;
  bool isLoading = false;

 TextEditingController _adresseController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    setState(() {
      isLoading = true; // Start loading
    });
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, prompt the user to enable them
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Location Services Disabled"),
            content: Text(
                "Please enable location services to access your location."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    // Request location permissions
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Location permissions are denied, show error message
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Location Permissions Denied"),
            content: Text(
                "Please grant location permissions to access your location."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    // Get current location
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double nearestDistance = double.infinity;

    // Calculate distance between current location and pharmacies
    for (var pharmacie in listPharmacieController.pharmacieList) {
      double distance = await Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        pharmacie.latitude!,
        pharmacie.longitude!,
      );

      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestPharmacie = pharmacie;
      }
    }

    setState(() {
      _locationMessage =
          'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des pharmacies'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _adresseController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Adresse de livraison',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _getCurrentLocation,
                      child: Text(
                        'Obtenir la localisation',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            255, 22, 219, 101), // Couleur de fond du bouton
                        onPrimary: Colors.white, // Couleur du texte du bouton
                        padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20), // Espacement interne du bouton
                        shape: RoundedRectangleBorder(
                          // Forme du bouton
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pharmacie la plus proche : ${nearestPharmacie?.user?.username ?? 'Aucune'}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            _locationMessage,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Obx(() {
              if (listPharmacieController.isListPharmacieLoading.value)
                return Center(child: CircularProgressIndicator());
              else {
                return ListView.builder(
                  itemCount: listPharmacieController.pharmacieList.length,
                  itemBuilder: (context, index) {
                    final pharmacie =
                        listPharmacieController.pharmacieList[index];
                    return ListTile(
                      title: Text(pharmacie.user?.username ?? ''),
                      subtitle: Text(
                          'Latitude: ${pharmacie.latitude}, Longitude: ${pharmacie.longitude}'),
                    );
                  },
                );
              }
            }),
          ),
          Center(
            child: InkWell(
              onTap: () async {
                print(nearestPharmacie?.id);
                CommandController commandController = CommandController();
                await commandController.createCommand(
                  widget.confirmation_adresse,
                  nearestPharmacie!.id!.toString(),
                  context,
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 22, 219, 101)),
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  'Commander',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
