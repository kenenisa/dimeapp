import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuvio/blocs/balance_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

import '../../core/common/transaction_card.dart';
import '../../core/common/transaction_list.dart';
import 'widgets/circle_icon_button.dart';
import 'widgets/small_plan_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final balanceBloc = Provider.of<BalanceBloc>(context, listen: false);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.surface,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // upper container
            Container(
              height: 250,
              width: width,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        // Text(
                        //   'Total Credit',
                        //   style: TextStyle(
                        //     color: colorScheme.onBackground,
                        //     fontSize: 16,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        BlocBuilder<BalanceBloc, double>(
                            builder: (context, ammount) {
                          return Text(
                            ammount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Text(
                          '150.00 loan limit',
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleIconButton(
                            onPressed: () {},
                            text: "Buy",
                            icon: Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          CircleIconButton(
                            onPressed: () {
                              debugPrintThrottled('going to my qr');
                              Navigator.of(context).pushNamed('/send_text');
                            },
                            text: 'Send',
                            icon: Icons.arrow_upward,
                            color: const Color(0xFFb2d0ce),
                          ),
                          CircleIconButton(
                            onPressed: () {
                              debugPrintThrottled('going to my qr');
                              Navigator.of(context).pushNamed('/my_qr');
                            },
                            text: 'Receive',
                            icon: Icons.arrow_downward,
                            color: colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // plans container
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'My Plans',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                //TODO: navigate to plans screen by changing the index of the bottom navigation bar
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    'View all',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return SmallPlanCard(
                                colorScheme: colorScheme,
                                budget: 200,
                                category: 'savings',
                                current: 75,
                                title: 'Plan 1',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // transactions container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: height * 0.48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Recent Transactions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            //TODO: navigate to activity screen by changing the index of the bottom navigation bar
                          },
                          child: Row(
                            children: const [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                        //TODO: make the list scrollable till to the top of lower container
                        child: TransactionList()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
