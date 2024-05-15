import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/controller/login_controller.dart';

import '../service/login_service.dart';

class CommandeController {
  static Future<void> passerCommande(
    String idPatient,
    File? ordonnanceImageFile,
    File? cnamImageFile,
    String description,
    String? confirmAdresse,
    String pharmacieId,
    BuildContext context,
  ) async {
    // Vérifier si l'image de l'ordonnance est sélectionnée
    if (ordonnanceImageFile == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Veuillez sélectionner une image de l\'ordonnance.'),
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
    }

    // Vérifier si l'adresse est confirmée
    if (confirmAdresse == null || confirmAdresse.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text(
                'Veuillez confirmer votre adresse avant de passer la commande.'),
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
    }
    // Vérifier si la pharmacie est sélectionnée
    // if (pharmacieLocation == null || pharmacieLocation.isEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Erreur'),
    //         content: Text(
    //             'Veuillez sélectionner une pharmacie avant de passer la commande.'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    final String apiUrl = '$baseUrl/commandes/';

    // Créer une requête multipart pour envoyer les données avec les images
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(apiUrl),
    );
    final token = await getToken();
    print(token);
    print("===========================================");

    // Ajouter les données de la commande
    request.fields['description'] = description;
    request.fields['patient'] = userId.toString();
    request.fields['confirmadresse'] = confirmAdresse;
    request.fields['pharmacies'] = pharmacieId;
    await getToken().then((token) {
      request.headers['Authorization'] = 'Token $token';
    });

    // Ajouter l'image de l'ordonnance
    var ordonnanceStream = http.ByteStream(ordonnanceImageFile.openRead());
    var length = await ordonnanceImageFile.length();
    var ordonnanceMultipartFile = http.MultipartFile(
      'ordonnance',
      ordonnanceStream,
      length,
      filename: basename(ordonnanceImageFile.path),
    );
    request.files.add(ordonnanceMultipartFile);

    // Ajouter l'image du CNAM si elle est fournie
    if (cnamImageFile != null) {
      var cnamStream = http.ByteStream(cnamImageFile.openRead());
      length = await cnamImageFile.length();
      var cnamMultipartFile = http.MultipartFile(
        'cnam',
        cnamStream,
        length,
        filename: basename(cnamImageFile.path),
      );
      request.files.add(cnamMultipartFile);
    }

    // Envoyer la requête
    var streamedResponse = await request.send();

// Convert the StreamedResponse to Response
    var response = await http.Response.fromStream(streamedResponse);

// Print the status code and the body of the response
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    // Vérifier le statut de la réponse

    print('Commande envoyée avec succès. ');
    // Afficher un message de succès
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Commande passée'),
          content: Text('Votre commande a été passée avec succès. '),
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
  }
}
