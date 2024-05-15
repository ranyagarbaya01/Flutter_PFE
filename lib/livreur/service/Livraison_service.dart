import 'package:http/http.dart' as http;
import 'package:pharmacy_app/EndPoint/url_const.dart';

class LivraisonService {
  var client = http.Client();
  var livUrl = '$baseUrl/livraisons/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$livUrl'));
    print(response.body);
    return response;
  }

  Future<dynamic> updateLivraison(int id) async {
    print("ksdjrgbslergbsgk: ! $id");
    var response = await http.patch(Uri.parse('$baseUrl/livraisonlist/$id/'));
    return response;
  }
}
