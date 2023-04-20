import 'package:bloc/bloc.dart';
import 'package:nuvio/blocs/event.dart';

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
}
