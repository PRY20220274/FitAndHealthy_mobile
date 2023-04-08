import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';

class GoalsListPage extends StatelessWidget {
  const GoalsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TitlePageWidget(title: 'Objetivos'),
              GoalItemCardWidget(
                typeGoal: TypeGoal.physical,
                steps: 480,
                kilometers: 3,
                cardioPoints: 48,
                calories: 458,
                goalCompleted: true,
              ),
              GoalItemCardWidget(
                typeGoal: TypeGoal.nutritional,
                steps: 480,
                description: 'Ganar masa muscular',
                weight: 58,
                height: 1.68,
                goalCompleted: false,
                typeActivity: 'levantar pesas',
              ),
              GoalItemCardWidget(
                typeGoal: TypeGoal.physical,
                steps: 480,
                kilometers: 3,
                cardioPoints: 48,
                calories: 458,
                goalCompleted: true,
              ),
              GoalItemCardWidget(
                typeGoal: TypeGoal.nutritional,
                steps: 480,
                description: 'Ganar masa muscular',
                weight: 58,
                height: 1.68,
                goalCompleted: false,
                typeActivity: 'levantar pesas',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
