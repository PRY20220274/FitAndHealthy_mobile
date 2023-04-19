import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalsListPage extends StatelessWidget {
  const GoalsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allGoals = Provider.of<GoalsProvider>(context).allGoals;
    final Size size = MediaQuery.of(context).size;

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
      body: Center(
        child: SizedBox(
          width: size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitlePageWidget(title: 'Objetivos'),
              const SizedBox(height: 12,),
              Flexible(
                child: ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
