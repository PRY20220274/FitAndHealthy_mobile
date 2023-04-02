import 'package:fit_healthy/ui/home/home_page.dart';
import 'package:fit_healthy/ui/main/widgets/app_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: HomePage(),
      bottomNavigationBar: AppNavigationBarWidget(),
    );
  }
}
