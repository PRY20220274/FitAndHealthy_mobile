import 'package:fit_healthy/business/auth/signup_provider.dart';
import 'package:fit_healthy/business/form/signup_form_provider.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final signUpFormProvider = Provider.of<SignUpFormProvider>(context);
    final signUpProvider = Provider.of<SignUpProvider>(context);

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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    signUpFormProvider.buildUserSignUp(firstName: value),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField(
              items: typeGender.map((item) {
                return DropdownMenuItem(child: Text(item), value: item);
              }).toList(),
              dropdownColor: Colors.white,
              decoration: appInputDecoration(
                  labelText: 'Sexo', fillColor: Colors.white),
              onChanged: (value) =>
                  signUpFormProvider.buildUserSignUp(gender: value.toString()),
              /*{
                setState(() {
                  seletedTypeGender = value.toString();
                });
              },*/
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
                  /*setState(() {
                    currentDate = newDate;
                  });*/
                  signUpFormProvider.buildUserSignUp(birthDate: newDate);

                  dateController.text =
                      signUpFormProvider.userSignUp.birthDate.toIso8601String().split('T')[0];
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
                autocorrect: false,
                onChanged: (value) =>
                    signUpFormProvider.buildUserSignUp(email: value),
              ),
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
                onChanged: (value) =>
                    signUpFormProvider.buildUserSignUp(password: value),
              ),
            ),
            const SizedBox(height: 24),
            AppFilledButton(
                text: 'Registrarme',
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await signUpProvider.signUp(signUpFormProvider.userSignUp);

                  if (!signUpProvider.isLoading && signUpProvider.userCreated) {
                    Navigator.pushReplacement(
                        context,
                        TransitionPageRoute(
                            child: const MainPage(),
                            direction: AxisDirection.left));
                  }
                })
          ],
        ));
  }
}
