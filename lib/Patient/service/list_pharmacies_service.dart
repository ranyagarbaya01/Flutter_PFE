import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class ListPharmacieService {
  var client = http.Client();
  var pharmUrl = '$baseUrl/pharmacies/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$pharmUrl'));

    return response;
  }
}
