import 'package:flutter/material.dart';

class SendText extends StatefulWidget {
  SendText({super.key, this.toHash = ''});
  final String toHash;
  @override
  State<SendText> createState() {
    return _SendTextState(toHash, toHash == '');
  }
}

class _SendTextState extends State<SendText> {
  double _ammt = 0;
  String _toName = '';
  _SendTextState(this._toHash, this._mode);
  bool _mode;

  String _toHash;
  static const _textStyle = TextStyle(color: Colors.white);
  static const _inputDecor = InputDecoration(
      fillColor: Colors.white,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      hintStyle: TextStyle(color: Colors.white));
  static const _pushBelow = EdgeInsets.only(bottom: 10);
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Send"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: _pushBelow,
              child: TextField(
                style: _textStyle,
                onChanged: (s) {
                  _toName = s;
                },
                decoration: _inputDecor.copyWith(hintText: 'Name of the user'),
              ),
            ),
            Visibility(
              visible: _mode,
              child: Padding(
                padding: _pushBelow,
                child: TextField(
                  style: _textStyle,
                  onChanged: (s) {
                    _toHash = s;
                  },
                  decoration:
                      _inputDecor.copyWith(hintText: 'Hash of the user'),
                ),
              ),
            ),
            Padding(
              padding: _pushBelow,
              child: TextField(
                style: _textStyle,
                onChanged: (s) {
                  try {
                    _ammt = double.parse(s);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) => const SimpleDialog(
                              title: Text("Error in number format"),
                            ));
                  }
                },
                keyboardType: TextInputType.number,
                decoration: _inputDecor.copyWith(hintText: 'Ammount to Send'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/send',
                      arguments: {'name': _toName, 'hash': _toHash});
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(mq.size.width * 0.8, 60),
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: const Text("Send"))
          ],
        ));
  }
}
