import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  List typeGender = ['Femenino', 'Masculino'];
  String? seletedTypeGender;

  DateTime currentDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

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
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Sexo', fillColor: Colors.white),
                  autocorrect: false),
            ),*/
            DropdownButtonFormField(
              items: typeGender.map((item) {
                return DropdownMenuItem(child: Text(item), value: item);
              }).toList(),
              dropdownColor: Colors.white,
              decoration: appInputDecoration(
                  labelText: 'Sexo', fillColor: Colors.white),
              onChanged: (value) {
                setState(() {
                  seletedTypeGender = value.toString();
                });
              },
              value: seletedTypeGender,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: appInputDecoration(
                    labelText: 'Fecha de Nacimiento', fillColor: Colors.white),
                autocorrect: false,
                onTap: () async {
                  // bloquear keyborad por un momento
                  FocusManager.instance.primaryFocus?.unfocus();

                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1930),
                      lastDate: DateTime.now());

                  if (newDate == null) return;
                  setState(() {
                    currentDate = newDate;
                  });

                  dateController.text =
                      currentDate.toIso8601String().split('T')[0];
                },
                controller: dateController,
                //onSaved: ,
              ),
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
                autocorrect: false,
                obscureText: true,
              ),
            ),
            const SizedBox(height: 24),
            AppFilledButton(
                text: 'Registrarme',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      TransitionPageRoute(
                          child: const MainPage(),
                          direction: AxisDirection.left));
                })
          ],
        ));
  }
}
