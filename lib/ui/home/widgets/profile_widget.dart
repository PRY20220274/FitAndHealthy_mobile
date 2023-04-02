import 'package:fit_healthy/domain/utils/utils/date_util.dart';
import 'package:flutter/material.dart';


class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {

    final DateTime date = DateTime.now();

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: 30,
          child: Container(
            height: 7,
            width: size.width,
            color: Colors.teal.shade700,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 25,
          child: CircleAvatar(
            backgroundColor: Colors.teal.shade100,
            backgroundImage:
                const AssetImage('assets/images/woman_profile.png'),
            radius: 60,
          ),
        ),
        const Positioned(
          left: 155,
          bottom: 40,
          child: Text(
            "Hola, Maria",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 10,
          child: Text(
            formatDateToString(date),
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}