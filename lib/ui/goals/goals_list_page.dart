import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalsListPage extends StatelessWidget {
  const GoalsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allGoals = Provider.of<GoalsProvider>(context).allGoals;

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
            children: [
              const TitlePageWidget(title: 'Objetivos'),
              ListView.builder(
                  itemCount: allGoals.length,
                  itemBuilder: (context, index) {
                    final goal = allGoals[index];

                    if (allGoals.isNotEmpty) {
                      return GoalItemCardWidget(
                        typeGoal: goal.typeGoal,
                        steps: goal.steps,
                        kilometers: goal.kilometers,
                        cardioPoints: goal.cardioPoints,
                        calories: goal.calories,
                        description: goal.description,
                        weight: 45,
                        height: 1.65,
                        typeActivity: goal.activity,
                        goalCompleted: true,
                        isCreated: false,
                      );
                    } else {
                      return const Text('No tienes objetivos !Crea nuevos!');
                    }
                  }),
              /*GoalItemCardWidget(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
