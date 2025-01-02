import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri}) async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
