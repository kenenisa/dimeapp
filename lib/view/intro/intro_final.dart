import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:nuvio/blocs/keys_bloc.dart';
import 'package:nuvio/core/common/home.dart';
import 'package:nuvio/view/intro/service/create_account.dart';
import 'package:provider/provider.dart';

import '../../core/common/button.dart';

class IntroFinal extends StatelessWidget {
  const IntroFinal({super.key});

  Future<void> generateKeyPair(BuildContext context) async {
    final key = await RSA.generate(2048);
    final bloc = Provider.of<KeyBloc>(context, listen: false);

    bloc.add(SetPrivateKeyEvent(key.privateKey));
    bloc.add(SetPublicKeyEvent(key.publicKey));
    debugPrintThrottled('keys ' + bloc.privateKey);
    Navigator.of(context).pushNamed('/change_pass_intro');
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/intro_4.jpg"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 200,
          child: Column(
            children: [
              DimeButton(
                onTap: () {
                  generateKeyPair(context);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (context) => const Home(),
                  //   ),
                  //   (route) => false,
                  // );
                },
                text: "Create Account",
                color: Theme.of(context).colorScheme.secondary,
              ),
              DimeButton(
                onTap: () {},
                text: "Restore Account",
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      );
    });
  }
}
