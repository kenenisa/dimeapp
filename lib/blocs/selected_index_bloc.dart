import 'package:bloc/bloc.dart';
import 'package:nuvio/blocs/event.dart';

abstract class SelectedIndexEvent extends Event {}

class SetSelectedIndex extends SelectedIndexEvent {
  SetSelectedIndex(this.newIndex);
  final int newIndex;
}

//Get values using .state

class SelectedIndexBloc extends Bloc<SelectedIndexEvent, int> {
  SelectedIndexBloc([int initIndex = 0]) : super(initIndex) {
    on<SetSelectedIndex>((event, emit) => emit(event.newIndex));
  }
}
