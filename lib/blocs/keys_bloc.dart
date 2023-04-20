import 'package:hive/hive.dart';

import 'event.dart';
import 'package:bloc/bloc.dart';

abstract class KeyEvent extends Event {}

class SetPublicKeyEvent extends KeyEvent {
  final String publicKey;

  SetPublicKeyEvent(this.publicKey);
}

//get Data using publicKey and privateKey getters
class SetPrivateKeyEvent extends KeyEvent {
  final String privateKey;

  SetPrivateKeyEvent(this.privateKey);
}

class KeyBloc extends Bloc<KeyEvent, bool> {
  final _box = Hive.box('main');
  String get privateKey {
    final x = _box.get('privateKey');
    if (x == null) {
      return "";
    } else {
      return x;
    }
  }

  String get publicKey {
    final x = _box.get('publicKey');
    if (x == null) {
      return "";
    } else {
      return x;
    }
  }

  KeyBloc() : super(false) {
    on<SetPrivateKeyEvent>((event, emit) {
      _box.put('privateKey', event.privateKey);
      emit(!state);
    });
    on<SetPublicKeyEvent>((event, emit) {
      _box.put('publicKey', event.publicKey);
      emit(!state);
    });
  }
}
