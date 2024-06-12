import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pharmacy_app/EndPoint/url_const.dart';
import 'package:pharmacy_app/Patient/service/login_service.dart';
import 'package:pharmacy_app/Patient/model/ligne_commande.dart';
import 'package:pharmacy_app/livreur/controller/signin_controller.dart';

class CommandService {
  Dio dio = Dio();

  Future<void> createCommand(Command command) async {
    final url = '$baseUrl/commandemedic/';
    log('request ${command.toJson()}'); // Log the request data
    final token = await getToken();
    print("Token retrieved: $token");

    try {
      final response = await dio.post(
        url,
        data: command.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('response ${response.data}');
      if (response.statusCode == 201) {
        log('Command created successfully');
      } else {
        log('Failed to create command');
        throw Exception('Failed to create command');
      }
    } catch (e) {
      print('Exception during createCommand: $e');
      throw Exception('Failed to create command');
    }
  }
}





// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:pharmacy_app/EndPoint/url_const.dart';
// import 'package:pharmacy_app/Patient/service/login_service.dart';
// import 'package:pharmacy_app/Patient/model/ligne_commande.dart';
// import 'package:pharmacy_app/livreur/controller/signin_controller.dart';

// class CommandService {
//   Dio dio = Dio();

//   Future<void> createCommand(Command command) async {
//     final url = Uri.parse('$baseUrl/commandemedic/');
//     log('request ${command.toJson()}');
//     final token = await getToken();
//     print("Token retrieved: $token");

//     final response = await dio.post(
//       '$baseUrl/commandemedic/',
//       data: command.toJson(),
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       ),
//     );
//     log('response ${response.data}');
//     if (response.statusCode == 201) {
//       log('Command created successfully');
//     } else {
//       log('Failed to create command');
//       throw Exception('Failed to create command');
//     }
//   }
// }




























// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:pharmacy_app/EndPoint/url_const.dart';
// import 'package:pharmacy_app/Patient/controller/login_controller.dart';
// import 'package:pharmacy_app/Patient/model/ligne_commande.dart';

// class CommandService {
//   Dio dio = Dio();

//   Future<void> createCommand(Command command) async {
//     final url = Uri.parse('$baseUrl/commandemedic/');
//     log('request ${command.toJson()}');
//     final token = await getToken();
//     print(token);
//     print("===========================================");
//     final response = await dio.post(
//       '$baseUrl/commandemedic/',
//       data: command.toJson(),
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       ),
//     );
//     log('response ${response.data}');
//     if (response.statusCode == 201) {
//       log('Command created successfully');
//     } else {
//       log('Failed to create command');
//       throw Exception('Failed to create command');
//     }
//   }
// }





