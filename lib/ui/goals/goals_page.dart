import 'package:fit_healthy/ui/goals/widgets/goal_card_widget.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        GoalCardWidget(
          titleGoal: 'Objetivos\nFísicos',
          imageNameAsset: 'exercise.png',
        ),
        GoalCardWidget(
          titleGoal: 'Objetivos\nAlimenticios',
          imageNameAsset: 'healthy-food.png',
        ),
      ],
    );
  }
}
