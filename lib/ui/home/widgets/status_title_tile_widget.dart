import 'package:flutter/material.dart';

class StatusTitleTileWidget extends StatelessWidget {
  const StatusTitleTileWidget({
    Key? key,
    required this.title,
    this.icon,
    this.imageNameAsset = "404-error.png",
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String imageNameAsset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue.shade900,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              )
            :
            Image.asset(
                "assets/images/$imageNameAsset",
                width: 32,
                height: 32,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
        const SizedBox(width: 8),
        const Text(
          "Estado Físico",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
