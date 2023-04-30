import 'package:fit_healthy/ui/main/widgets/app_main_pages_widget.dart';
import 'package:fit_healthy/ui/main/widgets/app_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: AppMainPagesWidget(),
      bottomNavigationBar: AppNavigationBarWidget(),
    );
  }
}
