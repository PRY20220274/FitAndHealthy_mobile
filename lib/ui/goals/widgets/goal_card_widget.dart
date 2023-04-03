import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';

class GoalCardWidget extends StatelessWidget {
  const GoalCardWidget({
    Key? key,
    required this.titleGoal,
    required this.imageNameAsset,
  }) : super(key: key);

  final String titleGoal;
  final String imageNameAsset;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.32,
      width: size.width * 0.7,
      child: Card(
        color: ComplementPalette.green.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                titleGoal,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Image.asset(
              'assets/images/$imageNameAsset',
              height: size.height * 0.12,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: ComplementPalette.green.shade400,
                    ),
                    height: 40,
                    child: const Center(child: Text('Crear')),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: ComplementPalette.green.shade200,
                    ),
                    height: 40,
                    //color: ComplementPalette.green.shade200,
                    child: const Center(child: Text('Ver')),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
