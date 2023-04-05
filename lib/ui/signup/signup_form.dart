import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Nombre', fillColor: Colors.white),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Sexo', fillColor: Colors.white),
                  autocorrect: false),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Fecha de Nacimiento',
                      fillColor: Colors.white),
                  autocorrect: false),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Email', fillColor: Colors.white),
                  autocorrect: false),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Contraseña', fillColor: Colors.white),
                  autocorrect: false),
            ),
            const SizedBox(height: 24),
            AppFilledButton(text: 'Registrarme', onPressed: () {})
          ],
        ));
  }
}