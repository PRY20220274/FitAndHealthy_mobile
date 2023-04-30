import 'package:fit_healthy/business/iot/iot_provider.dart';
import 'package:fit_healthy/business/suggestion/suggestion_provider.dart';
import 'package:fit_healthy/business/userdata/user_data_provider.dart';
import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/enums/status_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/forms/form_drinks_page.dart';
import 'package:fit_healthy/ui/home/widgets/suggestion_widget.dart';
import 'package:fit_healthy/ui/home/widgets/profile_widget.dart';
import 'package:fit_healthy/ui/home/widgets/status_info_tile_widget.dart';
import 'package:fit_healthy/ui/home/widgets/status_title_tile_widget.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
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
                  InkWell(
                    onTap: () {
                      _showDialogMeasures(context);
                    },
                    child: PhysicalStatusInfoTileWidget(
                      title: 'IMC',
                      value: Provider.of<UserDataProvider>(context).getIMC(),
                      units: 'IMC',
                      status: PhysicalStatus.measures,
                      imageNameAsset: 'bathroom-scale.png',
                    ),
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

  void _showDialogMeasures(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 365,
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 8, right: 8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 175,
                            //width: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('Peso:'),
                                SizedBox(height: 8,),
                                Text('Altura:'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: 175,
                            //width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  decoration: appInputDecoration2(
                                      labelText: '',
                                      fillColor:
                                          Theme.of(context).colorScheme.surface),
                                  autocorrect: false,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final w = double.tryParse(value);
                                    userDataProvider.buildMeasureUpdate(weight: w);
                                  },
                                  validator: (value) => userDataProvider.validateWeight(value),
                                ),
                                const SizedBox(height: 8,),
                                TextFormField(
                                  decoration: appInputDecoration2(
                                      labelText: '',
                                      fillColor:
                                          Theme.of(context).colorScheme.surface),
                                  autocorrect: false,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final h = double.tryParse(value);
                                    userDataProvider.buildMeasureUpdate(height: h);
                                  },
                                  validator: (value) => userDataProvider.validateHeight(value),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 23,),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (!_formKey.currentState!.validate()) return;

                      userDataProvider.updateMeasures();
                      
                      Navigator.pop(context);

                    },
                    child: Container(
                      width: double.infinity,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Palette.green.shade200,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
