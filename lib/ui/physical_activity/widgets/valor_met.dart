import 'package:flutter/material.dart';

class ValorMet extends StatelessWidget {
  const ValorMet(
      {Key? key,
      required this.imageIcon,
      required this.text,
      required this.valueMet})
      : super(key: key);

  final String imageIcon;
  final String text;
  final String valueMet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: Image.asset('assets/images/$imageIcon', height: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text),
            flex: 9,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '$valueMet MET',
              style: const TextStyle(fontWeight: FontWeight.bold),
              //textAlign: TextAlign.right
            ),
          ),
        ],
      ),
    );
  }
}
