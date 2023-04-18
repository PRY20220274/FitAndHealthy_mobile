import 'package:fit_healthy/ui/physical_activity/widgets/valor_met.dart';
import 'package:flutter/material.dart';

class ValoresMet extends StatelessWidget {
  const ValoresMet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Ciclismo(moderado)',
          valueMet: '7.5',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Ciclismo(vigoroso)',
          valueMet: '14',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Caminar rápido',
          valueMet: '6',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Correr',
          valueMet: '8',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Labores de jardinería',
          valueMet: '4',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Trabajos domésticos',
          valueMet: '4',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Saltar la cuerda',
          valueMet: '11',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Subir escaleras',
          valueMet: '5',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Pilates',
          valueMet: '3',
        ),
        ValorMet(
          imageIcon: '404-error.png',
          text: 'Ejercicio de resistencia',
          valueMet: '5',
        )
      ],
    );
  }
}
