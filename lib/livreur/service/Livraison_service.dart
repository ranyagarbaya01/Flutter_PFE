import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class LivraisonService {
  var client = http.Client();
  var livUrl = '$baseUrl/livraisons/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(livUrl));
    print(response.body);
    return response;
  }

  Future<dynamic> updateLivraisonStatus(int livr_id, int livreurId) async {
    print(
        "Calling updateLivraisonStatus for ID: $livr_id with livreurId: $livreurId");
    var response = await client.patch(
      Uri.parse('$baseUrl/livraison/$livr_id/status/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'livreurId': livreurId}),
    );
    print("Response status for updateLivraisonStatus: ${response.statusCode}");
    return response;
  }

  Future<dynamic> updateLivraisonTermine(int livr_id, int livreurId) async {
    print(
        "Calling updateLivraisonTermine for ID: $livr_id with livreurId: $livreurId");
    var response = await client.patch(
      Uri.parse('$baseUrl/Livraisons/$livr_id/termine/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'livreurId': livreurId}),
    );
    print("Response status for updateLivraisonTermine: ${response.statusCode}");
    return response;
  }
}
