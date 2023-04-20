import 'package:fit_healthy/ui/physical_activity/widgets/valor_met.dart';
import 'package:flutter/material.dart';

class ValoresMet extends StatelessWidget {
  const ValoresMet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ValorMet(
          imageIcon: 'ciclismo.png',
          text: 'Ciclismo(moderado)',
          valueMet: '7.5',
        ),
        ValorMet(
          imageIcon: 'ciclismo.png',
          text: 'Ciclismo(vigoroso)',
          valueMet: '14',
        ),
        ValorMet(
          imageIcon: 'caminar.png',
          text: 'Caminar rápido',
          valueMet: '6',
        ),
        ValorMet(
          imageIcon: 'correr.png',
          text: 'Correr',
          valueMet: '8',
        ),
        ValorMet(
          imageIcon: 'jardineria.png',
          text: 'Labores de jardinería',
          valueMet: '4',
        ),
        ValorMet(
          imageIcon: 'labores_domesticas.png',
          text: 'Trabajos domésticos',
          valueMet: '4',
        ),
        ValorMet(
          imageIcon: 'saltar_cuerda.png',
          text: 'Saltar la cuerda',
          valueMet: '11',
        ),
        ValorMet(
          imageIcon: 'subir_escaleras.png',
          text: 'Subir escaleras',
          valueMet: '5',
        ),
        ValorMet(
          imageIcon: 'pilates.jpg',
          text: 'Pilates',
          valueMet: '3',
        ),
        ValorMet(
          imageIcon: 'resistencia.png',
          text: 'Ejercicio de resistencia',
          valueMet: '5',
        )
      ],
    );
  }
}
