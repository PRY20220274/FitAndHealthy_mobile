import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/business/goals/nutritional_goal_provider.dart';
import 'package:fit_healthy/business/shared/types_provider.dart';
import 'package:fit_healthy/domain/models/types/activity.dart';
import 'package:fit_healthy/domain/models/types/objective.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NutritionalGoalsCreate extends StatelessWidget {
  const NutritionalGoalsCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    List<Activity> typesActivity = Provider.of<TypesProvider>(context).activites;
    List<Objective> typesObjective = Provider.of<TypesProvider>(context).objetices;
    final goalsProvider = Provider.of<NutritionalGoalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            goalsProvider.resetNutritionalGoal();
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TitlePageWidget(title: 'Objetivos Alimenticios'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Objetivo: '),
                            Text('Tipo de Actividad: ')
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButtonFormField(
                                items: typesObjective.map((item) {
                                  return DropdownMenuItem(
                                      child: Text(item.name), value: item.id);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  goalsProvider.builNutritionalGoal(objective: int.parse(value.toString()));
                                }),
                            DropdownButtonFormField(
                                items: typesActivity.map((item) {
                                  return DropdownMenuItem(
                                      child: Text(item.name), value: item.id);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  goalsProvider.builNutritionalGoal(activity: int.parse(value.toString()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AppFilledButton(
                  text: 'Guardar Objetivo',
                  onPressed: () async {
                    await goalsProvider.postNutritionalGoal();
                  },
                  color: ComplementPalette.green.shade700,
                ),
                const SizedBox(height: 20),
                if (goalsProvider.nutritionalGoalRead != null)
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: ComplementPalette.green.shade200,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SizedBox(
                    height: 170,
                    width: size.width * 0.75,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                            goalsProvider.nutritionalGoalRead!.description,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
