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
        child: FutureBuilder(
          future: getPlans(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Plan>? plans = snapshot.data;
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PlanCard(
                    title: plans![index].name,
                    category: plans[index].category,
                    current: int.parse(plans[index].balance),
                    budget: int.parse(plans[index].budget),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
