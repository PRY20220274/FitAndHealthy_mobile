import 'package:fit_healthy/domain/utils/constants/advices_titles_constant.dart';
import 'package:fit_healthy/domain/utils/enums/advices_enum.dart';
import 'package:flutter/material.dart';

class AdviceWidget extends StatelessWidget {
  const AdviceWidget({
    Key? key,
    required this.typeAdvice,
    required this.description,
  }) : super(key: key);

  final Advices typeAdvice;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(children: [
        Text(
          advicesTitles[typeAdvice]!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.teal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 250,
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
