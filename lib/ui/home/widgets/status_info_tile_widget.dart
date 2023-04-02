import 'package:fit_healthy/domain/utils/enums/status_enum.dart';
import 'package:flutter/material.dart';

class PhysicalStatusInfoTileWidget extends StatelessWidget {
  const PhysicalStatusInfoTileWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.units,
    this.imageNameAsset = "404-error.png",
    required this.status,
    this.subValue = 0,
    this.subUnits = "",
    this.subTitle = "",
    this.subImageNameAsset = "404-error.png",
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
      child: Card(
        //color: BoxFit,//
        color: Colors.teal.shade50,
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
                      "assets/images/$imageNameAsset",
                      height: 50,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${value.toInt()} $units",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      subTitle,
                      style: const TextStyle(fontSize: 12),
                    ),
                    //const SizedBox(height: 4),
                    Image.asset(
                      "assets/images/$subImageNameAsset",
                      height: 30,
                    ),
                    //const SizedBox(height: 4),
                    Text(
                      "$subValue $subUnits",
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Actualización cada 5h",
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
                      "assets/images/$imageNameAsset",
                      height: 60,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${status == PhysicalStatus.cardio ? value.toInt() : value.toStringAsFixed(1)} $units",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Actualización cada 5h",
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
  const NutritionalStatusInfoTileWidget({
    Key? key,
    required this.title,
    required this.description,
    this.imageNameAsset = "404-error.png",
  }) : super(key: key);

  final String title;
  final String description;
  final String imageNameAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        //color: BoxFit,//
        color: Colors.teal.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    const SizedBox(height: 12),
                    Image.asset(
                      "assets/images/$imageNameAsset",
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
                      "Completar formulario",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
