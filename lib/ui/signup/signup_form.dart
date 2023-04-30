import 'package:fit_healthy/business/auth/signup_provider.dart';
import 'package:fit_healthy/business/form/signup_form_provider.dart';
import 'package:fit_healthy/business/iot/iot_provider.dart';
import 'package:fit_healthy/business/web_view/google_fit_web_view_provider.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:fit_healthy/ui/web_view/google_fit_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
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

                  dateController.text = signUpFormProvider.userSignUp.birthDate
                      .toIso8601String()
                      .split('T')[0];
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
                keyboardType: TextInputType.emailAddress,
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
            if (signUpProvider.isLoading)
              const Center(child: CircularProgressIndicator()),
            if (!signUpProvider.isLoading)
              AppFilledButton(
                  text: 'Registrarme',
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    await signUpProvider.signUp(signUpFormProvider.userSignUp);

                    await Provider.of<GoogleFiWebViewProvider>(
                      context,
                      listen: false,
                    ).getGoogleAuthenticationUrl();

                    _showDialogWelcome(context);
                  })
          ],
        ));
  }

  void _showDialogWelcome(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 300,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 8, right: 8),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                  ),
                ),
                const SizedBox(height: 18),
                const Center(
                    child: Text(
                        '¡Bienvenid@!\nTe contamos que Fit and Healthy, usa datos de Google Fit, Dale click en aceptar para terminar tu registro.',
                        textAlign: TextAlign.center)),
                const SizedBox(height: 18),
                AppFilledButton(
                    text: 'Aceptar',
                    onPressed: () {
                      Provider.of<GoogleFiWebViewProvider>(
                        context,
                        listen: false,
                      ).initialize();

                      Navigator.pushReplacement(
                          context,
                          TransitionPageRoute(
                              //child: const MainPage(),
                              child: const GoogleFitWebViewPage(),
                              direction: AxisDirection.left));
                      /*Navigator.of(context).pop();
                      _launchURL(context);*/
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
