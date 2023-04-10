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
  String _dropdownvalue = "Engordar";
  var dropdownItems = ['Engodar', 'Adelgazar', 'Mantener'];

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
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            /*DropdownButton(
                                items: const [
                                  DropdownMenuItem(
                                      child: Text("Engordar"),
                                      value: "Engodar"),
                                  DropdownMenuItem(
                                      child: Text("Adelgazar"),
                                      value: "Adelgazar"),
                                  DropdownMenuItem(
                                      child: Text("Mantener"),
                                      value: "Mantener"),
                                ],
                                value: _dropdownvalue,
                                onChanged: dropDownChanged),
                            /*
                              value: 'Engordar',
                              items: dropdownItems.map((String item) {
                                return DropdownMenuItem(
                                    child: Text(item), value: item);
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _dropdownvalue = newValue!;
                                });
                              },
                            ),*/
                            */
                            TextFormField(
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
                  typeGoal: TypeGoal.nutritional,
                  description: 'Adelgazar',
                  weight: 50,
                  height: 1.60,
                  typeActivity: 'Moderado',
                  isCreated: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dropDownChanged(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }
}
