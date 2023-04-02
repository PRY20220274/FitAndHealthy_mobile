import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppNavigationBarWidget extends StatelessWidget {
  const AppNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.teal,
      items: [
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