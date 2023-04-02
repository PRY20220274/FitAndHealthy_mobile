import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:fit_healthy/ui/login/login_page.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("es_ES");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
              onSurface: Colors.black,
              primaryVariant: Palette.green.shade50,
              secondaryVariant: Palette.green.shade50)),
      /*home: const MyHomePage(title: 'fit and Health'),*/
      home: const LogInPage(),
      //home: const MainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
