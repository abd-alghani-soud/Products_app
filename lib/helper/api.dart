import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(uri), headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception(
        "there is a problem with status code ${response.statusCode} and body's ${json.decode(response.body)}",
      );
    }
  }

  Future<dynamic> put(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    debugPrint('url $url body $body $token');
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      debugPrint('$data');
      return data;
    } else {
      throw Exception(
        "there is a problem with status code ${response.statusCode} and body's ${json.decode(response.body)}",
      );
    }
  }
}
/*
      headers
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
 */