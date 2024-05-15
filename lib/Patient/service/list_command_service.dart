import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class ListCommandeService {
  var client = http.Client();
  var listUrl = '$baseUrl/commandemedic/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$listUrl'));

    return response;
  }
}
