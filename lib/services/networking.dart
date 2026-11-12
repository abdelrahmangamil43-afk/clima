import 'package:http/http.dart' as http;
import 'dart:convert';
//get api request and return data in json
class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    var uri = Uri.parse(url); // هنا بنحوّل النص لـ Uri علشان http.get يفهمه

    http.Response response = await http.get(uri);
   print("StatusCode ${response.statusCode}");
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    throw Exception('Failed to load coin data');
  }
}
