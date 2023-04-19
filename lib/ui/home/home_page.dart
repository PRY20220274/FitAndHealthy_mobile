import 'package:fit_healthy/business/iot/iot_provider.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/enums/status_enum.dart';
import 'package:fit_healthy/ui/home/widgets/suggestion_widget.dart';
import 'package:fit_healthy/ui/home/widgets/profile_widget.dart';
import 'package:fit_healthy/ui/home/widgets/status_info_tile_widget.dart';
import 'package:fit_healthy/ui/home/widgets/status_title_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final userPhysicalData = Provider.of<IotProvider>(context).userPhysicalData;

    return ListView(
      //fit: StackFit.expand,
      children: [
        SizedBox(
          height: size.height * 0.20,
          child: ProfileWidget(size: size),
        ),
        /*Positioned(
            child: Container(
              height: 10,
              color: Colors.green,
            ),
          ),*/
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: StatusTitleTileWidget(
                  title: 'Estado Físico',
                  //icon: Icons.directions_run_rounded,
                  imageNameAsset: 'exercise.png',
                ),
              ),
              //SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const PhysicalStatusInfoTileWidget(
                    title: 'Peso',
                    value: 58.62,
                    units: 'kg',
                    status: PhysicalStatus.weight,
                    imageNameAsset: 'bathroom-scale.png',
                  ),
                  PhysicalStatusInfoTileWidget(
                    title: 'Pasos',
                    value: userPhysicalData.steps.toDouble(),
                    units: 'pasos',
                    imageNameAsset: 'running-shoe.png',
                    status: PhysicalStatus.steps,
                    subValue: userPhysicalData.kilometersTraveled,
                    subUnits: 'km',
                    subTitle: 'Kilómetros recorridos',
                    subImageNameAsset: 'route.png',
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PhysicalStatusInfoTileWidget(
                    title: 'Puntos cardio',
                    value: userPhysicalData.cardioPoints.toDouble(),
                    units: 'pts',
                    status: PhysicalStatus.cardio,
                    imageNameAsset: 'heart-beat.png',
                  ),
                  PhysicalStatusInfoTileWidget(
                    title: 'Calorías',
                    value: userPhysicalData.calories,
                    units: 'cal',
                    status: PhysicalStatus.calories,
                    imageNameAsset: 'calories.png',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 28, bottom: 12),
                child: StatusTitleTileWidget(
                  title: 'Estado Alimenticio',
                  imageNameAsset: 'healthy-food.png',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  NutritionalStatusInfoTileWidget(
                    title: 'Agua',
                    description: '750 ml',
                    imageNameAsset: 'glass-of-water.png',
                  ),
                  NutritionalStatusInfoTileWidget(
                    title: 'Alimentos',
                    description: 'Te alimentaste \n muy bien',
                    imageNameAsset: 'portion.png',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 12),
                child: Text(
                  'Recomendaciones del día de hoy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SuggestionWidget(
                typeSuggestion: TypeSuggestion.physical,
                description:
                    'Si bailas o realizas por una hora estarías cumpliendo con 480 MET',
              ),
              const SuggestionWidget(
                typeSuggestion: TypeSuggestion.nutritional,
                description:
                    'Deberías de reducir el consumo de papa, !Puedes probar con la zanahoria!',
              ),
              //const SizedBox(height: 48,)
            ],
          ),
        )
      ],
    );
  }
}
