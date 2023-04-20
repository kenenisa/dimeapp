import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:nuvio/blocs/event.dart';

import '../core/controllers/transactions.dart';

abstract class BalanceEvent extends Event {}

//get data using .state
class SetBalanceEvent extends BalanceEvent {
  SetBalanceEvent(this.newBalance);
  final double newBalance;
}

class BalanceBloc extends Bloc<BalanceEvent, double> {
  BalanceBloc([double initBalance = 0.0]) : super(initBalance) {
    on<SetBalanceEvent>((event, emit) => emit(event.newBalance));
  }
  init(String publicKey) async {
    debugPrintThrottled('Init running with $publicKey');
    if (publicKey != '') {
      final trans = await getTransactions(publicKey);
      if (trans != null) {
        debugPrintThrottled('Got ammount');
        final double amm = trans.amount?.toDouble() ?? 0;
        emit(amm);
      } else {
        debugPrintThrottled('No got amm');
      }
    }
  }
}
