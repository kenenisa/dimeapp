import 'dart:convert';

import '../models/Transactions.dart';

Future<TransactionsModel> getTransactions(String address) async {
  var url = Uri.https('dime.onrender.com', 'wallet/info/{$address}');

  try {
    var http;
    final response = await http.get(url);
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
