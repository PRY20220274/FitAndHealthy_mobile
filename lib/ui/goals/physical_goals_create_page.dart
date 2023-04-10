import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';

class PhysicalGoalsCreate extends StatelessWidget {
  const PhysicalGoalsCreate({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TitlePageWidget(title: 'Objetivos Físicos'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Frecuencia: '),
                            Text('Pasos: '),
                            Text('Kilómetros a recorrer: '),
                            Text('Puntos Cardio: '),
                            Text('Calorías: '),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                autocorrect: false),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Km',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Pts cardio',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Kcal',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AppFilledButton(
                  text: 'Guardar Objetivo',
                  onPressed: () {},
                  color: ComplementPalette.green.shade700,
                ),
                const SizedBox(height: 20),
                const GoalItemCardWidget(
                  typeGoal: TypeGoal.physical,
                  steps: 480,
                  kilometers: 3,
                  cardioPoints: 48,
                  calories: 458,
                  isCreated: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
