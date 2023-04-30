import 'package:fit_healthy/domain/models/forms/form_read.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_create.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_read.dart';
import 'package:fit_healthy/persistence/remote/implements/form_repository.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final FormRepository _formRepository;

  FormProvider(this._formRepository);

  late bool _isLoading = false;
  late String _errorMessage = '';

  late FormRead? _formRead = null;
  late QuestionnaireRead _questionnaireRead =
      QuestionnaireRead(id: 0, scale: '', score: 0);
  late List<int> _answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  late QuestionnaireCreate _questionnaireCreate = QuestionnaireCreate(
      questionnaire: 0, answers: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FormRead? get formRead => _formRead;
  QuestionnaireRead get questionnaireRead => _questionnaireRead;
  QuestionnaireCreate get questionnaireCreate => _questionnaireCreate;
  List<int> get answers => _answers;

  Future<void> getFormByCategory(String categoryId) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _formRepository.getFormByCategory(categoryId);
      _isLoading = false;

      _formRead = result;
      print('====getForm  $_formRead');

      notifyListeners();
    } on Exception catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }

  void setformRead(FormRead? newForm) {
    _formRead = newForm;
    _answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    _questionnaireCreate = QuestionnaireCreate(
        questionnaire: 0, answers: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  }

  Future<void> postQuestionnaire(QuestionnaireCreate answers) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _formRepository.postQuestionnaire(answers);
      _isLoading = false;

      _questionnaireRead = result;
      print('====_questionnaireRead  $_questionnaireRead');

      notifyListeners();
    } on Exception catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }

  void setAnswers(int index, int value) {
    _answers[index] = value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
