import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/data.dart';
import 'widgets/plan_card.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double height = MediaQuery.of(context).size.height;
    final List<Plan> _plans = [
      Plan(
        id: '1',
        name: 'Taxi',
        category: 'Transport',
        duration: 'Monthly',
        budget: '850',
        balance: '1000',
      ),
      Plan(
        id: '2',
        name: 'Basic',
        category: 'Food and Drinks',
        duration: 'Monthly',
        budget: '650',
        balance: '1000',
      ),
      Plan(
        id: '3',
        name: 'Personal',
        category: 'Going out',
        duration: '2021-09-01',
        budget: '500',
        balance: '1000',
      ),
      Plan(
        id: '4',
        name: 'Study Materials',
        category: 'study',
        duration: '2021-09-01',
        budget: '100',
        balance: '1000',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans'),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.surface,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/edit_plan');
        },
        tooltip: 'Create Plan',
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
      backgroundColor: colorScheme.background,
      body: SizedBox(
        height: height,
        child: ListView.builder(
          itemCount: _plans.length,
          itemBuilder: (context, index) {
            return PlanCard(
              title: _plans[index].name,
              category: _plans[index].category,
              current: int.parse(_plans[index].balance),
              budget: int.parse(_plans[index].budget),
            );
          },
        ),
      ),
    );
  }
}
