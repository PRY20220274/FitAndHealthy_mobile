import 'package:fit_healthy/business/shared/navigation_provider.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/login/login_page.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting("es_ES");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
            colorScheme: ColorScheme(
                primary: Palette.green.shade200,
                secondary: Palette.green.shade50,
                surface: Colors.white,
                error: Colors.red,
                background: Colors.white,
                brightness: Brightness.light,
                onBackground: Colors.black,
                onError: Colors.white,
                onPrimary: Colors.black,
                onSecondary: Colors.black,
                onSurface: Colors.black,)),
                //primaryVariant: Palette.green.shade50,
                //secondaryVariant: Palette.green.shade50)),
        /*home: const MyHomePage(title: 'fit and Health'),*/
        home: const LogInPage(),
        //home: const MainPage(),
      ),
    );
  }
}
