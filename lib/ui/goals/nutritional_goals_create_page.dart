import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/goals/widgets/goal_item_card_widget.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';

class NutritionalGoalsCreate extends StatefulWidget {
  const NutritionalGoalsCreate({Key? key}) : super(key: key);

  @override
  State<NutritionalGoalsCreate> createState() => _NutritionalGoalsCreateState();
}

class _NutritionalGoalsCreateState extends State<NutritionalGoalsCreate> {
  //String _dropdownvalue = 'Ganar Peso'

  List typesGoals = ['Ganar peso', 'Adelgazar', 'Mantener'];
  List typesActivity = ['Ligero', 'Moderado', 'Intenso'];

  String seletedTypeGoal = '';
  String seletedTypeActivity = '';

  @override
  Widget build(BuildContext context) {
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
                            /*TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Engordar',
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                autocorrect: false),
                            TextFormField(
                                decoration: appInputDecoration(
                                    labelText: 'Ligero',
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                autocorrect: false),*/
                            DropdownButtonFormField(
                                items: typesGoals.map((item) {
                                  return DropdownMenuItem(
                                      child: Text(item), value: item);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  setState(() {
                                    seletedTypeGoal = value.toString();
                                  });
                                }),
                            DropdownButtonFormField(
                                items: typesActivity.map((item) {
                                  return DropdownMenuItem(
                                      child: Text(item), value: item);
                                }).toList(),
                                dropdownColor: ComplementPalette.green.shade50,
                                decoration: appInputDecoration(
                                    labelText: '',
                                    fillColor: ComplementPalette.green.shade50),
                                onChanged: (value) {
                                  setState(() {
                                    seletedTypeActivity = value.toString();
                                  });
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
                  onPressed: () {},
                  color: ComplementPalette.green.shade700,
                ),
                const SizedBox(height: 20),
                /*GoalItemCardWidget(
                  typeGoal: TypeGoal.nutritional,
                  description: seletedTypeGoal,
                  weight: 50,
                  height: 1.60,
                  typeActivity: seletedTypeActivity,
                  isCreated: true,
                )*/
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                              'Para mantener su peso actual debe consumir 2441 calorías por día.',
                              style: TextStyle(fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ],
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

  /*
  void dropDownChanged(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }*/
}
