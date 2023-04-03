

import 'package:fit_healthy/business/shared/navigation_provider.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/goals/goals_list_page.dart';
import 'package:fit_healthy/ui/goals/goals_page.dart';
import 'package:fit_healthy/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppMainPagesWidget extends StatelessWidget {
  const AppMainPagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context); 
    return PageView(
      controller: navigationProvider.pageController,
      physics:  const NeverScrollableScrollPhysics(),
      children: [
        const GoalsPage(),
        const GoalsListPage(),
         const HomePage(),
        Container(
          color: Palette.green.shade200,
        ),
      ],
    );
  }
}