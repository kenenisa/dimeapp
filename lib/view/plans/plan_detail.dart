import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/common/appbar.dart';
import '../../core/common/button.dart';
import '../../core/common/transaction_list.dart';
import 'data/data.dart';
import 'widgets/plan_card.dart';
import 'widgets/plan_header.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key, required this.plan});
  final Plan plan;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: DimeAppBar(
        'Plan Details',
        context,
      ),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlanHeader(
              title: plan.name,
              category: plan.category,
              date: plan.duration,
            ),
            PlanCard(
              title: '${plan.budget} credits left',
              category: 'Budget',
              current: int.parse(plan.balance),
              budget: int.parse(plan.budget),
            ),
            const SizedBox(height: 10),
            DimeButton(
              onTap: () {},
              text: "Deposit",
              color: colorScheme.primary,
            ),
            DimeButton(
              onTap: () {},
              text: "Withdraw",
              color: colorScheme.secondary,
            ),
            const SizedBox(height: 10),
            const TransactionList()
          ],
        ),
      ),
    );
  }
}
