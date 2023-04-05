import 'package:fit_healthy/ui/signup/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.contain, width: size.width * 0.25),
              ),
              const SizedBox(height: 12),
              Text('Sé parte de Fit and Healthy',
                  style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 12),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).colorScheme.secondary),
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.all(24),
                  child: Column(
                    children: const [
                      Text(
                        'Crear Cuenta',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      SignUpForm()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}