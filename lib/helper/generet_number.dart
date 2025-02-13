import 'dart:convert';

import 'package:crypto/crypto.dart';

int generateUserId(String email) {
  var bytes = utf8.encode(email);
  var digest = sha256.convert(bytes);
  var hashString = digest.toString();
  var hashNumber = int.parse(hashString.substring(0, 8), radix: 16);
  return hashNumber % 300;
}

String formatUserId(int userId) {
  return userId.toString().padLeft(3, '0');
}