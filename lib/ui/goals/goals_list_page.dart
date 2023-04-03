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
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //crossAxisAlignment: ,
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
            ],
          ),
        ),
      ),
    );
  }
}
