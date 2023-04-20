import 'package:flutter/material.dart';

import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/qr/qr.dart';
import 'package:nuvio/view/deposit/deposit.dart';
import 'package:nuvio/view/intro/intro.dart';
import 'package:nuvio/view/intro/intro_final.dart';
import 'package:nuvio/view/passcode/change_passcode.dart';
import 'package:nuvio/view/passcode/enter_passcode.dart';
import 'package:nuvio/view/qr/my_qr.dart';
import 'package:nuvio/view/plans/plans.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:nuvio/view/rec/rec.dart';
import 'package:nuvio/view/send/send.dart';
import 'package:nuvio/view/send/send_text.dart';
import 'package:nuvio/view/withdrawal/with.dart';
import 'package:provider/provider.dart';

import 'blocs/balance_bloc.dart';
import 'blocs/keys_bloc.dart';
import 'blocs/plans_bloc.dart';
import 'blocs/selected_index_bloc.dart';
import 'core/common/home.dart';
import 'core/common/keypad.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:nuvio/view/plans/edit_plan.dart';

import 'core/common/home.dart';
import 'view/loan/loan_form.dart';
import 'view/plans/plan_detail.dart';
import 'view/webhook/webhook.dart';

import 'dart:io';

final _balanceBloc = BalanceBloc();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbPath = (await getApplicationDocumentsDirectory()).path;
  Hive.init(dbPath);
  await Hive.openBox('main');
  print("Map+ " + Hive.box('main').get('publicKey'));
  final _box = Hive.box('main');
  final pk = _box.get('privateKey');
  await _balanceBloc.init(pk == null ? "" : pk);
  // await Hive.box('main').clear(); //<- Use this to test KENI
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _box = Hive.box('main');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (ctx) => _balanceBloc,
          ),
          Provider(
            create: (ctx) => KeyBloc(),
          ),
          Provider(
            create: (ctx) => PlansBloc(),
          ),
          Provider(
            create: (ctx) => SelectedIndexBloc(),
          )
        ],
        builder: (context, __) {
          return MaterialApp(
              title: 'Dime',
              theme: ThemeData(
                textTheme: GoogleFonts.interTextTheme(
                  ThemeData.light().textTheme,
                ),
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF95FFA1),
                  secondary: Color(0XFFF2FE8D),
                  error: Colors.redAccent,
                  background: Color(0xFF0b0d0f),
                  surface: Color(0xFF101213),
                  onSurface: Color(0xFF000000),
                  onBackground: Color(0xFF6a6a6a),
                ),
              ),
              initialRoute: //'/send_text',
                  _box.containsKey('password') ? '/enter_pass' : '/intro',
              // routes: {
              //   '/home': (context) => const MyHomePage(title: 'Dime App'),
              //   '/plan_details': (context) => const PlanDetailScreen(),
              //   '/create_plan': (context) => const EditPlanScreen(),
              //   '/loan_form': (context) => const LoanFormScreen(),
              //   '/webhook': (context) => const WebhookScreen(),
              // },
              //white surface background onBackground
              onGenerateRoute: (settings) {
                final args = settings.arguments;
                switch (settings.name) {
                  case '/home':
                    return MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: 'Dime App'));
                  case '/plan_details':
                    return MaterialPageRoute(
                        builder: (context) => const PlanDetailScreen());
                  case '/create_plan':
                    return MaterialPageRoute(
                        builder: (context) => const EditPlanScreen());
                  case '/loan_form':
                    return MaterialPageRoute(
                        builder: (context) => const LoanFormScreen());
                  case '/webhook':
                    return MaterialPageRoute(
                        builder: (context) => const WebhookScreen());
                  case '/enter_pass':
                    return MaterialPageRoute(
                        builder: (context) => EnterPasscode());
                  case '/change_pass':
                    return MaterialPageRoute(
                        builder: (context) => ChangePasscode());
                  case '/change_pass_intro':
                    return MaterialPageRoute(
                        builder: (context) => ChangePasscode(goToHome: true));
                  case '/withdraw':
                    return MaterialPageRoute(
                        builder: (context) => WithdrawView());
                  case '/send_text':
                    return MaterialPageRoute(builder: (context) {
                      if (args == null) return SendText();
                      return SendText(toHash: (args as Map)['hash'] as String);
                    });
                  case '/deposit':
                    return MaterialPageRoute(
                        builder: (context) => DepositView());
                  case '/rec':
                    return MaterialPageRoute(
                        builder: (context) => RecieveView());
                  case '/scan':
                    return MaterialPageRoute(
                        builder: (context) => const QrView());
                  case '/send':
                    {}
                    return MaterialPageRoute(builder: (context) {
                      final hash = (args as Map)['hash'] as String;
                      final name = (args as Map)['name'] as String;
                      return Send(name, hash);
                    });
                  case '/intro':
                    return MaterialPageRoute(
                        builder: (context) => const IntroView());
                  case '/intro_f':
                    return MaterialPageRoute(
                        builder: (context) => const IntroFinal());
                  case '/test':
                    return MaterialPageRoute(
                        builder: (context) => TestKeyPad());
                  case '/my_qr':
                    return MaterialPageRoute(builder: (context) => MyQr());
                  // MyQr("Nablox", "8ye3943nyd83y83hrndoenfjn", "20"));
                  default:
                    return MaterialPageRoute(builder: (context) => QrView());
                }
              });
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}
