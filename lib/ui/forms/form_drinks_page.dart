import 'package:fit_healthy/business/form/form_provider.dart';
import 'package:fit_healthy/ui/forms/widgets/question_widget.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDrinksPage extends StatelessWidget {
  const FormDrinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = Provider.of<FormProvider>(context).formRead;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: _form != null
                ? Column(
                    children: [
                      TitlePageWidget(
                        title: _form.name,
                      ),
                      ..._form.questions.map((e) {
                        int index = _form.questions.indexOf(e);
                        return QuestionWidget(question: e, index: index);
                      })
                    ],
                  )
                : const Text('Cargando')),
      ),
    );
  }
}
