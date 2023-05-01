import 'package:fit_healthy/business/userdata/user_data_provider.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/domain/utils/utils/date_util.dart';
import 'package:fit_healthy/ui/login/login_page.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    final userName = Provider.of<UserDataProvider>(context).userName;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 10,
          right: 12,
          child: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'signout') {
                debugPrint('que fue');
                Navigator.pushReplacement(
                  context,
                  TransitionPageRoute(
                    child: const LogInPage(),
                    direction: AxisDirection.right,
                  ),
                );
              }
            },
            itemBuilder: (ctx) {
              return const [
                PopupMenuItem(
                  child: Text('Cerrar sesión'),
                  value: 'signout',
                )
              ];
            },
          ),
        ),
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
            backgroundColor: Palette.green.shade50, //Colors.teal.shade100,
            backgroundImage:
                const AssetImage('assets/images/woman_profile.png'),
            radius: 60,
          ),
        ),
        Positioned(
          left: 155,
          bottom: 40,
          child: Text(
            'Hola, $userName',
            style: const TextStyle(
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
