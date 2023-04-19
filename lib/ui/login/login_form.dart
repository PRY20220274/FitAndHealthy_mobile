import 'package:fit_healthy/business/auth/auth_provider.dart';
import 'package:fit_healthy/business/goals/goals_provider.dart';
import 'package:fit_healthy/domain/models/auth/user_login.dart';
import 'package:fit_healthy/ui/main/main_page.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:fit_healthy/ui/shared/transition_page_route.dart';
import 'package:fit_healthy/ui/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInform extends StatelessWidget {
  const LogInform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    UserLogin _userLogin = UserLogin(email: '', password: '');

    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Email', fillColor: Colors.white),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => _userLogin.email = value,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: appInputDecoration(
                      labelText: 'Contraseña', fillColor: Colors.white),
                  autocorrect: false,
                  onChanged: (value) => _userLogin.password = value,
                ),
              ),
              const SizedBox(height: 24),
              AppFilledButton(
                  text: 'Iniciar Sesion',
                  onPressed: () async {
                    await authProvider.signIn(_userLogin);
                    Provider.of<GoalsProvider>(context, listen: false)
                        .getAllGoals();

                    Navigator.pushReplacement(
                        context,
                        TransitionPageRoute(
                            child: const MainPage(),
                            direction: AxisDirection.left));
                  }),
              const SizedBox(height: 72),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('¿No tienes una cuenta?'),
              ),
              AppFilledButton(
                  text: 'Crea tu cuenta',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        TransitionPageRoute(
                            child: const SignUpPage(),
                            direction: AxisDirection.left));
                  }),
            ],
          ));
    });
  }
}
