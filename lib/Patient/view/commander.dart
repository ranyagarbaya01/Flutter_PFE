import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pharmacy_app/Patient/view/list_pharmacies_view.dart';

class PassCommand extends StatefulWidget {
  const PassCommand({super.key});

  @override
  State<PassCommand> createState() => _PassCommandState();
}

class _PassCommandState extends State<PassCommand> {
   File ?_image;
   File ? _image1;
  TextEditingController _commentaireController = TextEditingController();
  TextEditingController _adresseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Text(
            'Pour commander',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //to add the prescription
              Text(
                'Ajouter votre ordonnance',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "images/prescription.png",
                      width: 110,
                      height: 110,
                    ),
              CustomButton(
                title: 'Choisir une image',
                icon: Icons.image_outlined,
                onClick: () => getImage(ImageSource.gallery, true),
              ),
              CustomButton(
                title: 'Prendre une image',
                icon: Icons.camera,
                onClick: () => getImage(ImageSource.camera, true),
              ),
              SizedBox(
                height: 20,
              ),
              //to add the cnam
              Text(
                'Ajouter votre fiche de cnam',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              _image1 != null
                  ? Image.file(
                      _image1!,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "images/cnam.png",
                      width: 110,
                      height: 110,
                    ),
              CustomButton(
                title: 'Choisir une image',
                icon: Icons.image_outlined,
                onClick: () => getImage(ImageSource.gallery, false),
              ),
              CustomButton(
                title: 'Prendre une image',
                icon: Icons.camera,
                onClick: () => getImage(ImageSource.camera, false),
              ),
              //to add the description
              SizedBox(
                width: 250,
                height: 80,
                child: TextField(
                  controller: _commentaireController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Commentaire',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                height: 80,
                child: TextField(
                  controller: _adresseController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Confirmation d\'adresse',
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 22, 219, 101), // background color
                    onPrimary: Colors.white, // text color
                  ),
                  onPressed: () {
                    if (_image == null || _adresseController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erreur'),
                            content: Text(
                                'Veuillez sélectionner une image de l\'ordonnance.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPharmaciesDetails(
                            image: _image!,
                            image1: _image1,
                            commentaire: _commentaireController.text,
                            confirmationAdresse: _adresseController.text,
                          ),
                        ),
                      ); //to add the map
                    }
                  },
                  child: Text('Choisir la plus proche pharmacie'),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(ImageSource source, bool isPrescription) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        if (isPrescription) {
          this._image = imagePermanent;
        } else {
          this._image1 = imagePermanent;
        }
      });
    } on PlatformException catch (e) {
      print('Erreur: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 260,
    child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 22, 219, 101)),
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        )),
  );
}
