import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class RenoteMedicamentService {
  var client = http.Client();
  var renoteUrl = '$baseUrl/medicaments/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$renoteUrl'));

    return response;
  }
}
