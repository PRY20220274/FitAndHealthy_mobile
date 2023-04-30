import 'package:fit_healthy/business/shared/navigation_provider.dart';
import 'package:fit_healthy/ui/goals/goals_page.dart';
import 'package:fit_healthy/ui/home/home_page.dart';
import 'package:fit_healthy/ui/suggestions/suggestions_list_page.dart';
import 'package:fit_healthy/ui/physical_activity/physical_activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppMainPagesWidget extends StatelessWidget {
  const AppMainPagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        GoalsPage(),
        SuggestionsListPage(),
        HomePage(),
        PhysicalActivityPage(),
      ],
    );
  }
}
