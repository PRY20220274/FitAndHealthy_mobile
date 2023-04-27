import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/business/shared/goal_form_provider.dart';
import 'package:fit_healthy/domain/models/goals/physical_goal_read.dart';
import 'package:fit_healthy/domain/utils/constants/suggestions_titles_constant.dart';
import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhysicalGoalsCreate extends StatefulWidget {
  const PhysicalGoalsCreate({Key? key}) : super(key: key);

  @override
  State<PhysicalGoalsCreate> createState() => _PhysicalGoalsCreateState();
}

class _PhysicalGoalsCreateState extends State<PhysicalGoalsCreate> {
  List typesFrecuency = ['Diaria', 'Semanal', 'Quincenal', 'Mensual'];

  String seletedTypeFrecuency = '';

  @override
  Widget build(BuildContext context) {
    final _goalForm = Provider.of<GoalFormProvider>(context);
    final _goalProv = Provider.of<GoalsProvider>(context);

    late PhysicalGoalRead responseGoalRead = PhysicalGoalRead(
        calories: 0,
        cardioPoints: 0,
        completed: '',
        description: '',
        frequency: '',
        id: 0,
        kilometers: 0.0,
        steps: 1);

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
                    Flexible(
                      child: SizedBox(
                        width: 150,
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            /*TextFormField(
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                autocorrect: false),*/
                            DropdownButtonFormField(
                                items: typesFrecuency.map((item) {
                                  return DropdownMenuItem(
                                      child: Text(item), value: item);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  _goalForm.buildPhysicalGoalCreate(
                                      frequency: frecuencies[value]);
                                  /*setState(() {
                                    seletedTypeFrecuency = value.toString();
                                  });*/
                                }),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    _goalForm.buildPhysicalGoalCreate(
                                        steps: int.parse(value))),
                            TextFormField(
                              decoration: appInputDecoration(
                                  labelText: 'Km',
                                  fillColor:
                                      Theme.of(context).colorScheme.surface),
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  _goalForm.buildPhysicalGoalCreate(
                                      kilometers: double.parse(value)),
                            ),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Pts cardio',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    _goalForm.buildPhysicalGoalCreate(
                                        cardioPoints: int.parse(value))),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Kcal',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    _goalForm.buildPhysicalGoalCreate(
                                        calories: double.parse(value))),
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
                    print(
                        '====physicalGoalCreate ${_goalForm.physicalGoalCreate.toString()}');
                    responseGoalRead = await _goalProv
                        .postPhysicalGoal(_goalForm.physicalGoalCreate);
                    setState(() {});
                  },
                  color: ComplementPalette.green.shade700,
                ),
                const SizedBox(height: 20),
                if (_goalProv.isLoading == false && _goalProv.mostrarCuadro)
                  GoalItemCardWidget(
                    typeGoal: TypeGoal.physical,
                    frequency: responseGoalRead.frequency,
                    steps: responseGoalRead.steps,
                    kilometers: responseGoalRead.kilometers,
                    cardioPoints: responseGoalRead.cardioPoints,
                    calories: responseGoalRead.calories,
                    goalCompleted: responseGoalRead.completed == 'No completado'
                        ? false
                        : true,
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
