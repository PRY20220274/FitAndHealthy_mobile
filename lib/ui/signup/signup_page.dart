import 'package:fit_healthy/business/form/signup_form_provider.dart';
import 'package:fit_healthy/ui/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<SignUpFormProvider>(context, listen: false).resetUserSignUp();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
              ),
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
