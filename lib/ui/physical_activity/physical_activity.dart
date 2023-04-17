import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/physical_activity/widgets/card_physical_activity.dart';
import 'package:fit_healthy/ui/physical_activity/widgets/valores_met.dart';
import 'package:flutter/material.dart';

class PhysicalActivityPage extends StatelessWidget {
  const PhysicalActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
          child: Column(children: [
            const Text('Actividades Físicas',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            const Text(
              "El MET es la unidad de medida del índice metabólico y corresponde a 3,5 ml O2/kg x min, que es el conusmo mínimo de oxígeno que el organismo necesita  para mantener sus constantes vitales\nLas nuevas recomendaciones muestran que la mayoría de los beneficios para la salud se consiguen cuando se alcanzan de 3000 a 4000 MET minutos por semana",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Cómo lograr tus MET',
                style: TextStyle(
                    color: ComplementPalette.green.shade800,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text('Un ejemplo semanal',
                style: TextStyle(
                    color: ComplementPalette.green.shade200,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CardPhysicalActivity(
                  activity: 'Correr',
                  goalMet: 8,
                  goalTime: 60,
                  currencyValue: '2.24 km',
                  currencyFrecuency: ' hoy',
                  currencyMet: 480,
                ),
                CardPhysicalActivity(
                  activity: 'Caminar',
                  goalMet: 6,
                  goalTime: 210,
                  currencyValue: '15 mins',
                  currencyFrecuency: ' por día',
                  currencyMet: 1260,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CardPhysicalActivity(
                  activity: 'Bailar o ejercicios\n aeróbicos',
                  goalMet: 8,
                  currencyValue: '60 min',
                  currencyMet: 480,
                ),
                CardPhysicalActivity(
                  activity: 'Labores de jardinería\n o trabajos domésticos\n',
                  goalMet: 4,
                  currencyValue: '240 min',
                  currencyMet: 960,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CardPhysicalActivity(
                  activity: 'Deportes de equipo\n (Ejemplo: fútbol)\n',
                  goalMet: 7,
                  currencyValue: '60 min',
                  currencyMet: 520,
                ),
                CardPhysicalActivity(
                  activity: 'Resistencia y\n entrenamiento con\n pesas',
                  goalMet: 5,
                  currencyValue: '60 min',
                  currencyMet: 300,
                )
              ],
            ),
            const SizedBox(height: 12),
            const Text('Total: 3900 METs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Text('Valores MET',
                style: TextStyle(
                    fontSize: 32,
                    color: ComplementPalette.green.shade700,
                    fontWeight: FontWeight.bold)),
            const ValoresMet()
          ]),
        )
      ],
    );
  }
}
