import 'package:fit_healthy/business/iot/iot_provider.dart';
import 'package:fit_healthy/business/suggestion/suggestion_provider.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/enums/status_enum.dart';
import 'package:fit_healthy/ui/forms/form_drinks_page.dart';
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
    final physicalSuggestion =
        Provider.of<SuggestionProvider>(context).physicalSuggestionToday;
    final nutritionalSuggestion =
        Provider.of<SuggestionProvider>(context).nutritionalSuggestionToday;

    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.20,
          child: ProfileWidget(size: size),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: StatusTitleTileWidget(
                  title: 'Estado Físico',
                  imageNameAsset: 'exercise.png',
                ),
              ),
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
                      categoryId: '2',
                      routeWidget: FormDrinksPage()),
                  NutritionalStatusInfoTileWidget(
                    title: 'Alimentos',
                    description: 'Te alimentaste \n muy bien',
                    imageNameAsset: 'portion.png',
                    categoryId: '1',
                    routeWidget: FormDrinksPage(),
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
              SuggestionWidget(
                typeSuggestion: TypeSuggestion.physical,
                description: physicalSuggestion.description,
              ),
              SuggestionWidget(
                typeSuggestion: TypeSuggestion.nutritional,
                description: nutritionalSuggestion.description,
              ),
              //const SizedBox(height: 48,)
            ],
          ),
        )
      ],
    );
  }
}
