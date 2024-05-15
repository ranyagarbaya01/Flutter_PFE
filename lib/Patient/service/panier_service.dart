import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/controller/login_controller.dart';
import 'dart:convert';
import 'package:pharmacy_app/Patient/model/ligne_commande.dart';

class CommandService {
  Dio dio = Dio();
  Future<void> createCommand(Command command) async {
    final url = Uri.parse('$baseUrl/commandemedic/');
    // Update URL
    // final response = await http.post(
    //   url,
    //   body: jsonEncode(command.toJson()),
    // );
    log('response ${command.toJson()}');
    final token = await getToken();
    print(token);
    print("===========================================");
    // http: //127.0.0.1:8000/commandemedic/
    final response = await dio.post(
      '$baseUrl/commandemedic/',
      data: command.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Token $token', // Add bearer token
        },
      ), 
    );
    log('response ${response.data}');
    if (response.statusCode == 201) {
      // Command created successfully
      log('Command created successfully');
    } else {
      log('Failed to create command');

      throw Exception('Failed to create command');
    }
  }
}
