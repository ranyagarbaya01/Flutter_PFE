import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

import 'login_service.dart';

class ListCommandeService {
  var client = http.Client();
  var listUrl = '$baseUrl/utilisateurs/$userId/commandes/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$listUrl'));
    print(response.body);
    return response;
  }
}
