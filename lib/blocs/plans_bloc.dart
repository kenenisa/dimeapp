import 'package:bloc/bloc.dart';

import 'event.dart';

abstract class PlansEvent {}

class AddPlanEvent extends PlansEvent {
  final String plan;

  AddPlanEvent(this.plan);
}

class RemovePlanEvent extends PlansEvent {
  final String plan;

  RemovePlanEvent(this.plan);
}

class PlansBloc extends Bloc<PlansEvent, bool> {
  List<String> _plans = [];

  List<String> getPlans() {
    return _plans; //TODO make this a copy
  }

  PlansBloc([List<String> initPlans = const []]) : super(false) {
    _plans = initPlans;
    on<AddPlanEvent>((event, emit) {
      _plans.add(event.plan);
      emit(!state);
    });
    on<RemovePlanEvent>((event, emit) {
      _plans.remove(event.plan);
      emit(!state);
    });
  }
}
