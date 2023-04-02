import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /*ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),*/
            Text('Bienvenidos a Fit and Healthy',
                style: Theme.of(context).textTheme.headline4),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  children: [
                    const Text(
                        'Iniciar Sesion'), /*TextFormField(onChanged: (value) => )*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
