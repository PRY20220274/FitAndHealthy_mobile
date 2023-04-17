import 'package:flutter/material.dart';

import 'package:fit_healthy/domain/utils/themes/color_theme.dart';

class CardPhysicalActivity extends StatelessWidget {
  const CardPhysicalActivity({
    Key? key,
    required this.activity,
    required this.goalMet,
    this.imageIcon = '404-error.png',
    this.goalTime = 0,
    required this.currencyValue,
    this.currencyFrecuency = '',
    required this.currencyMet,
  }) : super(key: key);

  final String activity;
  final int goalMet;
  final String imageIcon;
  final int goalTime;
  final String currencyValue;
  final String currencyFrecuency;
  final int currencyMet;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 250,
      width: size.width / 2 * 0.9,
      child: Card(
        color: Palette.green.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: activity,
                            style: const TextStyle(color: Colors.black)),
                        TextSpan(
                          text: ' $goalMet MET',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ])),
                ],
              ),
              Image.asset('assets/images/$imageIcon', height: 50),
              const SizedBox(height: 8),
              goalTime != 0 ? Text('$goalTime min semanal') : const Text(''),
              const SizedBox(height: 8),
              //Text('$currencyValue $currencyFrecuency'),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: currencyValue,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.black)),
                    TextSpan(
                      text: currencyFrecuency,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ])),
              Text('$currencyMet MET',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
