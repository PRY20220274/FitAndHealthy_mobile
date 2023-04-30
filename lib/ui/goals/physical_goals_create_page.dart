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

class PhysicalGoalsCreate extends StatelessWidget {
  const PhysicalGoalsCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List typesFrecuency = ['Diaria', 'Semanal', 'Quincenal', 'Mensual'];
    final _goalForm = Provider.of<GoalFormProvider>(context);
    final _goalProv = Provider.of<GoalsProvider>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            _goalProv.reset();
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const TitlePageWidget(title: 'Objetivos Físicos'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 450,
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
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DropdownButtonFormField<String>(
                                items: typesFrecuency.map((item) {
                                  return DropdownMenuItem<String>(
                                      child: Text(item), value: item);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  _goalForm.buildPhysicalGoalCreate(
                                      frequency: frecuencies[value]);
                                },
                                validator: (value) =>
                                    _goalForm.validateNulls(value),
                              ),
                              TextFormField(
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  final s = int.tryParse(value);
                                  _goalForm.buildPhysicalGoalCreate(steps: s);
                                },
                                validator: (value) =>
                                    _goalForm.validateNulls(value),
                              ),
                              TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Km',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  final km = double.tryParse(value);
                                  _goalForm.buildPhysicalGoalCreate(
                                      kilometers: km);
                                },
                                validator: (value) =>
                                    _goalForm.validateKilometers(value),
                              ),
                              TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Pts cardio',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  final pts = int.tryParse(value);
                                  _goalForm.buildPhysicalGoalCreate(
                                      cardioPoints: pts);
                                },
                                validator: (value) =>
                                    _goalForm.validateNulls(value),
                              ),
                              TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Kcal',
                                    fillColor:
                                        Theme.of(context).colorScheme.surface),
                                autocorrect: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  final cal = double.tryParse(value);
                                  _goalForm.buildPhysicalGoalCreate(
                                      calories: cal);
                                },
                                validator: (value) =>
                                    _goalForm.validateCalories(value),
                              ),
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
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (!_formKey.currentState!.validate()) return;

                      await _goalProv
                          .postPhysicalGoal(_goalForm.physicalGoalCreate);
                    },
                    color: ComplementPalette.green.shade700,
                  ),
                  const SizedBox(height: 20),
                  if (_goalProv.isLoading == false && _goalProv.mostrarCuadro)
                    GoalItemCardWidget(
                      typeGoal: TypeGoal.physical,
                      description: _goalProv.physicalGoalRead.description,
                      frequency: _goalProv.physicalGoalRead.frequency,
                      steps: _goalProv.physicalGoalRead.steps,
                      kilometers: _goalProv.physicalGoalRead.kilometers,
                      cardioPoints: _goalProv.physicalGoalRead.cardioPoints,
                      calories: _goalProv.physicalGoalRead.calories,
                      goalCompleted: _goalProv.physicalGoalRead.completed ==
                              'No completado'
                          ? false
                          : true,
                      isCreated: true,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
