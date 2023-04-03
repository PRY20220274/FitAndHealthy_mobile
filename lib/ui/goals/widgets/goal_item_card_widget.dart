import 'package:fit_healthy/domain/utils/enums/goals_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';

class GoalItemCardWidget extends StatelessWidget {
  const GoalItemCardWidget({
    Key? key,
    //required this.goalTitle,
    this.steps,
    this.kilometers,
    this.cardioPoints,
    this.calories,
    this.description,
    this.weight,
    this.height,
    this.typeActivity,
    this.goalCompleted = false,
    required this.typeGoal,
  }) : super(key: key);

  //final String goalTitle;
  final int? steps;
  final double? kilometers;
  final int? cardioPoints;
  final double? calories;
  final String? description;
  final double? weight;
  final double? height;
  final String? typeActivity;
  final bool goalCompleted;
  final TypeGoal typeGoal;
  //final

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Card(
      color: typeGoal == TypeGoal.physical
          ? ComplementPalette.green.shade100
          : ComplementPalette.green.shade300,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 150,
        width: size.width * 0.75,
        child: Padding(padding: EdgeInsets.all(12), child: typeGoal == TypeGoal.physical
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Objetivo Físico',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('Pasos: $steps pasos'),
                  Text('Kilómetros: ${kilometers!.toStringAsFixed(2)} km'),
                  Text('Puntos cardio: $cardioPoints pts'),
                  Text('Calorías: ${calories!.toStringAsFixed(2)} cal'),
                  goalCompleted
                      ? const Text('!Felicidades! objetivo cumplido')
                      : const Text('No cumpliste con tu objetivo'),
                ],
              )
            : Column(
                children: [
                  const Text(
                    'Objetivo Alimenticio',
                    textAlign: TextAlign.center,
                  ),
                  Text('Objetivo: $description'),
                  Text('Peso: ${weight!.toStringAsFixed(2)} kg'),
                  Text('Altura: ${height!.toStringAsFixed(2)} m'),
                  Text('Tipo actividad: $typeActivity'),
                  goalCompleted
                      ? const Text('!Felicidades! objetivo cumplido')
                      : const Text('No cumpliste con tu objetivo'),
                ],
              ),),
      ),
    );
  }
}
