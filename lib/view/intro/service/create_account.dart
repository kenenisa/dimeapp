import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

var url = Uri.https('dime.onrender.com', 'account/create');

Future<void> createAccount(String publicKey, String privateKey) async {
  try {
    print("Creating account...");
    final response = await http.post(url, body: {
      'publicKey': publicKey,
      'privateKey': privateKey,
    });
    print(response.statusCode);
    print(response.body);
  } catch (e) {
    print(e);
  }
}
