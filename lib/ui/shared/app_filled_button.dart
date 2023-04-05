import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final Size minimunSize;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;

  const AppFilledButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.minimunSize = const Size(180, 50),
      this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimunSize,
        primary: color ?? Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          if (icon != null) Icon(icon),
        ],
      ),
      onPressed: onPressed,
    );
  }
}