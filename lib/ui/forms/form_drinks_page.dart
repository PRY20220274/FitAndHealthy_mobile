import 'package:fit_healthy/business/form/form_provider.dart';
import 'package:fit_healthy/ui/forms/widgets/question_widget.dart';
import 'package:fit_healthy/ui/shared/app_filled_button.dart';
import 'package:fit_healthy/ui/shared/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDrinksPage extends StatelessWidget {
  const FormDrinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = Provider.of<FormProvider>(context).formRead;
    final _formProvider = Provider.of<FormProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Provider.of<FormProvider>(context, listen: false).setformRead(null);
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
                    }),
                    AppFilledButton(
                      text: 'Guardar Respuestas',
                      onPressed: () async {
                        _formProvider.questionnaireCreate.questionnaire =
                            _form.id;
                        _formProvider.questionnaireCreate.answers =
                            _formProvider.answers
                                .sublist(0, _form.questions.length);
                        await _formProvider.postQuestionnaire(
                            _formProvider.questionnaireCreate);

                        _formProvider.setformRead(null);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
