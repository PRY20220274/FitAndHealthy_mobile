import 'package:fit_healthy/ui/shared/app_input_decoration.dart';
import 'package:flutter/material.dart';

class PhysicalGoalsCreate extends StatelessWidget {
  const PhysicalGoalsCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: const [
                    Text('Frecuencia:'),
                  ]),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                        decoration: appInputDecoration(
                            labelText: '',
                            fillColor: Theme.of(context).colorScheme.secondary),
                        autocorrect: false),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: const [
                    Text('Pasos:'),
                  ]),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                        decoration: appInputDecoration(
                            labelText: '',
                            fillColor: Theme.of(context).colorScheme.secondary),
                        autocorrect: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(children: const [
                    Text('Kilómetros a recorrer:'),
                  ]),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TextFormField(
                        decoration: appInputDecoration(
                            labelText: '',
                            fillColor: Theme.of(context).colorScheme.secondary),
                        autocorrect: false),
                  ),
                  const SizedBox(width: 24),
                  Column(children: const [
                    Text('Km'),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}