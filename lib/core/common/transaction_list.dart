import 'package:flutter/material.dart';

import '../controllers/transactions.dart';
import '../models/Transactions.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height * 0.65,
            child: FutureBuilder(
              future: getTransactions(
                  '12355fb20a3a7986dd45af8ce95323d99fd5979ad50fbed3981da8a04b66b144'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Transactions>? transactions =
                      snapshot.data?.transactions;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        //Todo: Change transaction type if receiver address is same as current user address
                        transaction: TransactionType.received,
                        amount: transactions![index].amount.toString(),
                        message:
                            'Transaction made to ${transactions[index].receiverAddress}',
                        date: transactions[index].date.toString(),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
