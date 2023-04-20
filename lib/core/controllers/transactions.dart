import 'dart:convert';

import 'package:nuvio/core/controllers/generator.dart';

import '../models/Transactions.dart';

Future<TransactionsModel> getTransactions(String address) async {
  var url = Uri.https('dime.onrender.com', 'wallet/info/{$address}');

  try {
    var http;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return TransactionsModel.fromJson(jsonDecode(response.body));
      print(response.body);
    } else {
      throw Exception('Failed to load transactions');
    }
  } catch (e) {
    print(e);
  }
  return TransactionsModel();
}

Future<TransactionsModel> sendMoney(String publicAddress,
    String receiverAddress, int amount, String privateKey) async {
  var url = Uri.https('dime.onrender.com', 'wallet/send');
  var signature = await generateSignature(
      publicAddress, receiverAddress, amount, privateKey);

  var payload = {
    'publicAddress': publicAddress,
    'receiverAddress': receiverAddress,
    'amount': amount,
    'signature': signature,
    'privateKey': privateKey,
    'date': DateTime.now().toIso8601String(),
    'uniqueTransactionToken': uniqueTransactionToken(),
  };

  try {
    var http;
    final response = await http.post(
      url,
      payload,
    );
    if (response.statusCode == 200) {
      return TransactionsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load transactions');
    }
  } catch (e) {
    print(e);
  }
  return TransactionsModel();
}
