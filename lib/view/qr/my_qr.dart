import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuvio/blocs/balance_bloc.dart';
import 'package:nuvio/blocs/keys_bloc.dart';
import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/qr/qr.dart';
import 'package:provider/provider.dart';

class MyQr extends StatefulWidget {
  MyQr({
    super.key,
  });

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  _MyQrState();
  String _hideHalf(String s) {
    List<String> newStr = s.split('');
    for (int i = newStr.length - 3; i >= 2; i--) {
      newStr[i] = '*';
    }
    return newStr.join();
  }

  @override
  Widget build(BuildContext context) {
    final String _myName = "Nablox";

    // final String _myAmmount =
    //     (Provider.of<BalanceBloc>(context, listen: false)).state.toString();
    return BlocBuilder<BalanceBloc, double>(builder: (context, myAmmount) {
      return BlocBuilder<KeyBloc, bool>(builder: (context, __) {
        final String myHash =
            (Provider.of<KeyBloc>(context, listen: false)).publicKey;
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Qr code"),
              centerTitle: true,
            ), //TODO change AppBar
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.4,
                )),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0x5B5B5B5B),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 20))),
                          leading: const SizedBox(),
                          subtitle: Text(
                            _hideHalf(myHash),
                            style: const TextStyle(color: Colors.white30),
                          ),
                          trailing: Text(
                            "\$$myAmmount",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          title: Text(
                            _myName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.4,
                )),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0x5B5B5B5B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: QrWidget(myHash))))
              ],
            ));
      });
    });
  }
}
