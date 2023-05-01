import 'package:fit_healthy/business/auth/auth_provider.dart';
import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/business/iot/iot_provider.dart';
import 'package:fit_healthy/business/shared/types_provider.dart';
import 'package:fit_healthy/business/suggestion/suggestion_provider.dart';
import 'package:fit_healthy/business/web_view/google_fit_web_view_provider.dart';
import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/ui/home/home_page.dart';
import 'package:fit_healthy/ui/login/login_page.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleFitWebViewPage extends StatelessWidget {
  const GoogleFitWebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleFiWebViewProvider>(context);
    //final completerController = Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
        leading: backArrow(context, provider.controller),
        title: const Text('Google Fit'),
        actions: [
          exitNav(context, provider),
        ],
      ),
      body: WebViewWidget(
        controller: provider.controller,
      ),
    );
  }

  Widget backArrow(BuildContext context, WebViewController controller) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () async {
        if (await controller.canGoBack()) {
          
          await controller.goBack();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No back history item')),
          );
          return;
        }
      },
    );
  }

  Widget exitNav(BuildContext context, GoogleFiWebViewProvider provider) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () async {
        provider.getCode(develop: false);
        if (provider.code.length > 1) {
          // borrar
          /*await Provider.of<AuthProvider>(context, listen: false).signIn(UserLogin(
            email: 'richard.work.aenza@gmail.com',
            password: 'richard98',
          ));
          // borrar

          Provider.of<GoalsProvider>(context, listen: false).getAllGoals();
          Provider.of<IotProvider>(context, listen: false).getPhysicalData();
          Provider.of<SuggestionProvider>(context, listen: false)
              .getSuggestionsToday();
          Provider.of<SuggestionProvider>(context, listen: false)
              .getAllSuggestions();
          Provider.of<TypesProvider>(context, listen: false).getAllTypes();*/

          Navigator.pushAndRemoveUntil(
            context,
            TransitionPageRoute(
              child: const LogInPage(),
              direction: AxisDirection.left,
            ),
            ModalRoute.withName('/'),
          );
        }
      },
    );
  }
}
