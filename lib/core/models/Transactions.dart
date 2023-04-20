class TransactionsModel {
  int? amount;
  List<Transactions>? transactions;

  TransactionsModel({this.amount, this.transactions});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? publicAddress;
  String? publicKey;
  String? receiverAddress;
  int? amount;
  String? signature;
  String? date;
  String? uniqueTransactionToken;

  Transactions(
      {this.publicAddress,
      this.publicKey,
      this.receiverAddress,
      this.amount,
      this.signature,
      this.date,
      this.uniqueTransactionToken});

  Transactions.fromJson(Map<String, dynamic> json) {
    publicAddress = json['publicAddress'];
    publicKey = json['publicKey'];
    receiverAddress = json['receiverAddress'];
    amount = json['amount'];
    signature = json['signature'];
    date = json['date'];
    uniqueTransactionToken = json['uniqueTransactionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicAddress'] = this.publicAddress;
    data['publicKey'] = this.publicKey;
    data['receiverAddress'] = this.receiverAddress;
    data['amount'] = this.amount;
    data['signature'] = this.signature;
    data['date'] = this.date;
    data['uniqueTransactionToken'] = this.uniqueTransactionToken;
    return data;
  }
}
