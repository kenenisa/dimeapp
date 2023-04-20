import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nuvio/view/intro/service/create_account.dart';

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
              onTap: () => createAccount(
                '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA97Kg40/YRlnVt1Ni0Kqx\nZTZ1mKjl4uRvW0KDmXgA+BXD4lm98NPKgFYyRQZxJvhtwH8aA3p0a9eyamV5GcLK\nD4Q7WYSnKrmCq6Mp3f8oHSl/x4Km24zvTb2IDIbTKkmeMINf+mvA9VPYkS8RxRxC\nuUYtkyDPvomWuBtrCiGONJtkNJYhY/ZD92bf03ULgzOqOF7cuhQnF26yMVH1YAby\nCevHNA2+T6woUSXcQxNo9inAjMtCc3TizkoC3Ce0dUswBQAs7k/mx5Ae5FIjE7/a\n1a+Tik9jjkdfLtixJbWiNwLsz8aSE41pq/iilqfgtKzTzaTEhxE6X5pVOIQxKJnL\nuwIDAQAB\n-----END PUBLIC KEY-----\n"',
                "-----BEGIN ENCRYPTED PRIVATE KEY-----\nMIIFLTBXBgkqhkiG9w0BBQ0wSjApBgkqhkiG9w0BBQwwHAQIgzP5yU9EyWICAggA\nMAwGCCqGSIb3DQIJBQAwHQYJYIZIAWUDBAEqBBBs92UiTAR+barWZfqGmqPfBIIE\n0DV2XRICie/G+1p3JTA8gS3wepVwE91dUrBoitEhzBQezlWB2VHUVOv7rR5v+Tjb\nxPS0eCoR37Rq/OqsoLc5NkdZtX6KWzbaq6ZcQvE1knUxy34RazVdzeF5/p/J4lz4\nvlUPp8g04Lsgc4mbhZII3eM0JAZ1RaZmw/o8qqms4ce7TxqCbKUAE2PHtTsAUdUC\nA+Qtk8BtZdfo9bh+wStWn1u2iphg3M+h3/RMBBEx7yffOGEdbcomdILcqQcMba1t\n10XPHAm3nk0iqKOitN4e7T86Gh7HLgQlhN5HNfe06+1Ir8lHVvknmbyrUh9hcDp6\ne9oaWubK6I4kkhxG9JHJyDn0DG15//UimIwHPJk/Hy5LKQlel7+50dkiGoJ/jr89\nuoUvLKGvjIuBEBDO5DW9moarXVyvCcmkWOj2ytuoGkJFzGpJz0CbQk7zuXlR/w6e\nhPNKE2iFD0pGa/8roXzII7Ci0toMrNV9pF95xIIXRIxUKv/S535CWEC2kLPvG7zY\nuvTTG27SUg01n2dR5i36ImPFgy5Erb66HKmtcQN8xkTh95H+ss8ErLdOLHFUraBJ\nkycD14Umgb2FNH7isUOe3KkJcf+mBwCrHBnIRq6DOjXUaUM272Kvo3ixn8w5RMpZ\n0NA6bwAbQyXdOYn1WVDeuwFl6vUQqczvvYHS0HzyF6bey5Ll9wnhDJxIikY4WjjE\nHzX5z4NLeXpc2/ug2xkGgqI5Mfo2wWElmnO2oxFiHvttsqO75P8gojpQl6W1uWdu\nu7+SwjIUVYn0Sf2UNbYjYwWEB9Tjhjqlx8JCJOLsNXyp11QOPsc78wP0NEUFtenp\nWPHAMpsMtu2kqv1hFzjG/ykrFvGmJbBScN6Qgm8aldzxVPcx2Esq04C9kQx0iSTd\ngJ7R/QpwGYfCrnJVaVEmmoS3Z4Kw9Wr4c9G+8xH7Gx87lsdD/Du9AnPBlti6prmt\ncueNgggLBYGGMcq/QhPpp4SSBh9hX4heaHglUX2Es/cRd+CB3x8bGkccQ0OFOHuD\nnzaHy7SohaVNLCdp2myVn065nPax4z3K90WP9n+WERCaHP0HhSDc99bXeGwoVU1P\ne45tKp9XcVkfQeJeocJ8IOVXvxhCRIQjxmusKvejOXDD/lYGl10sL5+EhHMWbkrd\nxGR7fvk9NgONafMXaKoQPxy2u4fGKGM8WgGh/5jfuhgH/GrAWhp4gJaBXnlSwphn\n1HldN/1ea3MLCWXgOAglxPPCZP+HQZ/NBd6TPK9O62yGXRO0NGVplXVkP7gdTxae\nHKe8S29d8oqDQR3RbL1kDMinUTZEyzEpue1A0e/q5OMrU+bgFuquzPf1eoulthpM\n3ACmek8kjy7iZpTO2dPtnBjIM9mRO0IIXJn+XqM6fjtwpxP7rwSD6lsI2GhpkBwC\nYcMOWI3lTlobp5at5mldDrxWrXBp3TsZnqEnVuRScKZRxNv11RpdAZO3yPJVWDLX\nM6b6l+SKbkxNa3Q8HRDabPXKTQjHqcc2rMoG/VZ67K6OJSKeKVv54Tg/Ona/8HfH\njoAqHRcKRNd60PUgZJ8/iRzZTCvaWTqYBpq94EmV9YOylPTF8K2ZLcbe9zkb+WAd\nr2d2Zc7qm/TQ9z83Ew9ayov4NJbW1Ry4IvcO7QG05MbU\n-----END ENCRYPTED PRIVATE KEY-----\n",
              ).then((value) {
                Navigator.pushNamed(context, '/home');
              }),
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
