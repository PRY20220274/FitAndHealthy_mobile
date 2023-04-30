import 'package:fit_healthy/ui/goals/goals_list_page.dart';
import 'package:fit_healthy/ui/goals/nutritional_goals_create_page.dart';
import 'package:fit_healthy/ui/goals/physical_goals_create_page.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_card_widget.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const GoalCardWidget(
          titleGoal: 'Objetivos\nFísicos',
          imageNameAsset: 'exercise.png',
          routeWidget: PhysicalGoalsCreate(),
        ),
        const GoalCardWidget(
          titleGoal: 'Objetivos\nAlimenticios',
          imageNameAsset: 'healthy-food.png',
          routeWidget: NutritionalGoalsCreate(),
        ),
        AppFilledButton(
          text: 'Ver todos mis objetivos',
          onPressed: () {
            Navigator.push(
              context,
              TransitionPageRoute(
                child: const GoalsListPage(),
                direction: AxisDirection.up,
              ),
            );
          },
        ),
      ],
    );
  }
}
