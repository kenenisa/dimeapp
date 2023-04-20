import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/common/button.dart';

class IntroFinal extends StatelessWidget {
  const IntroFinal({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
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
  }
}
