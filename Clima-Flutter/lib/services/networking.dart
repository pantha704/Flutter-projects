import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future fetch(url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = response.body;
      return jsonDecode(data);
    } catch (error) {
      print(error);
    }
  }
}
