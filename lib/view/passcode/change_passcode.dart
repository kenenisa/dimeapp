import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:nuvio/core/common/keypad.dart';

class ChangePasscode extends StatefulWidget {
  ChangePasscode({this.goToHome = false, super.key});
  final bool goToHome;
  final TextEditingController _cnt = TextEditingController();

  @override
  State<ChangePasscode> createState() =>
      _ChangePasscodeState(goToHome, _cnt, KeyPad(_cnt));
}

class _ChangePasscodeState extends State<ChangePasscode> {
  final bool _goToHome;
  _ChangePasscodeState(this._goToHome, this._cnt, this._keyPad);
  bool _show = false;
  String _pass = "";
  final KeyPad _keyPad;
  final TextEditingController _cnt;
  static const _textStyle = TextStyle(fontSize: 30, color: Colors.white);
  @override
  void initState() {
    super.initState();
    _cnt.addListener(() {
      setState(() {
        _pass = _cnt.text;
        //  _box.put('password', _pass);
      });
    });
  }

  final _box = Hive.box('main');
  @override
  Widget build(BuildContext context) {
    final String pass = !_show ? ('*' * _pass.length) : _pass;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("Change Passcode"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.3,
            )),
            ListTile(
              leading: const SizedBox(),
              title: Text(
                pass,
                style: _textStyle,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _show = !_show;
                  });
                },
              ),
            ),
            Expanded(flex: 3, child: _keyPad),
            Center(
              child: TextButton(
                  child: const Text("Change Passcode"),
                  onPressed: () {
                    _box.put('password', _pass);
                    if (!_goToHome) {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => const SimpleDialog(
                                title: Text("Passcode changed!"),
                              ));
                    } else {
                      Navigator.of(context).pushNamed('/home');
                    }
                  }),
            )
          ],
        ));
  }
}
