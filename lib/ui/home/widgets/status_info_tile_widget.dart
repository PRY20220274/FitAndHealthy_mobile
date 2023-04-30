import 'package:fit_healthy/business/form/form_provider.dart';
import 'package:fit_healthy/domain/utils/enums/status_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/transition_page_route.dart';

class PhysicalStatusInfoTileWidget extends StatelessWidget {
  const PhysicalStatusInfoTileWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.units,
    this.imageNameAsset = '404-error.png',
    required this.status,
    this.subValue = 0,
    this.subUnits = '',
    this.subTitle = '',
    this.subImageNameAsset = '404-error.png',
  }) : super(key: key);

  final String title;
  final double value;
  final String units;
  final String imageNameAsset;
  final PhysicalStatus status;
  final double subValue;
  final String subUnits;
  final String subTitle;
  final String subImageNameAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Card(
        //color: BoxFit,//
        color: Palette.green.shade50, //Colors.teal.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: status == PhysicalStatus.steps
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/$imageNameAsset',
                      height: 50,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${value.toInt()} $units',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      subTitle,
                      style: const TextStyle(fontSize: 12),
                    ),
                    //const SizedBox(height: 4),
                    Image.asset(
                      'assets/images/$subImageNameAsset',
                      height: 30,
                    ),
                    //const SizedBox(height: 4),
                    Text(
                      '$subValue $subUnits',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Actualización cada 5h',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/$imageNameAsset',
                      height: 60,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${status == PhysicalStatus.cardio ? value.toInt() : value.toStringAsFixed(1)} $units',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    if (status != PhysicalStatus.measures)
                      const Text(
                        'Actualización cada 5h',
                        style: TextStyle(fontSize: 12),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class NutritionalStatusInfoTileWidget extends StatelessWidget {
  const NutritionalStatusInfoTileWidget(
      {Key? key,
      required this.title,
      required this.description,
      this.imageNameAsset = '404-error.png',
      required this.routeWidget,
      required this.categoryId})
      : super(key: key);

  final String title;
  final String description;
  final String imageNameAsset;
  final Widget routeWidget;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: InkWell(
        child: Card(
          //color: BoxFit,//
          color: Palette.green.shade50, //Colors.teal.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                const SizedBox(height: 12),
                Image.asset(
                  'assets/images/$imageNameAsset',
                  height: 60,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Completar formulario',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Provider.of<FormProvider>(context, listen: false)
              .getFormByCategory(categoryId);

          Navigator.push(
              context,
              TransitionPageRoute(
                  child: routeWidget, direction: AxisDirection.up));
        },
      ),
    );
  }
}
