import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../data/data.dart';
import '../plan_detail.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.title,
    required this.category,
    required this.current,
    required this.budget,
  });

  final String title;
  final String category;
  final int current;
  final int budget;

  @override
  Widget build(BuildContext context) {
    final double percent = (budget / current) * 100;
    final double width = MediaQuery.of(context).size.width;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Plan plan = Plan(
        id: '',
        name: title,
        category: category,
        balance: current.toString(),
        budget: budget.toString(),
        duration: '1 month');

    final Color _color = percent > 40
        ? percent > 70
            ? colorScheme.primary
            : colorScheme.secondary
        : colorScheme.error;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanDetailScreen(plan: plan),
            ),
          );
        },
        child: Container(
          width: width,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              LinearPercentIndicator(
                width: (width - 135),
                lineHeight: 8.0,
                animation: true,
                animationDuration: 1000,
                leading: Text(
                  budget.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                alignment: MainAxisAlignment.spaceBetween,
                trailing: Text(
                  current.toString(),
                  style: TextStyle(color: colorScheme.onSurface),
                ),
                percent: (budget / current) * 100 / 100,
                barRadius: const Radius.circular(50),
                progressColor: _color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
