import 'package:fit_healthy/business/shared/navigation_provider.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppNavigationBarWidget extends StatelessWidget {
  const AppNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);
    

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationProvider.currentPos,
      onTap: (value) {
        if (value == navigationProvider.currentPos) return;
        navigationProvider.currentPos = value;
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Palette.green,
      selectedItemColor: Palette.green.shade50,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.track_changes_outlined),
          label: "aaa"
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check_circle_sharp),
          label: ""
        ),
      ],
    );
  }
}